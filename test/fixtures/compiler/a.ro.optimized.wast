(module
 (type $1 (func (param i32 i32) (result i32)))
 (type $5 (func (param f32 f32) (result f32)))
 (type $7 (func (param i32) (result i32)))
 (type $14 (func (result i32)))
 (type $15 (func (param f32 f64) (result f32)))
 (export "test" (func $101))
 (export "test0" (func $101))
 (export "testa" (func $103))
 (export "floatingPoints" (func $104))
 (export "addFloat" (func $105))
 (export "addInts" (func $106))
 (export "x" (func $107))
 (func $14 (; 0 ;) (; has Stack IR ;) (type $5) (param $0 f32) (param $1 f32) (result f32)
  (f32.add
   (get_local $0)
   (get_local $1)
  )
 )
 (func $101 (; 1 ;) (; has Stack IR ;) (type $14) (result i32)
  (i32.const 1)
 )
 (func $103 (; 2 ;) (; has Stack IR ;) (type $7) (param $0 i32) (result i32)
  (get_local $0)
 )
 (func $104 (; 3 ;) (; has Stack IR ;) (type $15) (param $0 f32) (param $1 f64) (result f32)
  (get_local $0)
 )
 (func $105 (; 4 ;) (; has Stack IR ;) (type $5) (param $0 f32) (param $1 f32) (result f32)
  (call $14
   (get_local $0)
   (get_local $1)
  )
 )
 (func $106 (; 5 ;) (; has Stack IR ;) (type $1) (param $0 i32) (param $1 i32) (result i32)
  (i32.add
   (get_local $0)
   (get_local $1)
  )
 )
 (func $107 (; 6 ;) (; has Stack IR ;) (type $5) (param $0 f32) (param $1 f32) (result f32)
  (f32.mul
   (call $14
    (get_local $0)
    (f32.const 1)
   )
   (get_local $1)
  )
 )
)
