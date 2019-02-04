(module
  (memory 0 1)
  (func $system::core::assert (param $x i32)
    (if $a_wild_if (call $system::core::boolean.== (get_local $x) (i32.const 0))
      (then
        (call $system::core::panic_1)
      )
      (else)
    )
  )
  (func $system::core::addressFromRef (param $pointer i64) (result i32)
    (i32.wrap/i64 (get_local $pointer))
  )
  (func $system::core::panic_1
    (unreachable)
  )
  (func $system::core::u8.sizeOf (result i32)
    (i32.const 1)
  )
  (func $system::core::u8.allocationSize (result i32)
    (call $system::core::u8.sizeOf)
  )
  (func $system::core::u8.as (param $lhs i32) (result i32)
    (get_local $lhs)
  )
  (func $system::core::u8.as_1 (param $lhs i32) (result i32)
    (get_local $lhs)
  )
  (func $system::core::u8.as_2 (param $lhs i32) (result i32)
    (get_local $lhs)
  )
  (func $system::core::u8.as_3 (param $lhs i32) (result i32)
    (get_local $lhs)
  )
  (func $system::core::u8.as_4 (param $lhs i32) (result i64)
    (i64.extend_u/i32 (get_local $lhs))
  )
  (func $system::core::u8.as_5 (param $lhs i32) (result i64)
    (i64.extend_s/i32 (get_local $lhs))
  )
  (func $system::core::u8.as_6 (param $lhs i32) (result f32)
    (f32.convert_u/i32 (get_local $lhs))
  )
  (func $system::core::u8.as_7 (param $lhs i32) (result f64)
    (f64.convert_u/i32 (get_local $lhs))
  )
  (func $system::core::u8.== (param $lhs i32) (param $rhs i32) (result i32)
    (i32.eq (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::u8.==_1 (param $lhs i32) (param $rhs i32) (result i32)
    (i32.eq (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::u8.==_2 (param $lhs i32) (param $rhs i32) (result i32)
    (i32.eq (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::u8.store (param $lhs i64) (param $rhs i32)
    (i32.store8 (call $system::core::addressFromRef (get_local $lhs)) (get_local $rhs))
  )
  (func $system::core::u8.store_1 (param $lhs i64) (param $rhs i32) (param $offset i32)
    (i32.store8 (i32.add (get_local $offset) (call $system::core::addressFromRef (get_local $lhs))) (get_local $rhs))
  )
  (func $system::core::u8.load (param $lhs i64) (result i32)
    (i32.load8_u (call $system::core::addressFromRef (get_local $lhs)))
  )
  (func $system::core::u8.load_1 (param $lhs i64) (param $offset i32) (result i32)
    (i32.load8_u (i32.add (get_local $offset) (call $system::core::addressFromRef (get_local $lhs))))
  )
  (func $system::core::i16.sizeOf (result i32)
    (i32.const 2)
  )
  (func $system::core::i16.allocationSize (result i32)
    (call $system::core::i16.sizeOf)
  )
  (func $system::core::i16.as (param $lhs i32) (result i32)
    (get_local $lhs)
  )
  (func $system::core::i16.as_1 (param $lhs i32) (result i64)
    (i64.extend_s/i32 (get_local $lhs))
  )
  (func $system::core::i16.as_2 (param $lhs i32) (result f32)
    (f32.convert_s/i32 (get_local $lhs))
  )
  (func $system::core::i16.as_3 (param $lhs i32) (result f64)
    (f64.convert_s/i32 (get_local $lhs))
  )
  (func $system::core::i16.== (param $lhs i32) (param $rhs i32) (result i32)
    (i32.eq (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::i16.==_1 (param $lhs i32) (param $rhs i32) (result i32)
    (i32.eq (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::i16.store (param $lhs i64) (param $rhs i32)
    (i32.store16 (call $system::core::addressFromRef (get_local $lhs)) (get_local $rhs))
  )
  (func $system::core::u16.sizeOf (result i32)
    (i32.const 2)
  )
  (func $system::core::u16.allocationSize (result i32)
    (call $system::core::u16.sizeOf)
  )
  (func $system::core::u16.as (param $lhs i32) (result i32)
    (get_local $lhs)
  )
  (func $system::core::u16.as_1 (param $lhs i32) (result i32)
    (get_local $lhs)
  )
  (func $system::core::u16.as_2 (param $lhs i32) (result i64)
    (i64.extend_u/i32 (get_local $lhs))
  )
  (func $system::core::u16.as_3 (param $lhs i32) (result i64)
    (i64.extend_u/i32 (get_local $lhs))
  )
  (func $system::core::u16.as_4 (param $lhs i32) (result f32)
    (f32.convert_u/i32 (get_local $lhs))
  )
  (func $system::core::u16.as_5 (param $lhs i32) (result f64)
    (f64.convert_u/i32 (get_local $lhs))
  )
  (func $system::core::u16.== (param $lhs i32) (param $rhs i32) (result i32)
    (i32.eq (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::u16.==_1 (param $lhs i32) (param $rhs i32) (result i32)
    (i32.eq (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::u16.==_2 (param $lhs i32) (param $rhs i32) (result i32)
    (i32.eq (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::u16.store (param $lhs i64) (param $rhs i32)
    (i32.store16 (call $system::core::addressFromRef (get_local $lhs)) (get_local $rhs))
  )
  (func $system::core::i32.sizeOf (result i32)
    (i32.const 4)
  )
  (func $system::core::i32.allocationSize (result i32)
    (call $system::core::i32.sizeOf)
  )
  (func $system::core::i32.as (param $lhs i32) (result i64)
    (i64.extend_s/i32 (get_local $lhs))
  )
  (func $system::core::i32.as_1 (param $lhs i32) (result f32)
    (f32.convert_s/i32 (get_local $lhs))
  )
  (func $system::core::i32.as_2 (param $lhs i32) (result f64)
    (f64.convert_s/i32 (get_local $lhs))
  )
  (func $system::core::i32.as_3 (param $lhs i32) (result f32)
    (f32.convert_s/i32 (get_local $lhs))
  )
  (func $system::core::i32.== (param $lhs i32) (param $rhs i32) (result i32)
    (i32.eq (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::i32.==_1 (param $lhs i32) (param $rhs i32) (result i32)
    (i32.eq (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::i32.==_2 (param $lhs i32) (param $rhs i32) (result i32)
    (i32.eq (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::i32.!= (param $lhs i32) (param $rhs i32) (result i32)
    (i32.ne (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::i32.& (param $lhs i32) (param $rhs i32) (result i32)
    (i32.and (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::i32.| (param $lhs i32) (param $rhs i32) (result i32)
    (i32.or (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::i32.^ (param $lhs i32) (param $rhs i32) (result i32)
    (i32.xor (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::i32.^_1 (param $lhs i32) (param $rhs i32) (result i32)
    (i32.xor (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::i32.+ (param $lhs i32) (param $rhs i32) (result i32)
    (i32.add (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::i32.- (param $lhs i32) (param $rhs i32) (result i32)
    (i32.sub (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::i32.-_1 (param $rhs i32) (result i32)
    (i32.sub (i32.const 0) (get_local $rhs))
  )
  (func $system::core::i32.* (param $lhs i32) (param $rhs i32) (result i32)
    (i32.mul (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::i32./ (param $lhs i32) (param $rhs i32) (result i32)
    (i32.div_s (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::i32.~ (param $rhs i32) (result i32)
    (i32.xor (i32.const 0xFFFFFFFF) (get_local $rhs))
  )
  (func $system::core::i32.>>> (param $lhs i32) (param $rhs i32) (result i32)
    (i32.shr_u (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::i32.>> (param $lhs i32) (param $rhs i32) (result i32)
    (i32.shr_s (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::i32.<< (param $lhs i32) (param $rhs i32) (result i32)
    (i32.shl (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::i32.>= (param $lhs i32) (param $rhs i32) (result i32)
    (i32.ge_s (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::i32.<= (param $lhs i32) (param $rhs i32) (result i32)
    (i32.le_s (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::i32.> (param $lhs i32) (param $rhs i32) (result i32)
    (i32.gt_s (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::i32.< (param $lhs i32) (param $rhs i32) (result i32)
    (i32.lt_s (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::i32.store (param $lhs i64) (param $rhs i32)
    (i32.store (call $system::core::addressFromRef (get_local $lhs)) (get_local $rhs))
  )
  (func $system::core::i32.store_1 (param $lhs i64) (param $rhs i32) (param $offset i32)
    (i32.store (i32.add (get_local $offset) (call $system::core::addressFromRef (get_local $lhs))) (get_local $rhs))
  )
  (func $system::core::i32.load (param $lhs i64) (result i32)
    (i32.load (call $system::core::addressFromRef (get_local $lhs)))
  )
  (func $system::core::i32.load_1 (param $lhs i64) (param $offset i32) (result i32)
    (i32.load (i32.add (get_local $offset) (call $system::core::addressFromRef (get_local $lhs))))
  )
  (func $system::core::u32.sizeOf (result i32)
    (i32.const 4)
  )
  (func $system::core::u32.allocationSize (result i32)
    (call $system::core::u32.sizeOf)
  )
  (func $system::core::u32.as (param $lhs i32) (result i64)
    (i64.extend_u/i32 (get_local $lhs))
  )
  (func $system::core::u32.as_1 (param $lhs i32) (result i64)
    (i64.extend_u/i32 (get_local $lhs))
  )
  (func $system::core::u32.as_2 (param $lhs i32) (result f32)
    (f32.convert_u/i32 (get_local $lhs))
  )
  (func $system::core::u32.as_3 (param $lhs i32) (result f64)
    (f64.convert_u/i32 (get_local $lhs))
  )
  (func $system::core::u32.as_4 (param $lhs i32) (result i64)
    (i64.extend_s/i32 (get_local $lhs))
  )
  (func $system::core::u32.as_5 (param $lhs i32) (result f32)
    (f32.convert_u/i32 (get_local $lhs))
  )
  (func $system::core::u32.== (param $lhs i32) (param $rhs i32) (result i32)
    (i32.eq (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::u32.==_1 (param $lhs i32) (param $rhs i32) (result i32)
    (i32.eq (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::u32.==_2 (param $lhs i32) (param $rhs i32) (result i32)
    (i32.eq (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::u32.!= (param $lhs i32) (param $rhs i32) (result i32)
    (i32.ne (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::u32.+ (param $lhs i32) (param $rhs i32) (result i32)
    (i32.add (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::u32.- (param $lhs i32) (param $rhs i32) (result i32)
    (i32.sub (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::u32.* (param $lhs i32) (param $rhs i32) (result i32)
    (i32.mul (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::u32./ (param $lhs i32) (param $rhs i32) (result i32)
    (i32.div_u (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::u32.~ (param $rhs i32) (result i32)
    (i32.xor (i32.const 0xFFFFFFFF) (get_local $rhs))
  )
  (func $system::core::u32.>>> (param $lhs i32) (param $rhs i32) (result i32)
    (i32.shr_u (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::u32.>> (param $lhs i32) (param $rhs i32) (result i32)
    (i32.shr_s (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::u32.<< (param $lhs i32) (param $rhs i32) (result i32)
    (i32.shl (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::u32.^ (param $lhs i32) (param $rhs i32) (result i32)
    (i32.xor (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::u32.>= (param $lhs i32) (param $rhs i32) (result i32)
    (i32.ge_u (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::u32.<= (param $lhs i32) (param $rhs i32) (result i32)
    (i32.le_u (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::u32.> (param $lhs i32) (param $rhs i32) (result i32)
    (i32.gt_u (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::u32.< (param $lhs i32) (param $rhs i32) (result i32)
    (i32.lt_u (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::u32.store (param $lhs i64) (param $rhs i32)
    (i32.store (call $system::core::addressFromRef (get_local $lhs)) (get_local $rhs))
  )
  (func $system::core::u32.store_1 (param $lhs i64) (param $rhs i32) (param $offset i32)
    (i32.store (i32.add (get_local $offset) (call $system::core::addressFromRef (get_local $lhs))) (get_local $rhs))
  )
  (func $system::core::u32.load (param $lhs i64) (result i32)
    (i32.load (call $system::core::addressFromRef (get_local $lhs)))
  )
  (func $system::core::u32.load_1 (param $lhs i64) (param $offset i32) (result i32)
    (i32.load (i32.add (get_local $offset) (call $system::core::addressFromRef (get_local $lhs))))
  )
  (func $system::core::i64.sizeOf (result i32)
    (i32.const 8)
  )
  (func $system::core::i64.allocationSize (result i32)
    (call $system::core::i64.sizeOf)
  )
  (func $system::core::i64.as (param $lhs i64) (result f32)
    (f32.convert_s/i64 (get_local $lhs))
  )
  (func $system::core::i64.as_1 (param $lhs i64) (result f64)
    (f64.convert_s/i64 (get_local $lhs))
  )
  (func $system::core::i64.as_2 (param $lhs i64) (result f32)
    (f32.convert_s/i64 (get_local $lhs))
  )
  (func $system::core::i64.as_3 (param $lhs i64) (result i32)
    (i32.wrap/i64 (get_local $lhs))
  )
  (func $system::core::i64.== (param $lhs i64) (param $rhs i64) (result i32)
    (i64.eq (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::i64.==_1 (param $lhs i64) (param $rhs i32) (result i32)
    (i64.eq (get_local $lhs) (i64.extend_s/i32 (get_local $rhs)))
  )
  (func $system::core::i64.==_2 (param $lhs i64) (param $rhs i32) (result i32)
    (i64.eq (get_local $lhs) (i64.extend_s/i32 (get_local $rhs)))
  )
  (func $system::core::i64.!= (param $lhs i64) (param $rhs i64) (result i32)
    (i64.ne (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::i64.+ (param $lhs i64) (param $rhs i64) (result i64)
    (i64.add (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::i64.- (param $lhs i64) (param $rhs i64) (result i64)
    (i64.sub (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::i64.* (param $lhs i64) (param $rhs i64) (result i64)
    (i64.mul (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::i64./ (param $lhs i64) (param $rhs i64) (result i64)
    (i64.div_s (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::i64.~ (param $rhs i64) (result i64)
    (i64.xor (i64.const 0xFFFFFFFFFFFFFFFF) (get_local $rhs))
  )
  (func $system::core::i64.>>> (param $lhs i64) (param $rhs i64) (result i64)
    (i64.shr_u (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::i64.>> (param $lhs i64) (param $rhs i64) (result i64)
    (i64.shr_s (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::i64.<< (param $lhs i64) (param $rhs i64) (result i64)
    (i64.shl (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::i64.^ (param $lhs i64) (param $rhs i64) (result i64)
    (i64.xor (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::i64.>= (param $lhs i64) (param $rhs i64) (result i32)
    (i64.ge_s (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::i64.<= (param $lhs i64) (param $rhs i64) (result i32)
    (i64.le_s (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::i64.> (param $lhs i64) (param $rhs i64) (result i32)
    (i64.gt_s (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::i64.< (param $lhs i64) (param $rhs i64) (result i32)
    (i64.lt_s (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::i64.store (param $lhs i64) (param $rhs i64)
    (i64.store (call $system::core::addressFromRef (get_local $lhs)) (get_local $rhs))
  )
  (func $system::core::i64.store_1 (param $lhs i64) (param $rhs i64) (param $offset i32)
    (i64.store (i32.add (get_local $offset) (call $system::core::addressFromRef (get_local $lhs))) (get_local $rhs))
  )
  (func $system::core::i64.load (param $lhs i64) (result i64)
    (i64.load (call $system::core::addressFromRef (get_local $lhs)))
  )
  (func $system::core::i64.load_1 (param $lhs i64) (param $offset i32) (result i64)
    (i64.load (i32.add (get_local $offset) (call $system::core::addressFromRef (get_local $lhs))))
  )
  (func $system::core::u64.sizeOf (result i32)
    (i32.const 8)
  )
  (func $system::core::u64.allocationSize (result i32)
    (call $system::core::u64.sizeOf)
  )
  (func $system::core::u64.as (param $lhs i64) (result f32)
    (f32.convert_u/i64 (get_local $lhs))
  )
  (func $system::core::u64.as_1 (param $lhs i64) (result f64)
    (f64.convert_u/i64 (get_local $lhs))
  )
  (func $system::core::u64.as_2 (param $lhs i64) (result f32)
    (f32.convert_u/i64 (get_local $lhs))
  )
  (func $system::core::u64.as_3 (param $lhs i64) (result i32)
    (i32.wrap/i64 (get_local $lhs))
  )
  (func $system::core::u64.== (param $lhs i64) (param $rhs i64) (result i32)
    (i64.eq (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::u64.==_1 (param $lhs i64) (param $rhs i32) (result i32)
    (i64.eq (get_local $lhs) (i64.extend_u/i32 (get_local $rhs)))
  )
  (func $system::core::u64.==_2 (param $lhs i64) (param $rhs i32) (result i32)
    (i64.eq (get_local $lhs) (i64.extend_u/i32 (get_local $rhs)))
  )
  (func $system::core::u64.==_3 (param $lhs i64) (param $rhs i32) (result i32)
    (i64.eq (get_local $lhs) (i64.extend_u/i32 (get_local $rhs)))
  )
  (func $system::core::u64.!= (param $lhs i64) (param $rhs i64) (result i32)
    (i64.ne (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::u64.+ (param $lhs i64) (param $rhs i64) (result i64)
    (i64.add (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::u64.- (param $lhs i64) (param $rhs i64) (result i64)
    (i64.sub (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::u64.* (param $lhs i64) (param $rhs i64) (result i64)
    (i64.mul (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::u64./ (param $lhs i64) (param $rhs i64) (result i64)
    (i64.div_u (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::u64.~ (param $rhs i64) (result i64)
    (i64.xor (i64.const 0xFFFFFFFFFFFFFFFF) (get_local $rhs))
  )
  (func $system::core::u64.>>> (param $lhs i64) (param $rhs i64) (result i64)
    (i64.shr_u (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::u64.>> (param $lhs i64) (param $rhs i64) (result i64)
    (i64.shr_s (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::u64.<< (param $lhs i64) (param $rhs i64) (result i64)
    (i64.shl (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::u64.^ (param $lhs i64) (param $rhs i64) (result i64)
    (i64.xor (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::u64.>= (param $lhs i64) (param $rhs i64) (result i32)
    (i64.ge_u (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::u64.<= (param $lhs i64) (param $rhs i64) (result i32)
    (i64.le_u (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::u64.> (param $lhs i64) (param $rhs i64) (result i32)
    (i64.gt_u (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::u64.< (param $lhs i64) (param $rhs i64) (result i32)
    (i64.lt_u (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::u64.store (param $lhs i64) (param $rhs i64)
    (i64.store (call $system::core::addressFromRef (get_local $lhs)) (get_local $rhs))
  )
  (func $system::core::u64.store_1 (param $lhs i64) (param $rhs i64) (param $offset i32)
    (i64.store (i32.add (get_local $offset) (call $system::core::addressFromRef (get_local $lhs))) (get_local $rhs))
  )
  (func $system::core::u64.load (param $lhs i64) (result i64)
    (i64.load (call $system::core::addressFromRef (get_local $lhs)))
  )
  (func $system::core::u64.load_1 (param $lhs i64) (param $offset i32) (result i64)
    (i64.load (i32.add (get_local $offset) (call $system::core::addressFromRef (get_local $lhs))))
  )
  (func $system::core::f32.sizeOf (result i32)
    (i32.const 4)
  )
  (func $system::core::f32.allocationSize (result i32)
    (call $system::core::f32.sizeOf)
  )
  (func $system::core::f32.as (param $lhs f32) (result f64)
    (f64.promote/f32 (get_local $lhs))
  )
  (func $system::core::f32.as_1 (param $lhs f32) (result i64)
    (i64.trunc_s/f32 (get_local $lhs))
  )
  (func $system::core::f32.as_2 (param $lhs f32) (result i64)
    (i64.trunc_u/f32 (get_local $lhs))
  )
  (func $system::core::f32.as_3 (param $lhs f32) (result i32)
    (i32.trunc_s/f32 (get_local $lhs))
  )
  (func $system::core::f32.as_4 (param $lhs f32) (result i32)
    (i32.trunc_u/f32 (get_local $lhs))
  )
  (func $system::core::f32.+ (param $lhs f32) (param $rhs f32) (result f32)
    (f32.add (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::f32.- (param $lhs f32) (param $rhs f32) (result f32)
    (f32.sub (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::f32.* (param $lhs f32) (param $rhs f32) (result f32)
    (f32.mul (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::f32./ (param $lhs f32) (param $rhs f32) (result f32)
    (f32.div (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::f32.== (param $lhs f32) (param $rhs f32) (result i32)
    (f32.eq (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::f32.>= (param $lhs f32) (param $rhs f32) (result i32)
    (f32.ge (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::f32.<= (param $lhs f32) (param $rhs f32) (result i32)
    (f32.le (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::f32.> (param $lhs f32) (param $rhs f32) (result i32)
    (f32.gt (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::f32.< (param $lhs f32) (param $rhs f32) (result i32)
    (f32.lt (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::f32.!= (param $lhs f32) (param $rhs f32) (result i32)
    (f32.ne (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::f32.store (param $lhs i64) (param $rhs f32)
    (f32.store (call $system::core::addressFromRef (get_local $lhs)) (get_local $rhs))
  )
  (func $system::core::f32.store_1 (param $lhs i64) (param $rhs f32) (param $offset i32)
    (f32.store (i32.add (get_local $offset) (call $system::core::addressFromRef (get_local $lhs))) (get_local $rhs))
  )
  (func $system::core::f32.load (param $lhs i64) (result f32)
    (f32.load (call $system::core::addressFromRef (get_local $lhs)))
  )
  (func $system::core::f32.load_1 (param $lhs i64) (param $offset i32) (result f32)
    (f32.load (i32.add (get_local $offset) (call $system::core::addressFromRef (get_local $lhs))))
  )
  (func $system::core::f64.sizeOf (result i32)
    (i32.const 8)
  )
  (func $system::core::f64.allocationSize (result i32)
    (call $system::core::f64.sizeOf)
  )
  (func $system::core::f64.+ (param $lhs f64) (param $rhs f64) (result f64)
    (f64.add (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::f64.- (param $lhs f64) (param $rhs f64) (result f64)
    (f64.sub (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::f64.* (param $lhs f64) (param $rhs f64) (result f64)
    (f64.mul (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::f64./ (param $lhs f64) (param $rhs f64) (result f64)
    (f64.div (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::f64.== (param $lhs f64) (param $rhs f64) (result i32)
    (f64.eq (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::f64.>= (param $lhs f64) (param $rhs f64) (result i32)
    (f64.ge (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::f64.<= (param $lhs f64) (param $rhs f64) (result i32)
    (f64.le (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::f64.> (param $lhs f64) (param $rhs f64) (result i32)
    (f64.gt (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::f64.< (param $lhs f64) (param $rhs f64) (result i32)
    (f64.lt (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::f64.!= (param $lhs f64) (param $rhs f64) (result i32)
    (f64.ne (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::f64.as (param $lhs f64) (result f32)
    (f32.demote/f64 (get_local $lhs))
  )
  (func $system::core::f64.as_1 (param $lhs f64) (result i64)
    (i64.trunc_s/f64 (get_local $lhs))
  )
  (func $system::core::f64.as_2 (param $lhs f64) (result i64)
    (i64.trunc_u/f64 (get_local $lhs))
  )
  (func $system::core::f64.as_3 (param $lhs f64) (result i32)
    (i32.trunc_s/f64 (get_local $lhs))
  )
  (func $system::core::f64.as_4 (param $lhs f64) (result i32)
    (i32.trunc_u/f64 (get_local $lhs))
  )
  (func $system::core::f64.store (param $lhs i64) (param $rhs f64)
    (f64.store (call $system::core::addressFromRef (get_local $lhs)) (get_local $rhs))
  )
  (func $system::core::f64.store_1 (param $lhs i64) (param $rhs f64) (param $offset i32)
    (f64.store (i32.add (get_local $offset) (call $system::core::addressFromRef (get_local $lhs))) (get_local $rhs))
  )
  (func $system::core::f64.load (param $lhs i64) (result f64)
    (f64.load (call $system::core::addressFromRef (get_local $lhs)))
  )
  (func $system::core::f64.load_1 (param $lhs i64) (param $offset i32) (result f64)
    (f64.load (i32.add (get_local $offset) (call $system::core::addressFromRef (get_local $lhs))))
  )
  (func $system::core::boolean.sizeOf (result i32)
    (i32.const 4)
  )
  (func $system::core::boolean.allocationSize (result i32)
    (call $system::core::boolean.sizeOf)
  )
  (func $system::core::boolean.&& (param $lhs i32) (param $rhs i32) (result i32)
    (i32.and (i32.ne (get_local $lhs) (i32.const 0)) (i32.ne (get_local $rhs) (i32.const 0)))
  )
  (func $system::core::boolean.== (param $lhs i32) (param $rhs i32) (result i32)
    (i32.eq (i32.eqz (get_local $lhs)) (i32.eqz (get_local $rhs)))
  )
  (func $system::core::boolean.|| (param $lhs i32) (param $rhs i32) (result i32)
    (i32.or (i32.ne (get_local $lhs) (i32.const 0)) (i32.ne (get_local $rhs) (i32.const 0)))
  )
  (func $system::core::boolean.! (param $rhs i32) (result i32)
    (if $a_wild_if (result i32) (get_local $rhs)
      (then
        (i32.const 0)
      )
      (else
        (i32.const 1)
      )
    )
  )
  (func $system::core::boolean.store (param $lhs i64) (param $rhs i32)
    (i32.store (call $system::core::addressFromRef (get_local $lhs)) (get_local $rhs))
  )
  (func $system::core::boolean.store_1 (param $lhs i64) (param $rhs i32) (param $offset i32)
    (i32.store (i32.add (get_local $offset) (call $system::core::addressFromRef (get_local $lhs))) (get_local $rhs))
  )
  (func $system::core::boolean.load (param $lhs i64) (result i32)
    (i32.load (call $system::core::addressFromRef (get_local $lhs)))
  )
  (func $system::core::boolean.load_1 (param $lhs i64) (param $offset i32) (result i32)
    (i32.load (i32.add (get_local $offset) (call $system::core::addressFromRef (get_local $lhs))))
  )
  (func $system::core::char.sizeOf (result i32)
    (i32.const 4)
  )
  (func $system::core::char.allocationSize (result i32)
    (call $system::core::char.sizeOf)
  )
  (func $system::core::char.as (param $lhs i32) (result i32)
    (get_local $lhs)
  )
  (func $system::core::char.as_1 (param $lhs i32) (result i32)
    (get_local $lhs)
  )
  (func $system::core::char.as_2 (param $lhs i32) (result i32)
    (get_local $lhs)
  )
  (func $system::core::char.as_3 (param $lhs i32) (result i64)
    (i64.extend_u/i32 (get_local $lhs))
  )
  (func $system::core::char.as_4 (param $lhs i32) (result i64)
    (i64.extend_s/i32 (get_local $lhs))
  )
  (func $system::core::char.as_5 (param $lhs i32) (result f32)
    (f32.convert_u/i32 (get_local $lhs))
  )
  (func $system::core::char.as_6 (param $lhs i32) (result f64)
    (f64.convert_u/i32 (get_local $lhs))
  )
  (func $system::core::usize.sizeOf (result i32)
    (i32.const 4)
  )
  (func $system::core::usize.allocationSize (result i32)
    (call $system::core::usize.sizeOf)
  )
  (func $system::core::isize.sizeOf (result i32)
    (i32.const 4)
  )
  (func $system::core::isize.allocationSize (result i32)
    (call $system::core::isize.sizeOf)
  )
  (func $system::core::ref.sizeOf (result i32)
    (i32.const 8)
  )
  (func $system::core::ref.allocationSize (result i32)
    (call $system::core::ref.sizeOf)
  )
  (func $system::core::ref.is (param $lhs i64) (result i32)
    (i32.const 1)
  )
  (func $system::core::ref.== (param $lhs i64) (param $rhs i64) (result i32)
    (i64.eq (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::ref.!= (param $lhs i64) (param $rhs i64) (result i32)
    (call $system::core::boolean.! (call $system::core::ref.== (get_local $lhs) (get_local $rhs)))
  )
  (func $system::core::ref.store (param $lhs i64) (param $rhs i64)
    (i64.store (call $system::core::addressFromRef (get_local $lhs)) (get_local $rhs))
  )
  (func $system::core::ref.store_1 (param $lhs i64) (param $rhs i64) (param $offset i32)
    (i64.store (i32.add (get_local $offset) (call $system::core::addressFromRef (get_local $lhs))) (get_local $rhs))
  )
  (func $system::core::ref.load (param $lhs i64) (result i64)
    (i64.load (call $system::core::addressFromRef (get_local $lhs)))
  )
  (func $system::core::ref.load_1 (param $lhs i64) (param $offset i32) (result i64)
    (i64.load (i32.add (get_local $offset) (call $system::core::addressFromRef (get_local $lhs))))
  )
  (export "gcd" (func $test/fixtures/compiler/if.ro::gcd))
  (export "test" (func $test/fixtures/compiler/if.ro::test))
  (export "ifWithoutElse" (func $test/fixtures/compiler/if.ro::ifWithoutElse))
  (func $test/fixtures/compiler/if.ro::gcd (param $x i32) (param $y i32) (result i32)
    (if $a_wild_if (result i32) (call $system::core::i32.> (get_local $x) (get_local $y))
      (then
        (call $test/fixtures/compiler/if.ro::gcd (call $system::core::i32.- (get_local $x) (get_local $y)) (get_local $y))
      )
      (else
        (if $a_wild_if (result i32) (call $system::core::i32.< (get_local $x) (get_local $y))
            (then
              (call $test/fixtures/compiler/if.ro::gcd (get_local $x) (call $system::core::i32.- (get_local $y) (get_local $x)))
            )
            (else
              (get_local $x)
            )
          )
      )
    )
  )
  (func $test/fixtures/compiler/if.ro::test (result i32)
    (call $test/fixtures/compiler/if.ro::gcd (i32.const 119) (i32.const 7))
  )
  (func $test/fixtures/compiler/if.ro::ifWithoutElse (param $x i32) (result i32)
    (local $a i32)
    (block $unknown_block_1 (result i32)
      (set_local $a (i32.const 1))
      (if $a_wild_if (call $system::core::i32.== (get_local $x) (i32.const 1))
          (then
            (block $unknown_block_2
                (set_local $a (i32.const 3))
              )
          )
          (else)
        )
      (get_local $a)
    )
  )
)
