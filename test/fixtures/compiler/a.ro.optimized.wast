(module
 (type $0 (func (param i32 i32) (result i32)))
 (type $3 (func (param f32 f32) (result f32)))
 (type $4 (func (param i32) (result i32)))
 (type $8 (func (result i32)))
 (type $9 (func (param f32 f64) (result f32)))
 (export "test" (func $73))
 (export "test0" (func $73))
 (export "testa" (func $75))
 (export "floatingPoints" (func $76))
 (export "addFloat" (func $77))
 (export "addInts" (func $78))
 (export "x" (func $79))
 (func $11 (; 0 ;) (; has Stack IR ;) (type $3) (param $0 f32) (param $1 f32) (result f32)
  (f32.add
   (get_local $0)
   (get_local $1)
  )
 )
 (func $73 (; 1 ;) (; has Stack IR ;) (type $8) (result i32)
  (i32.const 1)
 )
 (func $75 (; 2 ;) (; has Stack IR ;) (type $4) (param $0 i32) (result i32)
  (get_local $0)
 )
 (func $76 (; 3 ;) (; has Stack IR ;) (type $9) (param $0 f32) (param $1 f64) (result f32)
  (get_local $0)
 )
 (func $77 (; 4 ;) (; has Stack IR ;) (type $3) (param $0 f32) (param $1 f32) (result f32)
  (call $11
   (get_local $0)
   (get_local $1)
  )
 )
 (func $78 (; 5 ;) (; has Stack IR ;) (type $0) (param $0 i32) (param $1 i32) (result i32)
  (i32.add
   (get_local $0)
   (get_local $1)
  )
 )
 (func $79 (; 6 ;) (; has Stack IR ;) (type $3) (param $0 f32) (param $1 f32) (result f32)
  (f32.mul
   (call $11
    (get_local $0)
    (f32.const 1)
   )
   (get_local $1)
  )
 )
)
