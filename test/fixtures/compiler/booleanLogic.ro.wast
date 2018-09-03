(module
  (memory 0 1)
  (func $system::core::&& (param $lhs i32) (param $rhs i32) (result i32)
    (i32.and (i32.ne (get_local $lhs) (i32.const 0)) (i32.ne (get_local $rhs) (i32.const 0)))
  )
  (func $system::core::== (param $lhs i32) (param $rhs i32) (result i32)
    (i32.eq (i32.eqz (get_local $lhs)) (i32.eqz (get_local $rhs)))
  )
  (func $system::core::==_1 (param $lhs i32) (param $rhs i32) (result i32)
    (i32.eq (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::==_2 (param $lhs i32) (param $rhs i32) (result i32)
    (i32.eq (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::==_3 (param $lhs i64) (param $rhs i64) (result i32)
    (i64.eq (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::==_4 (param $lhs i64) (param $rhs i64) (result i32)
    (i64.eq (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::|| (param $lhs i32) (param $rhs i32) (result i32)
    (i32.or (i32.ne (get_local $lhs) (i32.const 0)) (i32.ne (get_local $rhs) (i32.const 0)))
  )
  (func $system::core::+ (param $lhs i32) (param $rhs i32) (result i32)
    (i32.add (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::+_1 (param $lhs i32) (param $rhs i32) (result i32)
    (i32.add (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::+_2 (param $lhs i64) (param $rhs i64) (result i64)
    (i64.add (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::+_3 (param $lhs i64) (param $rhs i64) (result i64)
    (i64.add (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::+_4 (param $lhs f32) (param $rhs f32) (result f32)
    (f32.add (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::- (param $lhs i32) (param $rhs i32) (result i32)
    (i32.sub (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::-_1 (param $lhs i32) (param $rhs i32) (result i32)
    (i32.sub (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::-_2 (param $rhs i32) (result i32)
    (i32.sub (i32.const 0) (get_local $rhs))
  )
  (func $system::core::-_3 (param $lhs i64) (param $rhs i64) (result i64)
    (i64.sub (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::-_4 (param $lhs i64) (param $rhs i64) (result i64)
    (i64.sub (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::-_5 (param $lhs f32) (param $rhs f32) (result f32)
    (f32.sub (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::* (param $lhs i32) (param $rhs i32) (result i32)
    (i32.mul (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::*_1 (param $lhs i32) (param $rhs i32) (result i32)
    (i32.mul (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::*_2 (param $lhs i64) (param $rhs i64) (result i64)
    (i64.mul (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::*_3 (param $lhs i64) (param $rhs i64) (result i64)
    (i64.mul (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::*_4 (param $lhs f32) (param $rhs f32) (result f32)
    (f32.mul (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::/ (param $lhs i32) (param $rhs i32) (result i32)
    (i32.div_u (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::/_1 (param $lhs i32) (param $rhs i32) (result i32)
    (i32.div_s (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::/_2 (param $lhs i64) (param $rhs i64) (result i64)
    (i64.div_u (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::/_3 (param $lhs i64) (param $rhs i64) (result i64)
    (i64.div_s (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::/_4 (param $lhs f32) (param $rhs f32) (result f32)
    (f32.div (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::~ (param $rhs i32) (result i32)
    (i32.xor (i32.const 0xFFFFFFFF) (get_local $rhs))
  )
  (func $system::core::~_1 (param $rhs i32) (result i32)
    (i32.xor (i32.const 0xFFFFFFFF) (get_local $rhs))
  )
  (func $system::core::~_2 (param $rhs i64) (result i64)
    (i64.xor (i64.const 0xFFFFFFFFFFFFFFFF) (get_local $rhs))
  )
  (func $system::core::~_3 (param $rhs i64) (result i64)
    (i64.xor (i64.const 0xFFFFFFFFFFFFFFFF) (get_local $rhs))
  )
  (func $system::core::>>> (param $lhs i32) (param $rhs i32) (result i32)
    (i32.shr_u (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::>>>_1 (param $lhs i32) (param $rhs i32) (result i32)
    (i32.shr_u (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::>>>_2 (param $lhs i64) (param $rhs i64) (result i64)
    (i64.shr_u (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::>>>_3 (param $lhs i64) (param $rhs i64) (result i64)
    (i64.shr_u (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::>> (param $lhs i32) (param $rhs i32) (result i32)
    (i32.shr_s (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::>>_1 (param $lhs i32) (param $rhs i32) (result i32)
    (i32.shr_s (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::>>_2 (param $lhs i64) (param $rhs i64) (result i64)
    (i64.shr_s (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::>>_3 (param $lhs i64) (param $rhs i64) (result i64)
    (i64.shr_s (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::<< (param $lhs i32) (param $rhs i32) (result i32)
    (i32.shl (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::<<_1 (param $lhs i32) (param $rhs i32) (result i32)
    (i32.shl (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::<<_2 (param $lhs i64) (param $rhs i64) (result i64)
    (i64.shl (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::<<_3 (param $lhs i64) (param $rhs i64) (result i64)
    (i64.shl (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::^ (param $lhs i32) (param $rhs i32) (result i32)
    (i32.xor (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::^_1 (param $lhs i32) (param $rhs i32) (result i32)
    (i32.xor (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::^_2 (param $lhs i32) (param $rhs i32) (result i32)
    (i32.xor (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::^_3 (param $lhs i64) (param $rhs i64) (result i64)
    (i64.xor (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::^_4 (param $lhs i64) (param $rhs i64) (result i64)
    (i64.xor (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::>= (param $lhs i32) (param $rhs i32) (result i32)
    (i32.ge_u (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::>=_1 (param $lhs i32) (param $rhs i32) (result i32)
    (i32.ge_s (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::>=_2 (param $lhs i64) (param $rhs i64) (result i32)
    (i64.ge_u (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::>=_3 (param $lhs i64) (param $rhs i64) (result i32)
    (i64.ge_s (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::<= (param $lhs i32) (param $rhs i32) (result i32)
    (i32.le_u (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::<=_1 (param $lhs i32) (param $rhs i32) (result i32)
    (i32.le_s (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::<=_2 (param $lhs i64) (param $rhs i64) (result i32)
    (i64.le_u (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::<=_3 (param $lhs i64) (param $rhs i64) (result i32)
    (i64.le_s (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::> (param $lhs i32) (param $rhs i32) (result i32)
    (i32.gt_u (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::>_1 (param $lhs i32) (param $rhs i32) (result i32)
    (i32.gt_s (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::>_2 (param $lhs i64) (param $rhs i64) (result i32)
    (i64.gt_u (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::>_3 (param $lhs i64) (param $rhs i64) (result i32)
    (i64.gt_s (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::< (param $lhs i32) (param $rhs i32) (result i32)
    (i32.lt_u (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::<_1 (param $lhs i32) (param $rhs i32) (result i32)
    (i32.lt_s (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::<_2 (param $lhs i64) (param $rhs i64) (result i32)
    (i64.lt_u (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::<_3 (param $lhs i64) (param $rhs i64) (result i32)
    (i64.lt_s (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::!= (param $lhs i32) (param $rhs i32) (result i32)
    (i32.ne (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::!=_1 (param $lhs i32) (param $rhs i32) (result i32)
    (i32.ne (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::!=_2 (param $lhs i64) (param $rhs i64) (result i32)
    (i64.ne (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::!=_3 (param $lhs i64) (param $rhs i64) (result i32)
    (i64.ne (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::& (param $lhs i32) (param $rhs i32) (result i32)
    (i32.and (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::| (param $lhs i32) (param $rhs i32) (result i32)
    (i32.or (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::assert (param $x i32)
    (if $a_wild_if (call $system::core::== (get_local $x) (i32.const 0))
      (then
        (block $unknown_block_1
            (call $system::core::panic)
          )
      )
      (else)
    )
  )
  (func $system::core::panic
    (unreachable)
  )
  (export "test" (func $test::test))
  (func $test::test (param $a i32) (param $b i32) (result i32)
    (call $system::core::&& (get_local $a) (get_local $b))
  )
)
