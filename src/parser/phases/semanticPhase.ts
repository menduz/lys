import { Nodes } from '../nodes';
import { walkPreOrder } from '../walker';
import { Closure } from '../Closure';
import { failIfErrors } from './findAllErrors';
import { PhaseResult } from './PhaseResult';
import { CanonicalPhaseResult } from './canonicalPhase';
import { AstNodeError } from '../NodeError';
import { annotations } from '../annotations';
import { ParsingContext } from '../ParsingContext';
import { printNode } from '../../utils/nodePrinter';

function externDecorator(decorator: Nodes.DecoratorNode, phase: SemanticPhaseResult, target: Nodes.DirectiveNode) {
  if (decorator.arguments.length != 2) {
    phase.parsingContext.messageCollector.error(
      '"extern" requires two arguments, module and function name',
      decorator.decoratorName
    );
  }

  let moduleName: string = null;
  let functionName: string = null;

  if (decorator.arguments[0]) {
    if (decorator.arguments[0] instanceof Nodes.StringLiteral && decorator.arguments[0].value.length) {
      moduleName = decorator.arguments[0].value;
    } else {
      phase.parsingContext.messageCollector.error('module must be a string', decorator.arguments[0]);
    }
  }

  if (decorator.arguments[1]) {
    if (decorator.arguments[1] instanceof Nodes.StringLiteral && decorator.arguments[1].value.length) {
      functionName = decorator.arguments[1].value;
    } else {
      phase.parsingContext.messageCollector.error('functionName must be a string', decorator.arguments[1]);
    }
  }

  if (moduleName && functionName) {
    target.annotate(new annotations.Extern(moduleName, functionName));
  }
}
function exportDecorator(decorator: Nodes.DecoratorNode, phase: SemanticPhaseResult, target: Nodes.FunDirectiveNode) {
  if (decorator.arguments.length > 1) {
    phase.parsingContext.messageCollector.error(
      '"export" accepts one argument, the name of the exported element',
      decorator.decoratorName
    );
  }

  let exportedName: string = null;

  if (decorator.arguments[0]) {
    if (decorator.arguments[0] instanceof Nodes.StringLiteral && decorator.arguments[0].value.length) {
      exportedName = decorator.arguments[0].value;
    } else {
      phase.parsingContext.messageCollector.error('exportedName must be a string', decorator.arguments[0]);
    }
  } else {
    exportedName = target.functionNode.functionName.name;
  }

  if (exportedName) {
    target.annotate(new annotations.Export(exportedName));
  }
}

function inlineDecorator(decorator: Nodes.DecoratorNode, phase: SemanticPhaseResult, target: Nodes.DirectiveNode) {
  if (decorator.arguments.length != 0) {
    phase.parsingContext.messageCollector.error('"inline" takes no arguments', decorator.decoratorName);
  }

  target.annotate(new annotations.Inline());
}

function explicitDecorator(decorator: Nodes.DecoratorNode, phase: SemanticPhaseResult, target: Nodes.DirectiveNode) {
  if (decorator.arguments.length != 0) {
    phase.parsingContext.messageCollector.error('"explicit" takes no arguments', decorator.decoratorName);
  }

  target.annotate(new annotations.Explicit());
}

function processDecorations(node: Nodes.FunDirectiveNode, phase: SemanticPhaseResult) {
  if (node.decorators && node.decorators.length) {
    node.decorators.forEach($ => {
      switch ($.decoratorName.name) {
        case 'extern':
          return externDecorator($, phase, node);
        case 'inline':
          return inlineDecorator($, phase, node);
        case 'explicit':
          return explicitDecorator($, phase, node);
        case 'export':
          return exportDecorator($, phase, node);
        default:
          phase.parsingContext.messageCollector.error(`Unknown decorator "${$.decoratorName.name}"`, $.decoratorName);
      }
    });
  }
}

