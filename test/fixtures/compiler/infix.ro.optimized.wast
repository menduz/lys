(module
 (type $0 (func (param i32 i32) (result i32)))
 (type $3 (func (param f32 f32) (result f32)))
 (export "testInt" (func $75))
 (export "testFloat" (func $76))
 (func $75 (; 0 ;) (; has Stack IR ;) (type $0) (param $0 i32) (param $1 i32) (result i32)
  (i32.add
   (get_local $0)
   (get_local $1)
  )
 )
 (func $76 (; 1 ;) (; has Stack IR ;) (type $3) (param $0 f32) (param $1 f32) (result f32)
  (f32.add
   (get_local $0)
   (get_local $1)
  )
 )
)
