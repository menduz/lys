(module
  (memory 0 1)
  (global $AL_BITS (mut i32) (i32.const 0))
  (global $AL_SIZE (mut i32) (i32.const 0))
  (global $AL_MASK (mut i32) (i32.const 0))
  (global $MAX_SIZE_32 (mut i32) (i32.const 0))
  (global $HEAP_BASE (mut i32) (i32.const 0))
  (global $startOffset (mut i32) (i32.const 0))
  (global $offset (mut i32) (i32.const 0))
  (global $lastPtr (mut i32) (i32.const 0))
  (func $system::memory::growMemory (param $pages i32) (result i32)
    (grow_memory (get_local $pages))
  )
  (func $system::memory::currentMemory (result i32)
    (current_memory)
  )
  (func $system::memory::max (param $a i32) (param $b i32) (result i32)
    (if $a_wild_if (result i32) (call $system::core::>_1 (get_local $a) (get_local $b))
      (then
        (get_local $a)
      )
      (else
        (get_local $b)
      )
    )
  )
  (func $system::memory::malloc (param $size i32) (result i32)
    (local $ptr i32)
    (local $newPtr i32)
    (local $pagesBefore i32)
    (local $pagesNeeded i32)
    (local $pagesWanted i32)
    (block $unknown_block_1 (result i32)
      (if $a_wild_if (result i32) (call $system::core::>_1 (get_local $size) (i32.const 0))
          (then
            (block $unknown_block_2 (result i32)
                (if $a_wild_if (call $system::core::>_1 (get_local $size) (get_global $MAX_SIZE_32))
                    (then
                      (block $unknown_block_3
                          (call $system::core::panic)
                        )
                    )
                    (else)
                  )
                (set_local $ptr (get_global $offset))
                (set_local $newPtr (call $system::core::& (call $system::core::+_1 (call $system::core::+_1 (get_local $ptr) (get_local $size)) (get_global $AL_MASK)) (call $system::core::~_1 (get_global $AL_MASK))))
                (set_local $pagesBefore (call $system::memory::currentMemory))
                (if $a_wild_if (call $system::core::>_1 (get_local $newPtr) (call $system::core::<<_1 (get_local $pagesBefore) (i32.const 16)))
                    (then
                      (block $unknown_block_4
                          (set_local $pagesNeeded (call $system::core::>>>_1 (call $system::core::& (call $system::core::+_1 (call $system::core::-_1 (get_local $newPtr) (get_local $ptr)) (i32.const 65535)) (call $system::core::~_1 (i32.const 65535))) (i32.const 16)))
                          (set_local $pagesWanted (call $system::memory::max (get_local $pagesBefore) (get_local $pagesNeeded)))
                          (if $a_wild_if (call $system::core::<_1 (call $system::memory::growMemory (get_local $pagesWanted)) (i32.const 0))
                              (then
                                (block $unknown_block_5
                                    (if $a_wild_if (call $system::core::<_1 (call $system::memory::growMemory (get_local $pagesNeeded)) (i32.const 0))
                                        (then
                                          (block $unknown_block_6
                                              (call $system::core::panic)
                                            )
                                        )
                                        (else)
                                      )
                                  )
                              )
                              (else)
                            )
                        )
                    )
                    (else)
                  )
                (set_global $offset (get_local $newPtr))
                (get_local $ptr)
              )
          )
          (else
            (block $unknown_block_7 (result i32)
                (i32.const 0)
              )
          )
        )
    )
  )
  (func $system::memory::memcpy (param $from i32) (param $to i32) (param $len i32)
    (local $end i32)
    (set_local $end (i32.add (get_local $from) (get_local $len)))
    (block $exit (loop $cont (br_if $exit (i32.eq (get_local $from) (get_local $end))) (i32.store8 (get_local $to) (i32.load8_u (get_local $from))) (set_local $from (i32.add (get_local $from) (i32.const 1))) (set_local $to (i32.add (get_local $to) (i32.const 1))) (br $cont)))
  )
  (func $system::memory::memset (param $ptr i32) (param $content i32) (param $len i32)
    (local $end i32)
    (set_local $end (i32.add (get_local $ptr) (get_local $len)))
    (block $exit (loop $cont (br_if $exit (i32.eq (get_local $ptr) (get_local $end))) (i32.store8 (get_local $ptr) (i32.load8_u (get_local $content))) (set_local $ptr (i32.add (get_local $ptr) (i32.const 1))) (br $cont)))
  )
  (func $support::test::identity (param $x i32) (result i32)
    (get_local $x)
  )
  (func $support::test::identity_1 (param $x f32) (result f32)
    (get_local $x)
  )
  (func $support::test::identity_2 (param $x f64) (result f64)
    (get_local $x)
  )
  (func $support::test::identity_3 (param $x f32) (result f32)
    (get_local $x)
  )
  (func $support::test::assert (param $x i32)
    (if $a_wild_if (call $system::core::==_1 (get_local $x) (i32.const 0))
      (then
        (block $unknown_block_1
            (call $support::test::panic)
          )
      )
      (else)
    )
  )
  (func $support::test::panic
    (unreachable)
  )
  (func $system::core::== (param $lhs i64) (param $rhs i64) (result i32)
    (i64.eq (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::==_1 (param $lhs i32) (param $rhs i32) (result i32)
    (i32.eq (i32.eqz (get_local $lhs)) (i32.eqz (get_local $rhs)))
  )
  (func $system::core::==_2 (param $lhs i32) (param $rhs i32) (result i32)
    (i32.eq (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::==_3 (param $lhs i32) (param $rhs i32) (result i32)
    (i32.eq (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::==_4 (param $lhs i64) (param $rhs i64) (result i32)
    (i64.eq (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::==_5 (param $lhs i64) (param $rhs i64) (result i32)
    (i64.eq (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::==_6 (param $lhs f32) (param $rhs f32) (result i32)
    (f32.eq (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::==_7 (param $lhs f64) (param $rhs f64) (result i32)
    (f64.eq (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::&& (param $lhs i32) (param $rhs i32) (result i32)
    (i32.and (i32.ne (get_local $lhs) (i32.const 0)) (i32.ne (get_local $rhs) (i32.const 0)))
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
  (func $system::core::+_5 (param $lhs f64) (param $rhs f64) (result f64)
    (f64.add (get_local $lhs) (get_local $rhs))
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
  (func $system::core::-_6 (param $lhs f64) (param $rhs f64) (result f64)
    (f64.sub (get_local $lhs) (get_local $rhs))
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
  (func $system::core::*_5 (param $lhs f64) (param $rhs f64) (result f64)
    (f64.mul (get_local $lhs) (get_local $rhs))
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
  (func $system::core::/_5 (param $lhs f64) (param $rhs f64) (result f64)
    (f64.div (get_local $lhs) (get_local $rhs))
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
  (func $system::core::>=_4 (param $lhs f32) (param $rhs f32) (result i32)
    (f32.ge (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::>=_5 (param $lhs f64) (param $rhs f64) (result i32)
    (f64.ge (get_local $lhs) (get_local $rhs))
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
  (func $system::core::<=_4 (param $lhs f32) (param $rhs f32) (result i32)
    (f32.le (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::<=_5 (param $lhs f64) (param $rhs f64) (result i32)
    (f64.le (get_local $lhs) (get_local $rhs))
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
  (func $system::core::>_4 (param $lhs f32) (param $rhs f32) (result i32)
    (f32.gt (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::>_5 (param $lhs f64) (param $rhs f64) (result i32)
    (f64.gt (get_local $lhs) (get_local $rhs))
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
  (func $system::core::<_4 (param $lhs f32) (param $rhs f32) (result i32)
    (f32.lt (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::<_5 (param $lhs f64) (param $rhs f64) (result i32)
    (f64.lt (get_local $lhs) (get_local $rhs))
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
  (func $system::core::!=_4 (param $lhs f32) (param $rhs f32) (result i32)
    (f32.ne (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::!=_5 (param $lhs f64) (param $rhs f64) (result i32)
    (f64.ne (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::& (param $lhs i32) (param $rhs i32) (result i32)
    (i32.and (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::| (param $lhs i32) (param $rhs i32) (result i32)
    (i32.or (get_local $lhs) (get_local $rhs))
  )
  (func $system::core::assert (param $x i32)
    (if $a_wild_if (call $system::core::==_1 (get_local $x) (i32.const 0))
      (then
        (block $unknown_block_1
            (call $system::core::panic)
          )
      )
      (else)
    )
  )
  (func $system::core::sizeOf (param $lhs i64) (result i32)
    (i32.const 8)
  )
  (func $system::core::sizeOf_1 (param $lhs f64) (result i32)
    (i32.const 8)
  )
  (func $system::core::sizeOf_2 (param $lhs i64) (result i32)
    (i32.const 8)
  )
  (func $system::core::sizeOf_3 (param $lhs i64) (result i32)
    (i32.const 8)
  )
  (func $system::core::sizeOf_4 (param $lhs i32) (result i32)
    (i32.const 4)
  )
  (func $system::core::sizeOf_5 (param $lhs f32) (result i32)
    (i32.const 4)
  )
  (func $system::core::sizeOf_6 (param $lhs i32) (result i32)
    (i32.const 4)
  )
  (func $system::core::sizeOf_7 (param $lhs i32) (result i32)
    (i32.const 4)
  )
  (func $system::core::sizeOf_8 (param $lhs i32) (result i32)
    (i32.const 2)
  )
  (func $system::core::sizeOf_9 (param $lhs i32) (result i32)
    (i32.const 2)
  )
  (func $system::core::sizeOf_10 (param $lhs i32) (result i32)
    (i32.const 1)
  )
  (func $system::core::panic
    (unreachable)
  )
  (export "isRed" (func $test::isRed))
  (export "testColors" (func $test::testColors))
  (func $test::isRed (param $color i64) (result i32)
    (local $var$1 i64)
    (block $unknown_block_1 (result i32)
      (block $B2 (result i32)
          (set_local $var$1 (get_local $color))
          (block $B2_0
              (block $B2_1
                  (br_if $B2_0 (call $test::is (get_local $var$1)))
                )
              (i32.const 0)
              (br $B2)
            )
          (i32.const 1)
          (br $B2)
        )
    )
  )
  (func $test::testColors
    (block $unknown_block_3
      (call $support::test::assert (call $system::core::==_1 (call $test::isRed (call $RedType)) (i32.const 1)))
      (call $support::test::assert (call $system::core::==_1 (call $test::isRed (call $GreenType)) (i32.const 0)))
      (call $support::test::assert (call $system::core::==_1 (call $test::isRed (call $BlueType)) (i32.const 0)))
      (call $support::test::assert (call $system::core::==_1 (call $test::isRed (call $CustomType (i32.const 5) (i32.const 5) (i32.const 5))) (i32.const 0)))
      (call $support::test::assert (call $system::core::==_1 (call $test::isRed (call $RedType)) (i32.const 1)))
      (call $support::test::assert (call $system::core::==_1 (call $test::isRed (call $GreenType)) (i32.const 0)))
      (call $support::test::assert (call $system::core::==_1 (call $test::isRed (call $BlueType)) (i32.const 0)))
      (call $support::test::assert (call $system::core::==_1 (call $test::isRed (call $CustomType (i32.const 5) (i32.const 5) (i32.const 5))) (i32.const 0)))
    )
  )
  (func $RedType (result i64)
    (i64.const 0x100000000)
  )
  (func $test::is (param $a i64) (result i32)
    (i64.eq (i64.and (i64.const 0xffffffff00000000) (get_local $a)) (i64.const 0x100000000))
  )
  (func $test::is_1 (param $a i64) (result i32)
    (i64.eq (i64.and (i64.const 0xffffffff00000000) (get_local $a)) (i64.const 0x200000000))
  )
  (func $test::is_2 (param $a i64) (result i32)
    (i64.eq (i64.and (i64.const 0xffffffff00000000) (get_local $a)) (i64.const 0x300000000))
  )
  (func $test::is_3 (param $a i64) (result i32)
    (i64.eq (i64.and (i64.const 0xffffffff00000000) (get_local $a)) (i64.const 0x400000000))
  )
  (func $GreenType (result i64)
    (i64.const 0x200000000)
  )
  (func $BlueType (result i64)
    (i64.const 0x300000000)
  )
  (func $CustomType (param $r i32) (param $g i32) (param $b i32) (result i64)
    (local $_newRef i32)
    (set_local $_newRef (call $system::memory::malloc (i32.const 8)))
    (i64.or (i64.const 0x400000000) (i64.extend_u/i32 (get_local $_newRef)))
  )
  (func $%%START%%
    (set_global $AL_BITS (i32.const 3))
    (set_global $AL_SIZE (call $system::core::<<_1 (i32.const 1) (get_global $AL_BITS)))
    (set_global $AL_MASK (call $system::core::-_1 (get_global $AL_SIZE) (i32.const 1)))
    (set_global $MAX_SIZE_32 (call $system::core::<<_1 (i32.const 1) (i32.const 30)))
    (set_global $HEAP_BASE (i32.const 0))
    (set_global $startOffset (call $system::core::& (call $system::core::+_1 (get_global $HEAP_BASE) (get_global $AL_MASK)) (call $system::core::~_1 (get_global $AL_MASK))))
    (set_global $offset (get_global $startOffset))
    (set_global $lastPtr (i32.const 0))
  )
  (start $%%START%%)
)