const overloadFunctions = function(
  document: Nodes.Node & { directives: Nodes.DirectiveNode[] },
  phase: SemanticPhaseResult
) {
  const overloadedFunctions: Map<string, Nodes.OverloadedFunctionNode> = new Map();

  document.directives.slice().forEach((node: Nodes.Node, ix: number) => {
    if (node instanceof Nodes.FunDirectiveNode) {
      processDecorations(node, phase);
      const functionName = node.functionNode.functionName.name;
      const x = overloadedFunctions.get(functionName);
      if (x && x instanceof Nodes.OverloadedFunctionNode) {
        x.functions.push(node);
        node.functionNode.parent = x;
      } else {
        const overloaded = new Nodes.OverloadedFunctionNode(node.astNode);
        overloaded.isPublic = node.isPublic;
        overloaded.annotate(new annotations.Injected());
        overloaded.functionName = Nodes.NameIdentifierNode.fromString(functionName);
        overloaded.functionName.astNode = node.functionNode.functionName.astNode;
        overloaded.functions = [node];
        node.functionNode.parent = overloaded;
        overloadedFunctions.set(functionName, overloaded);
        document.directives[ix] = overloaded;
      }
    } else if (node instanceof Nodes.ImplDirective) {
      overloadFunctions(node, phase);
    }
  });

  document.directives = document.directives.filter($ => !($ instanceof Nodes.FunDirectiveNode));

  return document;
};

