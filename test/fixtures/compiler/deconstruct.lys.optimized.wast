(module
 (type $0 (func (param i32) (result i32)))
 (type $1 (func (param i32 i32) (result i32)))
 (type $2 (func (param i64) (result i32)))
 (type $3 (func))
 (memory $0 1)
 (global $global$0 (mut i32) (i32.const 0))
 (global $global$1 (mut i32) (i32.const 0))
 (global $global$2 (mut i32) (i32.const 0))
 (global $global$3 (mut i32) (i32.const 0))
 (global $global$4 (mut i32) (i32.const 0))
 (global $global$5 (mut i32) (i32.const 0))
 (global $global$6 (mut i32) (i32.const 0))
 (global $global$7 (mut i32) (i32.const 0))
 (export "memory" (memory $0))
 (export "isRed" (func $7))
 (start $8)
 (func $0 (; 0 ;) (type $1) (param $0 i32) (param $1 i32) (result i32)
  (i32.and
   (local.get $0)
   (local.get $1)
  )
 )
 (func $1 (; 1 ;) (type $1) (param $0 i32) (param $1 i32) (result i32)
  (i32.add
   (local.get $0)
   (local.get $1)
  )
 )
 (func $2 (; 2 ;) (type $1) (param $0 i32) (param $1 i32) (result i32)
  (i32.sub
   (local.get $0)
   (local.get $1)
  )
 )
 (func $3 (; 3 ;) (type $0) (param $0 i32) (result i32)
  (i32.xor
   (local.get $0)
   (i32.const -1)
  )
 )
 (func $4 (; 4 ;) (type $1) (param $0 i32) (param $1 i32) (result i32)
  (i32.shl
   (local.get $0)
   (local.get $1)
  )
 )
 (func $5 (; 5 ;) (type $2) (param $0 i64) (result i32)
  (i64.eq
   (i64.and
    (local.get $0)
    (i64.const -4294967296)
   )
   (i64.const 8589934592)
  )
 )
 (func $6 (; 6 ;) (type $2) (param $0 i64) (result i32)
  (i64.eq
   (i64.and
    (local.get $0)
    (i64.const -4294967296)
   )
   (i64.const 21474836480)
  )
 )
 (func $7 (; 7 ;) (type $2) (param $0 i64) (result i32)
  (block $label$1 (result i32)
   (if
    (i32.eqz
     (call $5
      (local.get $0)
     )
    )
    (block
     (drop
      (br_if $label$1
       (i32.const 0)
       (i32.eqz
        (call $6
         (local.get $0)
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
 (func $8 (; 8 ;) (type $3)
  (global.set $global$0
   (i32.const 3)
  )
  (global.set $global$1
   (call $4
    (i32.const 1)
    (global.get $global$0)
   )
  )
  (global.set $global$2
   (call $2
    (global.get $global$1)
    (i32.const 1)
   )
  )
  (global.set $global$3
   (call $4
    (i32.const 1)
    (i32.const 30)
   )
  )
  (global.set $global$4
   (i32.const 0)
  )
  (global.set $global$5
   (call $0
    (call $1
     (global.get $global$4)
     (global.get $global$2)
    )
    (call $3
     (global.get $global$2)
    )
   )
  )
  (global.set $global$6
   (global.get $global$5)
  )
  (global.set $global$7
   (i32.const 0)
  )
 )
)