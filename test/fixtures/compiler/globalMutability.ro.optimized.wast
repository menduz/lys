(module
 (type $0 (func (result i32)))
 (type $1 (func))
 (global $global$0 (mut i32) (i32.const 0))
 (global $global$1 (mut i32) (i32.const 0))
 (global $global$2 (mut i32) (i32.const 0))
 (export "main" (func $0))
 (start $1)
 (func $0 (; 0 ;) (; has Stack IR ;) (type $0) (result i32)
  (set_global $global$0
   (i32.sub
    (i32.add
     (get_global $global$0)
     (i32.const 1)
    )
    (get_global $global$2)
   )
  )
  (get_global $global$0)
 )
 (func $1 (; 1 ;) (; has Stack IR ;) (type $1)
  (set_global $global$0
   (i32.const 2)
  )
  (set_global $global$1
   (i32.const 1)
  )
  (set_global $global$2
   (i32.sub
    (get_global $global$1)
    (get_global $global$0)
   )
  )
 )
)