function processStruct(node: Nodes.StructDeclarationNode, phase: SemanticPhaseResult): Nodes.DirectiveNode[] {
  const args = node.parameters.map($ => printNode($)).join(', ');
  const typeName = node.declaredName.name;

  const typeDirective = new Nodes.TypeDirectiveNode();
  typeDirective.variableName = node.declaredName;
  const signature = new Nodes.StructTypeNode();
  typeDirective.valueType = signature;

  typeDirective.annotate(new annotations.Injected());

  if (node.parameters.length) {
    const accessors = node.parameters
      .map((param, i) => {
        signature.parameters.push(param);

        const parameterName = param.parameterName.name;
        const parameterType = printNode(param.parameterType);

        if (param.parameterType instanceof Nodes.UnionTypeNode) {
          return `
            // #[getter]
            fun property_${parameterName}(target: ${typeName}): ${parameterType} =
              property$${i}(target)

            // #[setter]
            fun property_${parameterName}(target: ${typeName}, value: ${parameterType}): void =
              property$${i}(target, value)

            #[inline]
            private fun property$${i}(target: ${typeName}): ${parameterType} =
              loadPropertyWithOffset$${i}(target, ${typeName}.^property$${i}_offset)

            #[inline]
            private fun property$${i}(target: ${typeName}, value: ${parameterType}): void =
              storePropertyWithOffset$${i}(target, value, ${typeName}.^property$${i}_offset)


            #[inline]
            private fun loadPropertyWithOffset$${i}(target: ${typeName}, offset: i32): ${parameterType} = %wasm {
              (i64.load
                (i32.add
                  (get_local $offset)
                  (call $addressFromRef (get_local $target))
                )
              )
            }

            #[inline]
            private fun storePropertyWithOffset$${i}(target: ${typeName}, value: ${parameterType}, offset: i32): void = %wasm {
              (i64.store
                (i32.add
                  (get_local $offset)
                  (call $addressFromRef (get_local $target))
                )
                (get_local $value)
              )
            }
          `;
        } else {
          return `
            // #[getter]
            fun property_${parameterName}(target: ${typeName}): ${parameterType} =
              property$${i}(target)

            // #[setter]
            fun property_${parameterName}(target: ${typeName}, value: ${parameterType}): void =
              property$${i}(target, value)

            /* ${param.parameterType.nodeName} */
            #[inline]
            private fun property$${i}(target: ${typeName}): ${parameterType} =
              ${parameterType}.load(target, ${typeName}.^property$${i}_offset)

            #[inline]
            private fun property$${i}(target: ${typeName}, value: ${parameterType}): void =
              ${parameterType}.store(target, value, ${typeName}.^property$${i}_offset)
          `;
        }
      })
      .join('\n');

    const callRefs = node.parameters.map((_, i) => `property$${i}($ref, ${printNode(_.parameterName)})`).join('\n');

    const canonical = new CanonicalPhaseResult(
      phase.parsingContext.getParsingPhaseForContent(
        phase.moduleName + '#' + typeName,
        `
            impl ${typeName} {
              #[inline]
              private fun ${typeName}$discriminant(): i64 = {
                val discriminant: i32 = ${typeName}.^discriminant
                discriminant as i64 << 32
              }

              fun apply(${args}): ${typeName} = {
                var $ref = fromPointer(
                  system::memory::calloc(1, ${typeName}.^byteSize)
                )

                ${callRefs}

                $ref
              }

              private fun fromPointer(ptr: i32): ${typeName} = %wasm {
                (i64.or
                  (call $${typeName}$discriminant)
                  (i64.extend_u/i32 (get_local $ptr))
                )
              }

              fun ==(a: ${typeName}, b: ${typeName}): boolean = %wasm {
                (i64.eq
                  (get_local $a)
                  (get_local $b)
                )
              }

              fun !=(a: ${typeName}, b: ${typeName}): boolean = %wasm {
                (i64.ne
                  (get_local $a)
                  (get_local $b)
                )
              }


              ${accessors}

              fun is(a: ${typeName}): boolean = %wasm {
                (i64.eq
                  (i64.and
                    (i64.const 0xffffffff00000000)
                    (get_local $a)
                  )
                  (call $${typeName}$discriminant)
                )
              }

              fun store(lhs: ref, rhs: ${typeName}, offset: i32): void = %wasm {
                (i64.store
                  (i32.add
                    (get_local $offset)
                    (call $addressFromRef (get_local $lhs))
                  )
                  (get_local $rhs)
                )
              }

              fun load(lhs: ref, offset: i32): ${typeName} = %wasm {
                (i64.load
                  (i32.add
                    (get_local $offset)
                    (call $addressFromRef (get_local $lhs))
                  )
                )
              }
            }
          `
      )
    );

    return [typeDirective, ...canonical.document.directives];
  } else {
    const canonical = new CanonicalPhaseResult(
      phase.parsingContext.getParsingPhaseForContent(
        phase.moduleName + '#' + typeName,
        `
          impl ${typeName} {
            #[inline]
            private fun ${typeName}$discriminant(): i64 = {
              val discriminant: i32 = ${typeName}.^discriminant
              discriminant as i64 << 32
            }

            fun apply(): ${typeName} = %wasm {
              (call $${typeName}$discriminant)
            }

            fun is(a: ${typeName}): boolean = %wasm {
              (i64.eq
                (i64.and
                  (i64.const 0xffffffff00000000)
                  (get_local $a)
                )
                (call $${typeName}$discriminant)
              )
            }

            fun ==(a: ${typeName}, b: ref): boolean = %wasm {
              (i64.eq
                (get_local $a)
                (get_local $b)
              )
            }

            fun !=(a: ${typeName}, b: ref): boolean = %wasm {
              (i64.ne
                (get_local $a)
                (get_local $b)
              )
            }

            fun store(lhs: ref, rhs: ${typeName}, offset: i32): void = %wasm {
              (i64.store
                (i32.add
                  (get_local $offset)
                  (call $addressFromRef (get_local $lhs))
                )
                (get_local $rhs)
              )
            }

            fun load(lhs: ref, offset: i32): ${typeName} = %wasm {
              (i64.load
                (i32.add
                  (get_local $offset)
                  (call $addressFromRef (get_local $lhs))
                )
              )
            }
          }
        `
      )
    );

    return [typeDirective, ...canonical.document.directives];
  }
}

