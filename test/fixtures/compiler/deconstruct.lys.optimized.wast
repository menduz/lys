(module
 (type $0 (func (result i32)))
 (type $1 (func (param i64) (result i32)))
 (type $2 (func))
 (type $3 (func (param i32) (result i32)))
 (type $4 (func (param i64) (result i64)))
 (memory $0 1)
 (data (i32.const 16) "4\00\00\00t\00r\00y\00i\00n\00g\00 \00t\00o\00 \00a\00l\00l\00o\00c\00a\00t\00e\00 \000\00 \00b\00y\00t\00e\00s")
 (global $global$0 (mut i32) (i32.const 0))
 (global $global$1 (mut i32) (i32.const 0))
 (global $global$2 (mut i32) (i32.const 0))
 (global $global$3 (mut i32) (i32.const 0))
 (global $global$4 (mut i32) (i32.const 0))
 (global $global$5 (mut i32) (i32.const 0))
 (global $global$6 (mut i32) (i32.const 0))
 (export "memory" (memory $0))
 (export "test_getMaxMemory" (func $0))
 (export "isRed" (func $3))
 (start $4)
 (func $0 (; 0 ;) (type $0) (result i32)
  (global.get $global$6)
 )
 (func $1 (; 1 ;) (type $3) (param $0 i32) (result i32)
  (i32.shl
   (i32.const 1)
   (local.get $0)
  )
 )
 (func $2 (; 2 ;) (type $4) (param $0 i64) (result i64)
  (i64.shl
   (local.get $0)
   (i64.const 32)
  )
 )
 (func $3 (; 3 ;) (type $1) (param $0 i64) (result i32)
  (block $label$1 (result i32)
   (if
    (i64.ne
     (call $2
      (i64.const 2)
     )
     (i64.and
      (local.get $0)
      (i64.const -4294967296)
     )
    )
    (block
     (drop
      (br_if $label$1
       (i32.const 0)
       (i64.ne
        (call $2
         (i64.const 5)
        )
        (i64.and
         (local.get $0)
         (i64.const -4294967296)
        )
       )
      )
     )
     (br $label$1
      (i32.eq
       (i32.load
        (i32.wrap_i64
         (local.get $0)
        )
       )
       (i32.const 16711680)
      )
     )
    )
   )
   (i32.const 1)
  )
 )
 (func $4 (; 4 ;) (type $2)
  (global.set $global$0
   (i32.const 3)
  )
  (global.set $global$1
   (call $1
    (global.get $global$0)
   )
  )
  (global.set $global$2
   (i32.sub
    (global.get $global$1)
    (i32.const 1)
   )
  )
  (global.set $global$3
   (call $1
    (i32.const 30)
   )
  )
  (global.set $global$4
   (i32.const 65536)
  )
  (global.set $global$5
   (i32.and
    (i32.add
     (global.get $global$4)
     (global.get $global$2)
    )
    (i32.xor
     (global.get $global$2)
     (i32.const -1)
    )
   )
  )
  (global.set $global$6
   (global.get $global$5)
  )
 )
)
