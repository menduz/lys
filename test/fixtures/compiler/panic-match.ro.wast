(module
  (memory 0 1)
  (func $system::core::assert (param $x i32)
    (if $a_wild_if (call $system::core::==_33 (get_local $x) (i32.const 0))
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
  (func $system::core::sizeOf (result i32)
    (i32.const 1)
  )
  (func $system::core::allocationSize (result i32)
    (call $system::core::sizeOf)
  )
  (func $system::core::as (param $lhs i32) (result i32)
    (get_local $lhs)
  )
  (func $system::core::as_1 (param $lhs i32) (result i32)
    (get_local $lhs)
  )
  (func $system::core::as_2 (param $lhs i32) (result i32)
    (get_local $lhs)
  )
  (func $system::core::as_3 (param $lhs i32) (result i32)
    (get_local $lhs)
  )
  (func $system::core::as_4 (param $lhs i32) (result i64)
    (i64.extend_u/i32 (get_local $lhs))
  )
  (func $system::core::as_5 (param $lhs i32) (result i64)
    (i64.extend_s/i32 (get_local $lhs))
  )
  (func $system::core::as_6 (param $lhs i32) (result f32)
    (f32.convert_u/i32 (get_local $lhs))
  )
  (func $system::core::as_7 (param $lhs i32) (result f64)
    (f64.convert_u/i32 (get_local $lhs))
  )
  (func $system::core::==_1 (param $lhs i32) (param $rhs i32) (result i32)
    (i32.eq (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::==_2 (param $lhs i32) (param $rhs i32) (result i32)
    (i32.eq (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::==_3 (param $lhs i32) (param $rhs i32) (result i32)
    (i32.eq (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::store (param $lhs i64) (param $rhs i32)
    (i32.store8 (call $system::core::addressFromRef (get_local $lhs)) (get_local $rhs))
  )
  (func $system::core::store_1 (param $lhs i64) (param $rhs i32) (param $offset i32)
    (i32.store8 (i32.add (get_local $offset) (call $system::core::addressFromRef (get_local $lhs))) (get_local $rhs))
  )
  (func $system::core::load (param $lhs i64) (result i32)
    (i32.load8_u (call $system::core::addressFromRef (get_local $lhs)))
  )
  (func $system::core::load_1 (param $lhs i64) (param $offset i32) (result i32)
    (i32.load8_u (i32.add (get_local $offset) (call $system::core::addressFromRef (get_local $lhs))))
  )
  (func $system::core::sizeOf_3 (result i32)
    (i32.const 2)
  )
  (func $system::core::allocationSize_2 (result i32)
    (call $system::core::sizeOf_3)
  )
  (func $system::core::as_9 (param $lhs i32) (result i32)
    (get_local $lhs)
  )
  (func $system::core::as_10 (param $lhs i32) (result i64)
    (i64.extend_s/i32 (get_local $lhs))
  )
  (func $system::core::as_11 (param $lhs i32) (result f32)
    (f32.convert_s/i32 (get_local $lhs))
  )
  (func $system::core::as_12 (param $lhs i32) (result f64)
    (f64.convert_s/i32 (get_local $lhs))
  )
  (func $system::core::==_5 (param $lhs i32) (param $rhs i32) (result i32)
    (i32.eq (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::==_6 (param $lhs i32) (param $rhs i32) (result i32)
    (i32.eq (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::store_3 (param $lhs i64) (param $rhs i32)
    (i32.store16 (call $system::core::addressFromRef (get_local $lhs)) (get_local $rhs))
  )
  (func $system::core::sizeOf_6 (result i32)
    (i32.const 2)
  )
  (func $system::core::allocationSize_4 (result i32)
    (call $system::core::sizeOf_6)
  )
  (func $system::core::as_14 (param $lhs i32) (result i32)
    (get_local $lhs)
  )
  (func $system::core::as_15 (param $lhs i32) (result i32)
    (get_local $lhs)
  )
  (func $system::core::as_16 (param $lhs i32) (result i64)
    (i64.extend_u/i32 (get_local $lhs))
  )
  (func $system::core::as_17 (param $lhs i32) (result i64)
    (i64.extend_u/i32 (get_local $lhs))
  )
  (func $system::core::as_18 (param $lhs i32) (result f32)
    (f32.convert_u/i32 (get_local $lhs))
  )
  (func $system::core::as_19 (param $lhs i32) (result f64)
    (f64.convert_u/i32 (get_local $lhs))
  )
  (func $system::core::==_8 (param $lhs i32) (param $rhs i32) (result i32)
    (i32.eq (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::==_9 (param $lhs i32) (param $rhs i32) (result i32)
    (i32.eq (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::==_10 (param $lhs i32) (param $rhs i32) (result i32)
    (i32.eq (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::store_5 (param $lhs i64) (param $rhs i32)
    (i32.store16 (call $system::core::addressFromRef (get_local $lhs)) (get_local $rhs))
  )
  (func $system::core::sizeOf_9 (result i32)
    (i32.const 4)
  )
  (func $system::core::allocationSize_6 (result i32)
    (call $system::core::sizeOf_9)
  )
  (func $system::core::as_21 (param $lhs i32) (result i64)
    (i64.extend_s/i32 (get_local $lhs))
  )
  (func $system::core::as_22 (param $lhs i32) (result f32)
    (f32.convert_s/i32 (get_local $lhs))
  )
  (func $system::core::as_23 (param $lhs i32) (result f64)
    (f64.convert_s/i32 (get_local $lhs))
  )
  (func $system::core::as_24 (param $lhs i32) (result f32)
    (f32.convert_s/i32 (get_local $lhs))
  )
  (func $system::core::==_12 (param $lhs i32) (param $rhs i32) (result i32)
    (i32.eq (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::==_13 (param $lhs i32) (param $rhs i32) (result i32)
    (i32.eq (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::==_14 (param $lhs i32) (param $rhs i32) (result i32)
    (i32.eq (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::!= (param $lhs i32) (param $rhs i32) (result i32)
    (i32.ne (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::& (param $lhs i32) (param $rhs i32) (result i32)
    (i32.and (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::| (param $lhs i32) (param $rhs i32) (result i32)
    (i32.or (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::^ (param $lhs i32) (param $rhs i32) (result i32)
    (i32.xor (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::^_1 (param $lhs i32) (param $rhs i32) (result i32)
    (i32.xor (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::+ (param $lhs i32) (param $rhs i32) (result i32)
    (i32.add (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::- (param $lhs i32) (param $rhs i32) (result i32)
    (i32.sub (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::-_1 (param $rhs i32) (result i32)
    (i32.sub (i32.const 0) (get_local $rhs))
  )
  (func $system::core::* (param $lhs i32) (param $rhs i32) (result i32)
    (i32.mul (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::/ (param $lhs i32) (param $rhs i32) (result i32)
    (i32.div_s (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::~ (param $rhs i32) (result i32)
    (i32.xor (i32.const 0xFFFFFFFF) (get_local $rhs))
  )
  (func $system::core::>>> (param $lhs i32) (param $rhs i32) (result i32)
    (i32.shr_u (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::>> (param $lhs i32) (param $rhs i32) (result i32)
    (i32.shr_s (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::<< (param $lhs i32) (param $rhs i32) (result i32)
    (i32.shl (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::>= (param $lhs i32) (param $rhs i32) (result i32)
    (i32.ge_s (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::<= (param $lhs i32) (param $rhs i32) (result i32)
    (i32.le_s (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::> (param $lhs i32) (param $rhs i32) (result i32)
    (i32.gt_s (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::< (param $lhs i32) (param $rhs i32) (result i32)
    (i32.lt_s (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::store_7 (param $lhs i64) (param $rhs i32)
    (i32.store (call $system::core::addressFromRef (get_local $lhs)) (get_local $rhs))
  )
  (func $system::core::store_8 (param $lhs i64) (param $rhs i32) (param $offset i32)
    (i32.store (i32.add (get_local $offset) (call $system::core::addressFromRef (get_local $lhs))) (get_local $rhs))
  )
  (func $system::core::load_3 (param $lhs i64) (result i32)
    (i32.load (call $system::core::addressFromRef (get_local $lhs)))
  )
  (func $system::core::load_4 (param $lhs i64) (param $offset i32) (result i32)
    (i32.load (i32.add (get_local $offset) (call $system::core::addressFromRef (get_local $lhs))))
  )
  (func $system::core::sizeOf_12 (result i32)
    (i32.const 4)
  )
  (func $system::core::allocationSize_8 (result i32)
    (call $system::core::sizeOf_12)
  )
  (func $system::core::as_26 (param $lhs i32) (result i64)
    (i64.extend_u/i32 (get_local $lhs))
  )
  (func $system::core::as_27 (param $lhs i32) (result i64)
    (i64.extend_u/i32 (get_local $lhs))
  )
  (func $system::core::as_28 (param $lhs i32) (result f32)
    (f32.convert_u/i32 (get_local $lhs))
  )
  (func $system::core::as_29 (param $lhs i32) (result f64)
    (f64.convert_u/i32 (get_local $lhs))
  )
  (func $system::core::as_30 (param $lhs i32) (result i64)
    (i64.extend_s/i32 (get_local $lhs))
  )
  (func $system::core::as_31 (param $lhs i32) (result f32)
    (f32.convert_u/i32 (get_local $lhs))
  )
  (func $system::core::==_16 (param $lhs i32) (param $rhs i32) (result i32)
    (i32.eq (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::==_17 (param $lhs i32) (param $rhs i32) (result i32)
    (i32.eq (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::==_18 (param $lhs i32) (param $rhs i32) (result i32)
    (i32.eq (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::!=_2 (param $lhs i32) (param $rhs i32) (result i32)
    (i32.ne (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::+_2 (param $lhs i32) (param $rhs i32) (result i32)
    (i32.add (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::-_3 (param $lhs i32) (param $rhs i32) (result i32)
    (i32.sub (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::*_2 (param $lhs i32) (param $rhs i32) (result i32)
    (i32.mul (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::/_2 (param $lhs i32) (param $rhs i32) (result i32)
    (i32.div_u (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::~_2 (param $rhs i32) (result i32)
    (i32.xor (i32.const 0xFFFFFFFF) (get_local $rhs))
  )
  (func $system::core::>>>_2 (param $lhs i32) (param $rhs i32) (result i32)
    (i32.shr_u (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::>>_2 (param $lhs i32) (param $rhs i32) (result i32)
    (i32.shr_s (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::<<_2 (param $lhs i32) (param $rhs i32) (result i32)
    (i32.shl (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::^_3 (param $lhs i32) (param $rhs i32) (result i32)
    (i32.xor (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::>=_2 (param $lhs i32) (param $rhs i32) (result i32)
    (i32.ge_u (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::<=_2 (param $lhs i32) (param $rhs i32) (result i32)
    (i32.le_u (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::>_2 (param $lhs i32) (param $rhs i32) (result i32)
    (i32.gt_u (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::<_2 (param $lhs i32) (param $rhs i32) (result i32)
    (i32.lt_u (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::store_10 (param $lhs i64) (param $rhs i32)
    (i32.store (call $system::core::addressFromRef (get_local $lhs)) (get_local $rhs))
  )
  (func $system::core::store_11 (param $lhs i64) (param $rhs i32) (param $offset i32)
    (i32.store (i32.add (get_local $offset) (call $system::core::addressFromRef (get_local $lhs))) (get_local $rhs))
  )
  (func $system::core::load_6 (param $lhs i64) (result i32)
    (i32.load (call $system::core::addressFromRef (get_local $lhs)))
  )
  (func $system::core::load_7 (param $lhs i64) (param $offset i32) (result i32)
    (i32.load (i32.add (get_local $offset) (call $system::core::addressFromRef (get_local $lhs))))
  )
  (func $system::core::sizeOf_15 (result i32)
    (i32.const 8)
  )
  (func $system::core::allocationSize_10 (result i32)
    (call $system::core::sizeOf_15)
  )
  (func $system::core::as_33 (param $lhs i64) (result f32)
    (f32.convert_s/i64 (get_local $lhs))
  )
  (func $system::core::as_34 (param $lhs i64) (result f64)
    (f64.convert_s/i64 (get_local $lhs))
  )
  (func $system::core::as_35 (param $lhs i64) (result f32)
    (f32.convert_s/i64 (get_local $lhs))
  )
  (func $system::core::as_36 (param $lhs i64) (result i32)
    (i32.wrap/i64 (get_local $lhs))
  )
  (func $system::core::==_20 (param $lhs i64) (param $rhs i64) (result i32)
    (i64.eq (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::==_21 (param $lhs i64) (param $rhs i32) (result i32)
    (i64.eq (get_local $lhs) (i64.extend_s/i32 (get_local $rhs)))
  )
  (func $system::core::==_22 (param $lhs i64) (param $rhs i32) (result i32)
    (i64.eq (get_local $lhs) (i64.extend_s/i32 (get_local $rhs)))
  )
  (func $system::core::!=_4 (param $lhs i64) (param $rhs i64) (result i32)
    (i64.ne (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::+_4 (param $lhs i64) (param $rhs i64) (result i64)
    (i64.add (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::-_5 (param $lhs i64) (param $rhs i64) (result i64)
    (i64.sub (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::*_4 (param $lhs i64) (param $rhs i64) (result i64)
    (i64.mul (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::/_4 (param $lhs i64) (param $rhs i64) (result i64)
    (i64.div_s (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::~_4 (param $rhs i64) (result i64)
    (i64.xor (i64.const 0xFFFFFFFFFFFFFFFF) (get_local $rhs))
  )
  (func $system::core::>>>_4 (param $lhs i64) (param $rhs i64) (result i64)
    (i64.shr_u (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::>>_4 (param $lhs i64) (param $rhs i64) (result i64)
    (i64.shr_s (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::<<_4 (param $lhs i64) (param $rhs i64) (result i64)
    (i64.shl (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::^_5 (param $lhs i64) (param $rhs i64) (result i64)
    (i64.xor (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::>=_4 (param $lhs i64) (param $rhs i64) (result i32)
    (i64.ge_s (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::<=_4 (param $lhs i64) (param $rhs i64) (result i32)
    (i64.le_s (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::>_4 (param $lhs i64) (param $rhs i64) (result i32)
    (i64.gt_s (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::<_4 (param $lhs i64) (param $rhs i64) (result i32)
    (i64.lt_s (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::store_13 (param $lhs i64) (param $rhs i64)
    (i64.store (call $system::core::addressFromRef (get_local $lhs)) (get_local $rhs))
  )
  (func $system::core::store_14 (param $lhs i64) (param $rhs i64) (param $offset i32)
    (i64.store (i32.add (get_local $offset) (call $system::core::addressFromRef (get_local $lhs))) (get_local $rhs))
  )
  (func $system::core::load_9 (param $lhs i64) (result i64)
    (i64.load (call $system::core::addressFromRef (get_local $lhs)))
  )
  (func $system::core::load_10 (param $lhs i64) (param $offset i32) (result i64)
    (i64.load (i32.add (get_local $offset) (call $system::core::addressFromRef (get_local $lhs))))
  )
  (func $system::core::sizeOf_18 (result i32)
    (i32.const 8)
  )
  (func $system::core::allocationSize_12 (result i32)
    (call $system::core::sizeOf_18)
  )
  (func $system::core::as_38 (param $lhs i64) (result f32)
    (f32.convert_u/i64 (get_local $lhs))
  )
  (func $system::core::as_39 (param $lhs i64) (result f64)
    (f64.convert_u/i64 (get_local $lhs))
  )
  (func $system::core::as_40 (param $lhs i64) (result f32)
    (f32.convert_u/i64 (get_local $lhs))
  )
  (func $system::core::as_41 (param $lhs i64) (result i32)
    (i32.wrap/i64 (get_local $lhs))
  )
  (func $system::core::==_24 (param $lhs i64) (param $rhs i64) (result i32)
    (i64.eq (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::==_25 (param $lhs i64) (param $rhs i32) (result i32)
    (i64.eq (get_local $lhs) (i64.extend_u/i32 (get_local $rhs)))
  )
  (func $system::core::==_26 (param $lhs i64) (param $rhs i32) (result i32)
    (i64.eq (get_local $lhs) (i64.extend_u/i32 (get_local $rhs)))
  )
  (func $system::core::==_27 (param $lhs i64) (param $rhs i32) (result i32)
    (i64.eq (get_local $lhs) (i64.extend_u/i32 (get_local $rhs)))
  )
  (func $system::core::!=_6 (param $lhs i64) (param $rhs i64) (result i32)
    (i64.ne (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::+_6 (param $lhs i64) (param $rhs i64) (result i64)
    (i64.add (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::-_7 (param $lhs i64) (param $rhs i64) (result i64)
    (i64.sub (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::*_6 (param $lhs i64) (param $rhs i64) (result i64)
    (i64.mul (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::/_6 (param $lhs i64) (param $rhs i64) (result i64)
    (i64.div_u (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::~_6 (param $rhs i64) (result i64)
    (i64.xor (i64.const 0xFFFFFFFFFFFFFFFF) (get_local $rhs))
  )
  (func $system::core::>>>_6 (param $lhs i64) (param $rhs i64) (result i64)
    (i64.shr_u (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::>>_6 (param $lhs i64) (param $rhs i64) (result i64)
    (i64.shr_s (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::<<_6 (param $lhs i64) (param $rhs i64) (result i64)
    (i64.shl (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::^_7 (param $lhs i64) (param $rhs i64) (result i64)
    (i64.xor (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::>=_6 (param $lhs i64) (param $rhs i64) (result i32)
    (i64.ge_u (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::<=_6 (param $lhs i64) (param $rhs i64) (result i32)
    (i64.le_u (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::>_6 (param $lhs i64) (param $rhs i64) (result i32)
    (i64.gt_u (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::<_6 (param $lhs i64) (param $rhs i64) (result i32)
    (i64.lt_u (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::store_16 (param $lhs i64) (param $rhs i64)
    (i64.store (call $system::core::addressFromRef (get_local $lhs)) (get_local $rhs))
  )
  (func $system::core::store_17 (param $lhs i64) (param $rhs i64) (param $offset i32)
    (i64.store (i32.add (get_local $offset) (call $system::core::addressFromRef (get_local $lhs))) (get_local $rhs))
  )
  (func $system::core::load_12 (param $lhs i64) (result i64)
    (i64.load (call $system::core::addressFromRef (get_local $lhs)))
  )
  (func $system::core::load_13 (param $lhs i64) (param $offset i32) (result i64)
    (i64.load (i32.add (get_local $offset) (call $system::core::addressFromRef (get_local $lhs))))
  )
  (func $system::core::sizeOf_21 (result i32)
    (i32.const 4)
  )
  (func $system::core::allocationSize_14 (result i32)
    (call $system::core::sizeOf_21)
  )
  (func $system::core::as_43 (param $lhs f32) (result f64)
    (f64.promote/f32 (get_local $lhs))
  )
  (func $system::core::as_44 (param $lhs f32) (result i64)
    (i64.trunc_s/f32 (get_local $lhs))
  )
  (func $system::core::as_45 (param $lhs f32) (result i64)
    (i64.trunc_u/f32 (get_local $lhs))
  )
  (func $system::core::as_46 (param $lhs f32) (result i32)
    (i32.trunc_s/f32 (get_local $lhs))
  )
  (func $system::core::as_47 (param $lhs f32) (result i32)
    (i32.trunc_u/f32 (get_local $lhs))
  )
  (func $system::core::+_8 (param $lhs f32) (param $rhs f32) (result f32)
    (f32.add (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::-_9 (param $lhs f32) (param $rhs f32) (result f32)
    (f32.sub (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::*_8 (param $lhs f32) (param $rhs f32) (result f32)
    (f32.mul (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::/_8 (param $lhs f32) (param $rhs f32) (result f32)
    (f32.div (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::==_29 (param $lhs f32) (param $rhs f32) (result i32)
    (f32.eq (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::>=_8 (param $lhs f32) (param $rhs f32) (result i32)
    (f32.ge (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::<=_8 (param $lhs f32) (param $rhs f32) (result i32)
    (f32.le (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::>_8 (param $lhs f32) (param $rhs f32) (result i32)
    (f32.gt (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::<_8 (param $lhs f32) (param $rhs f32) (result i32)
    (f32.lt (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::!=_8 (param $lhs f32) (param $rhs f32) (result i32)
    (f32.ne (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::store_19 (param $lhs i64) (param $rhs f32)
    (f32.store (call $system::core::addressFromRef (get_local $lhs)) (get_local $rhs))
  )
  (func $system::core::store_20 (param $lhs i64) (param $rhs f32) (param $offset i32)
    (f32.store (i32.add (get_local $offset) (call $system::core::addressFromRef (get_local $lhs))) (get_local $rhs))
  )
  (func $system::core::load_15 (param $lhs i64) (result f32)
    (f32.load (call $system::core::addressFromRef (get_local $lhs)))
  )
  (func $system::core::load_16 (param $lhs i64) (param $offset i32) (result f32)
    (f32.load (i32.add (get_local $offset) (call $system::core::addressFromRef (get_local $lhs))))
  )
  (func $system::core::sizeOf_24 (result i32)
    (i32.const 8)
  )
  (func $system::core::allocationSize_16 (result i32)
    (call $system::core::sizeOf_24)
  )
  (func $system::core::+_10 (param $lhs f64) (param $rhs f64) (result f64)
    (f64.add (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::-_11 (param $lhs f64) (param $rhs f64) (result f64)
    (f64.sub (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::*_10 (param $lhs f64) (param $rhs f64) (result f64)
    (f64.mul (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::/_10 (param $lhs f64) (param $rhs f64) (result f64)
    (f64.div (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::==_31 (param $lhs f64) (param $rhs f64) (result i32)
    (f64.eq (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::>=_10 (param $lhs f64) (param $rhs f64) (result i32)
    (f64.ge (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::<=_10 (param $lhs f64) (param $rhs f64) (result i32)
    (f64.le (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::>_10 (param $lhs f64) (param $rhs f64) (result i32)
    (f64.gt (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::<_10 (param $lhs f64) (param $rhs f64) (result i32)
    (f64.lt (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::!=_10 (param $lhs f64) (param $rhs f64) (result i32)
    (f64.ne (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::as_49 (param $lhs f64) (result f32)
    (f32.demote/f64 (get_local $lhs))
  )
  (func $system::core::as_50 (param $lhs f64) (result i64)
    (i64.trunc_s/f64 (get_local $lhs))
  )
  (func $system::core::as_51 (param $lhs f64) (result i64)
    (i64.trunc_u/f64 (get_local $lhs))
  )
  (func $system::core::as_52 (param $lhs f64) (result i32)
    (i32.trunc_s/f64 (get_local $lhs))
  )
  (func $system::core::as_53 (param $lhs f64) (result i32)
    (i32.trunc_u/f64 (get_local $lhs))
  )
  (func $system::core::store_22 (param $lhs i64) (param $rhs f64)
    (f64.store (call $system::core::addressFromRef (get_local $lhs)) (get_local $rhs))
  )
  (func $system::core::store_23 (param $lhs i64) (param $rhs f64) (param $offset i32)
    (f64.store (i32.add (get_local $offset) (call $system::core::addressFromRef (get_local $lhs))) (get_local $rhs))
  )
  (func $system::core::load_18 (param $lhs i64) (result f64)
    (f64.load (call $system::core::addressFromRef (get_local $lhs)))
  )
  (func $system::core::load_19 (param $lhs i64) (param $offset i32) (result f64)
    (f64.load (i32.add (get_local $offset) (call $system::core::addressFromRef (get_local $lhs))))
  )
  (func $system::core::sizeOf_27 (result i32)
    (i32.const 4)
  )
  (func $system::core::allocationSize_18 (result i32)
    (call $system::core::sizeOf_27)
  )
  (func $system::core::&& (param $lhs i32) (param $rhs i32) (result i32)
    (i32.and (i32.ne (get_local $lhs) (i32.const 0)) (i32.ne (get_local $rhs) (i32.const 0)))
  )
  (func $system::core::==_33 (param $lhs i32) (param $rhs i32) (result i32)
    (i32.eq (i32.eqz (get_local $lhs)) (i32.eqz (get_local $rhs)))
  )
  (func $system::core::|| (param $lhs i32) (param $rhs i32) (result i32)
    (i32.or (i32.ne (get_local $lhs) (i32.const 0)) (i32.ne (get_local $rhs) (i32.const 0)))
  )
  (func $system::core::! (param $rhs i32) (result i32)
    (if $a_wild_if (result i32) (get_local $rhs)
      (then
        (i32.const 0)
      )
      (else
        (i32.const 1)
      )
    )
  )
  (func $system::core::store_25 (param $lhs i64) (param $rhs i32)
    (i32.store (call $system::core::addressFromRef (get_local $lhs)) (get_local $rhs))
  )
  (func $system::core::store_26 (param $lhs i64) (param $rhs i32) (param $offset i32)
    (i32.store (i32.add (get_local $offset) (call $system::core::addressFromRef (get_local $lhs))) (get_local $rhs))
  )
  (func $system::core::load_21 (param $lhs i64) (result i32)
    (i32.load (call $system::core::addressFromRef (get_local $lhs)))
  )
  (func $system::core::load_22 (param $lhs i64) (param $offset i32) (result i32)
    (i32.load (i32.add (get_local $offset) (call $system::core::addressFromRef (get_local $lhs))))
  )
  (func $system::core::sizeOf_30 (result i32)
    (i32.const 4)
  )
  (func $system::core::allocationSize_20 (result i32)
    (call $system::core::sizeOf_30)
  )
  (func $system::core::as_55 (param $lhs i32) (result i32)
    (get_local $lhs)
  )
  (func $system::core::as_56 (param $lhs i32) (result i32)
    (get_local $lhs)
  )
  (func $system::core::as_57 (param $lhs i32) (result i32)
    (get_local $lhs)
  )
  (func $system::core::as_58 (param $lhs i32) (result i64)
    (i64.extend_u/i32 (get_local $lhs))
  )
  (func $system::core::as_59 (param $lhs i32) (result i64)
    (i64.extend_s/i32 (get_local $lhs))
  )
  (func $system::core::as_60 (param $lhs i32) (result f32)
    (f32.convert_u/i32 (get_local $lhs))
  )
  (func $system::core::as_61 (param $lhs i32) (result f64)
    (f64.convert_u/i32 (get_local $lhs))
  )
  (func $system::core::sizeOf_33 (result i32)
    (i32.const 4)
  )
  (func $system::core::allocationSize_22 (result i32)
    (call $system::core::sizeOf_33)
  )
  (func $system::core::sizeOf_36 (result i32)
    (i32.const 4)
  )
  (func $system::core::allocationSize_24 (result i32)
    (call $system::core::sizeOf_36)
  )
  (func $system::core::sizeOf_39 (result i32)
    (i32.const 8)
  )
  (func $system::core::allocationSize_26 (result i32)
    (call $system::core::sizeOf_39)
  )
  (func $system::core::is (param $lhs i64) (result i32)
    (i32.const 1)
  )
  (func $system::core::==_35 (param $lhs i64) (param $rhs i64) (result i32)
    (i64.eq (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::!=_12 (param $lhs i64) (param $rhs i64) (result i32)
    (call $system::core::! (call $system::core::==_35 (get_local $lhs) (get_local $rhs)))
  )
  (func $system::core::store_28 (param $lhs i64) (param $rhs i64)
    (i64.store (call $system::core::addressFromRef (get_local $lhs)) (get_local $rhs))
  )
  (func $system::core::store_29 (param $lhs i64) (param $rhs i64) (param $offset i32)
    (i64.store (i32.add (get_local $offset) (call $system::core::addressFromRef (get_local $lhs))) (get_local $rhs))
  )
  (func $system::core::load_24 (param $lhs i64) (result i64)
    (i64.load (call $system::core::addressFromRef (get_local $lhs)))
  )
  (func $system::core::load_25 (param $lhs i64) (param $offset i32) (result i64)
    (i64.load (i32.add (get_local $offset) (call $system::core::addressFromRef (get_local $lhs))))
  )
  (export "test" (func $test/fixtures/compiler/panic-match.ro::test))
  (func $test/fixtures/compiler/panic-match.ro::test (param $x i32)
    (local $var$1 i32)
    (block $unknown_block_1
      (block $B2
          (set_local $var$1 (get_local $x))
          (block $B2_0
              (block $B2_1
                  (br_if $B2_0 (call $system::core::==_12 (i32.const 1) (get_local $var$1)))
                )
              (call $system::core::panic_1)
              (br $B2)
            )
          (call $system::core::assert (i32.const 1))
          (br $B2)
        )
    )
  )
)