const preprocessStructs = function(
  document: Nodes.Node & { directives: Nodes.DirectiveNode[] },
  phase: SemanticPhaseResult
) {
  document.directives.slice().forEach((node: Nodes.Node) => {
    if (node instanceof Nodes.EnumDirectiveNode) {
      const newTypeNode = new Nodes.TypeDirectiveNode(node.astNode);
      newTypeNode.variableName = node.variableName;
      const union = (newTypeNode.valueType = new Nodes.UnionTypeNode());
      union.of = [];

      const newDirectives: Nodes.DirectiveNode[] = [newTypeNode];
      const implDirectives: Nodes.DirectiveNode[] = [];

      node.declarations.forEach($ => {
        const [decl, ...impl] = processStruct($, phase);
        newDirectives.push(decl);
        implDirectives.push(...impl);
        const refNode = new Nodes.ReferenceNode();
        refNode.variable = Nodes.QNameNode.fromString($.declaredName.name);
        union.of.push(refNode);
      });

      document.directives.splice(document.directives.indexOf(node), 1, ...newDirectives, ...implDirectives);
    } else if (node instanceof Nodes.StructDeclarationNode) {
      const newDirectives = processStruct(node, phase);
      document.directives.splice(document.directives.indexOf(node as any), 1, ...newDirectives);
    }
  });

  return document;
};

const processUnions = function(
  document: Nodes.Node & { directives: Nodes.DirectiveNode[] },
  phase: SemanticPhaseResult
) {
  document.directives.slice().forEach((node: Nodes.Node) => {
    if (node instanceof Nodes.TypeDirectiveNode) {
      const { valueType, variableName } = node;

      if (!valueType) {
        phase.parsingContext.messageCollector.error(`Missing type value`, variableName);
        return;
      }

      if (valueType instanceof Nodes.UnionTypeNode) {
        const referenceTypes = valueType.of.filter($ => $ instanceof Nodes.ReferenceNode) as Nodes.ReferenceNode[];

        if (valueType.of.length != referenceTypes.length) {
          // error?
        }

        let injectedDirectives: string[] = [];
        if (referenceTypes.length) {
          injectedDirectives.push(`
            impl ${node.variableName.name} {
              fun as(a: ${node.variableName.name}): ref = %wasm { (get_local $a) }
            }
          `);

          referenceTypes.forEach($ => {
            injectedDirectives.push(`
              impl ${$.variable.text} {
                fun as(a: ${$.variable.text}): ${node.variableName.name}  = %wasm { (get_local $a) }
              }
            `);
          });
        }

        const canonical = new CanonicalPhaseResult(
          phase.parsingContext.getParsingPhaseForContent(
            phase.moduleName + '#' + node.variableName.name,
            `
              // Union type ${variableName.name}
              impl ${variableName.name} {
                fun is(a: ${node.variableName.name}): boolean = {
                  ${referenceTypes.map($ => 'a is ' + printNode($.variable)).join(' || ') || 'false'}
                }

                fun ==(lhs: ref, rhs: ref): boolean = lhs == rhs
                fun !=(lhs: ref, rhs: ref): boolean = lhs != rhs

                fun store(lhs: ref, rhs: ${variableName.name}, offset: i32): void = %wasm {
                  (i64.store
                    (i32.add
                      (get_local $offset)
                      (call $addressFromRef (get_local $lhs))
                    )
                    (get_local $rhs)
                  )
                }

                fun load(lhs: ref, offset: i32): ${variableName.name} = %wasm {
                  (i64.load
                    (i32.add
                      (get_local $offset)
                      (call $addressFromRef (get_local $lhs))
                    )
                  )
                }
              }

              ${injectedDirectives.join('\n')}
            `
          )
        );

        document.directives.splice(document.directives.indexOf(node) + 1, 0, ...canonical.document.directives);
      }
    }
  });

  return document;
};

