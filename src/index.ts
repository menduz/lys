import { ParsingContext } from './compiler/ParsingContext';
import { failWithErrors } from './compiler/findAllErrors';
import { CanonicalPhaseResult } from './compiler/phases/canonicalPhase';
import { SemanticPhaseResult } from './compiler/phases/semanticPhase';
import { ScopePhaseResult } from './compiler/phases/scopePhase';
import { TypePhaseResult } from './compiler/phases/typePhase';
import { CompilationPhaseResult } from './compiler/phases/compilationPhase';
import { CodeGenerationPhaseResult } from './compiler/phases/codeGenerationPhase';
import { LysError } from './utils/errorPrinter';
import { System } from './compiler/System';

export { ParsingContext, System };

export function compile(parsingContext: ParsingContext, entryPoint: string) {
  const parsing = parsingContext.getParsingPhaseForFile(entryPoint);
  failWithErrors(`Parsing phase`, parsingContext);

  if (!parsing || !parsing.document) {
    throw new LysError(`The document ${entryPoint} is empty`);
  }

  const canonical = new CanonicalPhaseResult(parsing);
  failWithErrors(`Canonical phase`, parsingContext);

  const semantic = new SemanticPhaseResult(canonical, 'test');
  failWithErrors(`Semantic phase`, parsingContext);

  const scope = new ScopePhaseResult(semantic);
  failWithErrors(`Scope phase`, parsingContext);

  const types = new TypePhaseResult(scope);
  types.execute();
  failWithErrors(`Type phase`, parsingContext);

  const compilation = new CompilationPhaseResult(types);
  failWithErrors(`Compilation phase`, parsingContext);

  const codeGen = new CodeGenerationPhaseResult(compilation);
  failWithErrors(`Code generation phase`, parsingContext);

  return codeGen;
}
