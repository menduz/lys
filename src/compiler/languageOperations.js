"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const types_1 = require("../parser/types");
const ast = require("@webassemblyjs/ast");
const f32Type = new types_1.f32();
const booleanType = new types_1.bool();
const i32Type = new types_1.i32();
exports.binaryOperations = [
    {
        lhsType: booleanType,
        rhsType: booleanType,
        outputType: booleanType,
        operator: 'and',
        generateCode: (lhs, rhs) => ast.instruction('i32.ne', [
            ast.instruction('i32.and', [lhs, rhs]),
            ast.objectInstruction('const', 'i32', [ast.numberLiteralFromRaw(0)])
        ])
    },
    {
        lhsType: booleanType,
        rhsType: booleanType,
        outputType: booleanType,
        operator: 'or',
        generateCode: (lhs, rhs) => ast.instruction('i32.ne', [
            ast.instruction('i32.or', [lhs, rhs]),
            ast.objectInstruction('const', 'i32', [ast.numberLiteralFromRaw(0)])
        ])
    },
    // INT
    {
        lhsType: i32Type,
        rhsType: i32Type,
        outputType: i32Type,
        operator: '+',
        generateCode: (lhs, rhs) => ast.instruction('i32.add', [lhs, rhs])
    },
    {
        lhsType: i32Type,
        rhsType: i32Type,
        outputType: i32Type,
        operator: '-',
        generateCode: (lhs, rhs) => ast.instruction('i32.sub', [lhs, rhs])
    },
    {
        lhsType: i32Type,
        rhsType: i32Type,
        outputType: i32Type,
        operator: '*',
        generateCode: (lhs, rhs) => ast.instruction('i32.mul', [lhs, rhs])
    },
    {
        lhsType: i32Type,
        rhsType: i32Type,
        outputType: i32Type,
        operator: '/',
        generateCode: (lhs, rhs) => ast.instruction('i32.div_s', [lhs, rhs])
    },
    {
        lhsType: i32Type,
        rhsType: i32Type,
        outputType: i32Type,
        operator: '^',
        generateCode: (lhs, rhs) => ast.instruction('i32.xor', [lhs, rhs])
    },
    {
        lhsType: i32Type,
        rhsType: i32Type,
        outputType: booleanType,
        operator: '==',
        generateCode: (lhs, rhs) => ast.instruction('i32.eq', [lhs, rhs])
    },
    {
        lhsType: i32Type,
        rhsType: i32Type,
        outputType: booleanType,
        operator: '>=',
        generateCode: (lhs, rhs) => ast.instruction('i32.ge_s', [lhs, rhs])
    },
    {
        lhsType: i32Type,
        rhsType: i32Type,
        outputType: booleanType,
        operator: '<=',
        generateCode: (lhs, rhs) => ast.instruction('i32.le_s', [lhs, rhs])
    },
    {
        lhsType: i32Type,
        rhsType: i32Type,
        outputType: booleanType,
        operator: '>',
        generateCode: (lhs, rhs) => ast.instruction('i32.gt_s', [lhs, rhs])
    },
    {
        lhsType: i32Type,
        rhsType: i32Type,
        outputType: booleanType,
        operator: '<',
        generateCode: (lhs, rhs) => ast.instruction('i32.lt_s', [lhs, rhs])
    },
    {
        lhsType: i32Type,
        rhsType: i32Type,
        outputType: booleanType,
        operator: '!=',
        generateCode: (lhs, rhs) => ast.instruction('i32.ne', [lhs, rhs])
    },
    // FLOAT
    {
        lhsType: f32Type,
        rhsType: f32Type,
        outputType: f32Type,
        operator: '+',
        generateCode: (lhs, rhs) => ast.instruction('f32.add', [lhs, rhs])
    },
    {
        lhsType: f32Type,
        rhsType: f32Type,
        outputType: f32Type,
        operator: '-',
        generateCode: (lhs, rhs) => ast.instruction('f32.sub', [lhs, rhs])
    },
    {
        lhsType: f32Type,
        rhsType: f32Type,
        outputType: f32Type,
        operator: '*',
        generateCode: (lhs, rhs) => ast.instruction('f32.mul', [lhs, rhs])
    },
    {
        lhsType: f32Type,
        rhsType: f32Type,
        outputType: f32Type,
        operator: '/',
        generateCode: (lhs, rhs) => ast.instruction('f32.div', [lhs, rhs])
    }
];
function findBuiltInTypedBinaryOperation(operator, lhsType, rhsType) {
    const subset = exports.binaryOperations.filter($ => $.operator == operator);
    const ret = subset.find($ => lhsType.equals($.lhsType) && rhsType.equals($.rhsType));
    if (!ret)
        throw new Error(`Cannot resolve type of ${lhsType} (${operator}) ${rhsType}`);
    return ret;
}
exports.findBuiltInTypedBinaryOperation = findBuiltInTypedBinaryOperation;
//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoibGFuZ3VhZ2VPcGVyYXRpb25zLmpzIiwic291cmNlUm9vdCI6IiIsInNvdXJjZXMiOlsibGFuZ3VhZ2VPcGVyYXRpb25zLnRzIl0sIm5hbWVzIjpbXSwibWFwcGluZ3MiOiI7O0FBQUEsMkNBQXVEO0FBRXZELDBDQUEwQztBQVUxQyxNQUFNLE9BQU8sR0FBRyxJQUFJLFdBQUcsRUFBRSxDQUFDO0FBQzFCLE1BQU0sV0FBVyxHQUFHLElBQUksWUFBSSxFQUFFLENBQUM7QUFDL0IsTUFBTSxPQUFPLEdBQUcsSUFBSSxXQUFHLEVBQUUsQ0FBQztBQUViLFFBQUEsZ0JBQWdCLEdBQXNCO0lBQ2pEO1FBQ0UsT0FBTyxFQUFFLFdBQVc7UUFDcEIsT0FBTyxFQUFFLFdBQVc7UUFDcEIsVUFBVSxFQUFFLFdBQVc7UUFDdkIsUUFBUSxFQUFFLEtBQUs7UUFDZixZQUFZLEVBQUUsQ0FBQyxHQUFHLEVBQUUsR0FBRyxFQUFFLEVBQUUsQ0FDekIsR0FBRyxDQUFDLFdBQVcsQ0FBQyxRQUFRLEVBQUU7WUFDeEIsR0FBRyxDQUFDLFdBQVcsQ0FBQyxTQUFTLEVBQUUsQ0FBQyxHQUFHLEVBQUUsR0FBRyxDQUFDLENBQUM7WUFDdEMsR0FBRyxDQUFDLGlCQUFpQixDQUFDLE9BQU8sRUFBRSxLQUFLLEVBQUUsQ0FBQyxHQUFHLENBQUMsb0JBQW9CLENBQUMsQ0FBQyxDQUFDLENBQUMsQ0FBQztTQUNyRSxDQUFDO0tBQ0w7SUFDRDtRQUNFLE9BQU8sRUFBRSxXQUFXO1FBQ3BCLE9BQU8sRUFBRSxXQUFXO1FBQ3BCLFVBQVUsRUFBRSxXQUFXO1FBQ3ZCLFFBQVEsRUFBRSxJQUFJO1FBQ2QsWUFBWSxFQUFFLENBQUMsR0FBRyxFQUFFLEdBQUcsRUFBRSxFQUFFLENBQ3pCLEdBQUcsQ0FBQyxXQUFXLENBQUMsUUFBUSxFQUFFO1lBQ3hCLEdBQUcsQ0FBQyxXQUFXLENBQUMsUUFBUSxFQUFFLENBQUMsR0FBRyxFQUFFLEdBQUcsQ0FBQyxDQUFDO1lBQ3JDLEdBQUcsQ0FBQyxpQkFBaUIsQ0FBQyxPQUFPLEVBQUUsS0FBSyxFQUFFLENBQUMsR0FBRyxDQUFDLG9CQUFvQixDQUFDLENBQUMsQ0FBQyxDQUFDLENBQUM7U0FDckUsQ0FBQztLQUNMO0lBRUQsTUFBTTtJQUNOO1FBQ0UsT0FBTyxFQUFFLE9BQU87UUFDaEIsT0FBTyxFQUFFLE9BQU87UUFDaEIsVUFBVSxFQUFFLE9BQU87UUFDbkIsUUFBUSxFQUFFLEdBQUc7UUFDYixZQUFZLEVBQUUsQ0FBQyxHQUFHLEVBQUUsR0FBRyxFQUFFLEVBQUUsQ0FBQyxHQUFHLENBQUMsV0FBVyxDQUFDLFNBQVMsRUFBRSxDQUFDLEdBQUcsRUFBRSxHQUFHLENBQUMsQ0FBQztLQUNuRTtJQUNEO1FBQ0UsT0FBTyxFQUFFLE9BQU87UUFDaEIsT0FBTyxFQUFFLE9BQU87UUFDaEIsVUFBVSxFQUFFLE9BQU87UUFDbkIsUUFBUSxFQUFFLEdBQUc7UUFDYixZQUFZLEVBQUUsQ0FBQyxHQUFHLEVBQUUsR0FBRyxFQUFFLEVBQUUsQ0FBQyxHQUFHLENBQUMsV0FBVyxDQUFDLFNBQVMsRUFBRSxDQUFDLEdBQUcsRUFBRSxHQUFHLENBQUMsQ0FBQztLQUNuRTtJQUNEO1FBQ0UsT0FBTyxFQUFFLE9BQU87UUFDaEIsT0FBTyxFQUFFLE9BQU87UUFDaEIsVUFBVSxFQUFFLE9BQU87UUFDbkIsUUFBUSxFQUFFLEdBQUc7UUFDYixZQUFZLEVBQUUsQ0FBQyxHQUFHLEVBQUUsR0FBRyxFQUFFLEVBQUUsQ0FBQyxHQUFHLENBQUMsV0FBVyxDQUFDLFNBQVMsRUFBRSxDQUFDLEdBQUcsRUFBRSxHQUFHLENBQUMsQ0FBQztLQUNuRTtJQUNEO1FBQ0UsT0FBTyxFQUFFLE9BQU87UUFDaEIsT0FBTyxFQUFFLE9BQU87UUFDaEIsVUFBVSxFQUFFLE9BQU87UUFDbkIsUUFBUSxFQUFFLEdBQUc7UUFDYixZQUFZLEVBQUUsQ0FBQyxHQUFHLEVBQUUsR0FBRyxFQUFFLEVBQUUsQ0FBQyxHQUFHLENBQUMsV0FBVyxDQUFDLFdBQVcsRUFBRSxDQUFDLEdBQUcsRUFBRSxHQUFHLENBQUMsQ0FBQztLQUNyRTtJQUNEO1FBQ0UsT0FBTyxFQUFFLE9BQU87UUFDaEIsT0FBTyxFQUFFLE9BQU87UUFDaEIsVUFBVSxFQUFFLE9BQU87UUFDbkIsUUFBUSxFQUFFLEdBQUc7UUFDYixZQUFZLEVBQUUsQ0FBQyxHQUFHLEVBQUUsR0FBRyxFQUFFLEVBQUUsQ0FBQyxHQUFHLENBQUMsV0FBVyxDQUFDLFNBQVMsRUFBRSxDQUFDLEdBQUcsRUFBRSxHQUFHLENBQUMsQ0FBQztLQUNuRTtJQUNEO1FBQ0UsT0FBTyxFQUFFLE9BQU87UUFDaEIsT0FBTyxFQUFFLE9BQU87UUFDaEIsVUFBVSxFQUFFLFdBQVc7UUFDdkIsUUFBUSxFQUFFLElBQUk7UUFDZCxZQUFZLEVBQUUsQ0FBQyxHQUFHLEVBQUUsR0FBRyxFQUFFLEVBQUUsQ0FBQyxHQUFHLENBQUMsV0FBVyxDQUFDLFFBQVEsRUFBRSxDQUFDLEdBQUcsRUFBRSxHQUFHLENBQUMsQ0FBQztLQUNsRTtJQUNEO1FBQ0UsT0FBTyxFQUFFLE9BQU87UUFDaEIsT0FBTyxFQUFFLE9BQU87UUFDaEIsVUFBVSxFQUFFLFdBQVc7UUFDdkIsUUFBUSxFQUFFLElBQUk7UUFDZCxZQUFZLEVBQUUsQ0FBQyxHQUFHLEVBQUUsR0FBRyxFQUFFLEVBQUUsQ0FBQyxHQUFHLENBQUMsV0FBVyxDQUFDLFVBQVUsRUFBRSxDQUFDLEdBQUcsRUFBRSxHQUFHLENBQUMsQ0FBQztLQUNwRTtJQUNEO1FBQ0UsT0FBTyxFQUFFLE9BQU87UUFDaEIsT0FBTyxFQUFFLE9BQU87UUFDaEIsVUFBVSxFQUFFLFdBQVc7UUFDdkIsUUFBUSxFQUFFLElBQUk7UUFDZCxZQUFZLEVBQUUsQ0FBQyxHQUFHLEVBQUUsR0FBRyxFQUFFLEVBQUUsQ0FBQyxHQUFHLENBQUMsV0FBVyxDQUFDLFVBQVUsRUFBRSxDQUFDLEdBQUcsRUFBRSxHQUFHLENBQUMsQ0FBQztLQUNwRTtJQUNEO1FBQ0UsT0FBTyxFQUFFLE9BQU87UUFDaEIsT0FBTyxFQUFFLE9BQU87UUFDaEIsVUFBVSxFQUFFLFdBQVc7UUFDdkIs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Iiwic291cmNlc0NvbnRlbnQiOlsiaW1wb3J0IHsgVHlwZSwgZjMyLCBpMzIsIGJvb2wgfSBmcm9tICcuLi9wYXJzZXIvdHlwZXMnO1xuXG5pbXBvcnQgKiBhcyBhc3QgZnJvbSAnQHdlYmFzc2VtYmx5anMvYXN0JztcblxuZXhwb3J0IGludGVyZmFjZSBCaW5hcnlPcGVyYXRpb24ge1xuICBsaHNUeXBlOiBUeXBlO1xuICByaHNUeXBlOiBUeXBlO1xuICBvcGVyYXRvcjogc3RyaW5nO1xuICBvdXRwdXRUeXBlOiBUeXBlO1xuICBnZW5lcmF0ZUNvZGUobGhzLCByaHMpO1xufVxuXG5jb25zdCBmMzJUeXBlID0gbmV3IGYzMigpO1xuY29uc3QgYm9vbGVhblR5cGUgPSBuZXcgYm9vbCgpO1xuY29uc3QgaTMyVHlwZSA9IG5ldyBpMzIoKTtcblxuZXhwb3J0IGNvbnN0IGJpbmFyeU9wZXJhdGlvbnM6IEJpbmFyeU9wZXJhdGlvbltdID0gW1xuICB7XG4gICAgbGhzVHlwZTogYm9vbGVhblR5cGUsXG4gICAgcmhzVHlwZTogYm9vbGVhblR5cGUsXG4gICAgb3V0cHV0VHlwZTogYm9vbGVhblR5cGUsXG4gICAgb3BlcmF0b3I6ICdhbmQnLFxuICAgIGdlbmVyYXRlQ29kZTogKGxocywgcmhzKSA9PlxuICAgICAgYXN0Lmluc3RydWN0aW9uKCdpMzIubmUnLCBbXG4gICAgICAgIGFzdC5pbnN0cnVjdGlvbignaTMyLmFuZCcsIFtsaHMsIHJoc10pLFxuICAgICAgICBhc3Qub2JqZWN0SW5zdHJ1Y3Rpb24oJ2NvbnN0JywgJ2kzMicsIFthc3QubnVtYmVyTGl0ZXJhbEZyb21SYXcoMCldKVxuICAgICAgXSlcbiAgfSxcbiAge1xuICAgIGxoc1R5cGU6IGJvb2xlYW5UeXBlLFxuICAgIHJoc1R5cGU6IGJvb2xlYW5UeXBlLFxuICAgIG91dHB1dFR5cGU6IGJvb2xlYW5UeXBlLFxuICAgIG9wZXJhdG9yOiAnb3InLFxuICAgIGdlbmVyYXRlQ29kZTogKGxocywgcmhzKSA9PlxuICAgICAgYXN0Lmluc3RydWN0aW9uKCdpMzIubmUnLCBbXG4gICAgICAgIGFzdC5pbnN0cnVjdGlvbignaTMyLm9yJywgW2xocywgcmhzXSksXG4gICAgICAgIGFzdC5vYmplY3RJbnN0cnVjdGlvbignY29uc3QnLCAnaTMyJywgW2FzdC5udW1iZXJMaXRlcmFsRnJvbVJhdygwKV0pXG4gICAgICBdKVxuICB9LFxuXG4gIC8vIElOVFxuICB7XG4gICAgbGhzVHlwZTogaTMyVHlwZSxcbiAgICByaHNUeXBlOiBpMzJUeXBlLFxuICAgIG91dHB1dFR5cGU6IGkzMlR5cGUsXG4gICAgb3BlcmF0b3I6ICcrJyxcbiAgICBnZW5lcmF0ZUNvZGU6IChsaHMsIHJocykgPT4gYXN0Lmluc3RydWN0aW9uKCdpMzIuYWRkJywgW2xocywgcmhzXSlcbiAgfSxcbiAge1xuICAgIGxoc1R5cGU6IGkzMlR5cGUsXG4gICAgcmhzVHlwZTogaTMyVHlwZSxcbiAgICBvdXRwdXRUeXBlOiBpMzJUeXBlLFxuICAgIG9wZXJhdG9yOiAnLScsXG4gICAgZ2VuZXJhdGVDb2RlOiAobGhzLCByaHMpID0+IGFzdC5pbnN0cnVjdGlvbignaTMyLnN1YicsIFtsaHMsIHJoc10pXG4gIH0sXG4gIHtcbiAgICBsaHNUeXBlOiBpMzJUeXBlLFxuICAgIHJoc1R5cGU6IGkzMlR5cGUsXG4gICAgb3V0cHV0VHlwZTogaTMyVHlwZSxcbiAgICBvcGVyYXRvcjogJyonLFxuICAgIGdlbmVyYXRlQ29kZTogKGxocywgcmhzKSA9PiBhc3QuaW5zdHJ1Y3Rpb24oJ2kzMi5tdWwnLCBbbGhzLCByaHNdKVxuICB9LFxuICB7XG4gICAgbGhzVHlwZTogaTMyVHlwZSxcbiAgICByaHNUeXBlOiBpMzJUeXBlLFxuICAgIG91dHB1dFR5cGU6IGkzMlR5cGUsXG4gICAgb3BlcmF0b3I6ICcvJyxcbiAgICBnZW5lcmF0ZUNvZGU6IChsaHMsIHJocykgPT4gYXN0Lmluc3RydWN0aW9uKCdpMzIuZGl2X3MnLCBbbGhzLCByaHNdKVxuICB9LFxuICB7XG4gICAgbGhzVHlwZTogaTMyVHlwZSxcbiAgICByaHNUeXBlOiBpMzJUeXBlLFxuICAgIG91dHB1dFR5cGU6IGkzMlR5cGUsXG4gICAgb3BlcmF0b3I6ICdeJyxcbiAgICBnZW5lcmF0ZUNvZGU6IChsaHMsIHJocykgPT4gYXN0Lmluc3RydWN0aW9uKCdpMzIueG9yJywgW2xocywgcmhzXSlcbiAgfSxcbiAge1xuICAgIGxoc1R5cGU6IGkzMlR5cGUsXG4gICAgcmhzVHlwZTogaTMyVHlwZSxcbiAgICBvdXRwdXRUeXBlOiBib29sZWFuVHlwZSxcbiAgICBvcGVyYXRvcjogJz09JyxcbiAgICBnZW5lcmF0ZUNvZGU6IChsaHMsIHJocykgPT4gYXN0Lmluc3RydWN0aW9uKCdpMzIuZXEnLCBbbGhzLCByaHNdKVxuICB9LFxuICB7XG4gICAgbGhzVHlwZTogaTMyVHlwZSxcbiAgICByaHNUeXBlOiBpMzJUeXBlLFxuICAgIG91dHB1dFR5cGU6IGJvb2xlYW5UeXBlLFxuICAgIG9wZXJhdG9yOiAnPj0nLFxuICAgIGdlbmVyYXRlQ29kZTogKGxocywgcmhzKSA9PiBhc3QuaW5zdHJ1Y3Rpb24oJ2kzMi5nZV9zJywgW2xocywgcmhzXSlcbiAgfSxcbiAge1xuICAgIGxoc1R5cGU6IGkzMlR5cGUsXG4gICAgcmhzVHlwZTogaTMyVHlwZSxcbiAgICBvdXRwdXRUeXBlOiBib29sZWFuVHlwZSxcbiAgICBvcGVyYXRvcjogJzw9JyxcbiAgICBnZW5lcmF0ZUNvZGU6IChsaHMsIHJocykgPT4gYXN0Lmluc3RydWN0aW9uKCdpMzIubGVfcycsIFtsaHMsIHJoc10pXG4gIH0sXG4gIHtcbiAgICBsaHNUeXBlOiBpMzJUeXBlLFxuICAgIHJoc1R5cGU6IGkzMlR5cGUsXG4gICAgb3V0cHV0VHlwZTogYm9vbGVhblR5cGUsXG4gICAgb3BlcmF0b3I6ICc+JyxcbiAgICBnZW5lcmF0ZUNvZGU6IChsaHMsIHJocykgPT4gYXN0Lmluc3RydWN0aW9uKCdpMzIuZ3RfcycsIFtsaHMsIHJoc10pXG4gIH0sXG4gIHtcbiAgICBsaHNUeXBlOiBpMzJUeXBlLFxuICAgIHJoc1R5cGU6IGkzMlR5cGUsXG4gICAgb3V0cHV0VHlwZTogYm9vbGVhblR5cGUsXG4gICAgb3BlcmF0b3I6ICc8JyxcbiAgICBnZW5lcmF0ZUNvZGU6IChsaHMsIHJocykgPT4gYXN0Lmluc3RydWN0aW9uKCdpMzIubHRfcycsIFtsaHMsIHJoc10pXG4gIH0sXG4gIHtcbiAgICBsaHNUeXBlOiBpMzJUeXBlLFxuICAgIHJoc1R5cGU6IGkzMlR5cGUsXG4gICAgb3V0cHV0VHlwZTogYm9vbGVhblR5cGUsXG4gICAgb3BlcmF0b3I6ICchPScsXG4gICAgZ2VuZXJhdGVDb2RlOiAobGhzLCByaHMpID0+IGFzdC5pbnN0cnVjdGlvbignaTMyLm5lJywgW2xocywgcmhzXSlcbiAgfSxcblxuICAvLyBGTE9BVFxuICB7XG4gICAgbGhzVHlwZTogZjMyVHlwZSxcbiAgICByaHNUeXBlOiBmMzJUeXBlLFxuICAgIG91dHB1dFR5cGU6IGYzMlR5cGUsXG4gICAgb3BlcmF0b3I6ICcrJyxcbiAgICBnZW5lcmF0ZUNvZGU6IChsaHMsIHJocykgPT4gYXN0Lmluc3RydWN0aW9uKCdmMzIuYWRkJywgW2xocywgcmhzXSlcbiAgfSxcbiAge1xuICAgIGxoc1R5cGU6IGYzMlR5cGUsXG4gICAgcmhzVHlwZTogZjMyVHlwZSxcbiAgICBvdXRwdXRUeXBlOiBmMzJUeXBlLFxuICAgIG9wZXJhdG9yOiAnLScsXG4gICAgZ2VuZXJhdGVDb2RlOiAobGhzLCByaHMpID0+IGFzdC5pbnN0cnVjdGlvbignZjMyLnN1YicsIFtsaHMsIHJoc10pXG4gIH0sXG4gIHtcbiAgICBsaHNUeXBlOiBmMzJUeXBlLFxuICAgIHJoc1R5cGU6IGYzMlR5cGUsXG4gICAgb3V0cHV0VHlwZTogZjMyVHlwZSxcbiAgICBvcGVyYXRvcjogJyonLFxuICAgIGdlbmVyYXRlQ29kZTogKGxocywgcmhzKSA9PiBhc3QuaW5zdHJ1Y3Rpb24oJ2YzMi5tdWwnLCBbbGhzLCByaHNdKVxuICB9LFxuICB7XG4gICAgbGhzVHlwZTogZjMyVHlwZSxcbiAgICByaHNUeXBlOiBmMzJUeXBlLFxuICAgIG91dHB1dFR5cGU6IGYzMlR5cGUsXG4gICAgb3BlcmF0b3I6ICcvJyxcbiAgICBnZW5lcmF0ZUNvZGU6IChsaHMsIHJocykgPT4gYXN0Lmluc3RydWN0aW9uKCdmMzIuZGl2JywgW2xocywgcmhzXSlcbiAgfVxuXTtcblxuZXhwb3J0IGZ1bmN0aW9uIGZpbmRCdWlsdEluVHlwZWRCaW5hcnlPcGVyYXRpb24oXG4gIG9wZXJhdG9yOiBzdHJpbmcsXG4gIGxoc1R5cGU6IFR5cGUsXG4gIHJoc1R5cGU6IFR5cGVcbik6IEJpbmFyeU9wZXJhdGlvbiB8IG51bGwge1xuICBjb25zdCBzdWJzZXQgPSBiaW5hcnlPcGVyYXRpb25zLmZpbHRlcigkID0+ICQub3BlcmF0b3IgPT0gb3BlcmF0b3IpO1xuXG4gIGNvbnN0IHJldCA9IHN1YnNldC5maW5kKCQgPT4gbGhzVHlwZS5lcXVhbHMoJC5saHNUeXBlKSAmJiByaHNUeXBlLmVxdWFscygkLnJoc1R5cGUpKTtcblxuICBpZiAoIXJldCkgdGhyb3cgbmV3IEVycm9yKGBDYW5ub3QgcmVzb2x2ZSB0eXBlIG9mICR7bGhzVHlwZX0gKCR7b3BlcmF0b3J9KSAke3Joc1R5cGV9YCk7XG5cbiAgcmV0dXJuIHJldDtcbn1cbiJdfQ==