const validateSignatures = walkPreOrder((node: Nodes.Node, ctx: SemanticPhaseResult, _1: Nodes.Node) => {
  if (node instanceof Nodes.FunctionNode) {
    let used = [];
    node.parameters.forEach(param => {
      if (used.indexOf(param.parameterName.name) == -1) {
        used.push(param.parameterName.name);
      } else {
        ctx.parsingContext.messageCollector.error(`Duplicated parameter "${param.parameterName.name}"`, param);
      }
    });

    if (!node.functionReturnType) {
      ctx.parsingContext.messageCollector.error('Missing return type in function declaration', node);
    }
  }

  if (node instanceof Nodes.PatternMatcherNode) {
    if (node.matchingSet.length == 0) {
      throw new AstNodeError(`Invalid match expression, there are no matchers`, node);
    }
    if (node.matchingSet.length == 1 && node.matchingSet[0] instanceof Nodes.MatchDefaultNode) {
      throw new AstNodeError(`This match is useless`, node);
    }
  }
});

const validateInjectedWasm = walkPreOrder((node: Nodes.Node, _: SemanticPhaseResult, _1: Nodes.Node) => {
  if (node instanceof Nodes.WasmAtomNode) {
    if (node.symbol == 'call' || node.symbol == 'get_global' || node.symbol == 'set_global') {
      if (!node.arguments[0]) {
        throw new AstNodeError(`Missing name`, node);
      }
      if (node.arguments[0] instanceof Nodes.ReferenceNode == false) {
        throw new AstNodeError(`Here you need a fully qualified name starting with $`, node.arguments[0]);
      }
    }
  }
});

const processDeconstruct = walkPreOrder((node: Nodes.Node, _: SemanticPhaseResult, _parent: Nodes.Node) => {
  if (node instanceof Nodes.MatchCaseIsNode) {
    if (!node.declaredName) {
      node.declaredName = Nodes.NameIdentifierNode.fromString('$');
    }

    if (node.deconstructorNames && node.deconstructorNames.length) {
      /**
       * struct Node(value: i32)
       * match x {
       *   case x is Node(theValue) -> theValue
       *   ...
       * }
       *
       * roughly desugars to
       *
       * struct Node(value: i32)
       * match x {
       *   case x is Node -> {
       *     val theValue = x.value
       *     theValue
       *   }
       *   ...
       * }
       */
      const newBlock = node.rhs instanceof Nodes.BlockNode ? node.rhs : new Nodes.BlockNode(node.rhs.astNode);

      if (!newBlock.statements) {
        newBlock.statements = [];
      }

      node.deconstructorNames.reverse().forEach($ => {
        if ($.name !== '_') {
          const decl = new Nodes.ValDeclarationNode();
          decl.variableName = $;
          const member = new Nodes.MemberNode($.astNode);
          decl.value = member;
          const ref = (member.lhs = new Nodes.ReferenceNode(node.declaredName.astNode));
          ref.variable = Nodes.QNameNode.fromString(node.declaredName.name);
          member.operator = '.';
          member.memberName = new Nodes.NameIdentifierNode($.astNode);
          member.memberName.name = $.name;

          newBlock.statements.unshift(decl);
        }
      });

      node.deconstructorNames.length = 0;

      if (newBlock !== node.rhs) {
        newBlock.statements.push(node.rhs);
        node.rhs = newBlock;
      }
    }
  }
});

export class SemanticPhaseResult extends PhaseResult {
  get document() {
    return this.canonicalPhaseResult.document;
  }

  get parsingContext(): ParsingContext {
    return this.canonicalPhaseResult.parsingContext;
  }

  constructor(public canonicalPhaseResult: CanonicalPhaseResult, public readonly moduleName: string) {
    super();
    this.execute();
    this.document.moduleName = moduleName;
  }

  protected execute() {
    this.document.closure = new Closure(this.parsingContext, null, this.moduleName, 'document_' + this.moduleName);

    preprocessStructs(this.document, this);
    processUnions(this.document, this);

    processDeconstruct(this.document, this);

    overloadFunctions(this.document, this);
    validateSignatures(this.document, this);
    validateInjectedWasm(this.document, this);

    failIfErrors('Semantic phase', this.document, this);
  }
}
