(module
 (type $0 (func (param i32)))
 (type $1 (func (param i32 i32)))
 (type $2 (func))
 (type $3 (func (result i32)))
 (type $4 (func (param i32 i64)))
 (import "test" "pushTest" (func $fimport$0 (param i32)))
 (import "test" "registerAssertion" (func $fimport$1 (param i32 i32)))
 (import "test" "popTest" (func $fimport$2))
 (memory $0 1)
 (data (i32.const 353) "4\00\00\00t\00r\00y\00i\00n\00g\00 \00t\00o\00 \00a\00l\00l\00o\00c\00a\00t\00e\00 \000\00 \00b\00y\00t\00e\00s")
 (data (i32.const 311) "\08\00\00\00t\00r\00u\00e")
 (data (i32.const 324) "\n\00\00\00f\00a\00l\00s\00e")
 (data (i32.const 339) "\02\00\00\000")
 (data (i32.const 346) "\02\00\00\000")
 (data (i32.const 280) "\1a\00\00\00a\00s\00s\00e\00r\00t\00(\00f\00a\00l\00s\00e\00)")
 (data (i32.const 16) "(\00\00\00N\00u\00m\00b\00e\00r\00 \00s\00a\00n\00i\00t\00y\00 \00c\00h\00e\00c\00k\00s")
 (data (i32.const 61) "\02\00\00\001")
 (data (i32.const 68) "\0c\00\00\000\00 \00/\00 \001\000")
 (data (i32.const 85) "\0e\00\00\001\000\00 \00/\00 \001\000")
 (data (i32.const 104) "\10\00\00\001\000\00 \00/\00 \001\000\000")
 (data (i32.const 125) "\02\00\00\002")
 (data (i32.const 132) "(\00\00\000\00x\00F\00F\00F\00F\00 \00a\00s\00 \00i\001\006\00 \00a\00s\00 \00i\003\002")
 (data (i32.const 177) "(\00\00\000\00x\008\000\000\000\00 \00a\00s\00 \00i\001\006\00 \00a\00s\00 \00i\003\002")
 (data (i32.const 222) "\02\00\00\003")
 (data (i32.const 229) "\02\00\00\004")
 (data (i32.const 236) "\02\00\00\005")
 (data (i32.const 243) "\02\00\00\006")
 (data (i32.const 250) "\02\00\00\007")
 (data (i32.const 257) "\02\00\00\008")
 (data (i32.const 264) "\02\00\00\009")
 (data (i32.const 271) "\04\00\00\001\000")
 (global $global$0 (mut i32) (i32.const 0))
 (global $global$1 (mut i32) (i32.const 0))
 (global $global$2 (mut i32) (i32.const 0))
 (global $global$3 (mut i32) (i32.const 0))
 (global $global$4 (mut i32) (i32.const 0))
 (global $global$5 (mut i32) (i32.const 0))
 (global $global$6 (mut i32) (i32.const 0))
 (global $global$7 (mut i64) (i64.const 0))
 (export "memory" (memory $0))
 (export "test_getMaxMemory" (func $0))
 (export "test_getLastErrorMessage" (func $1))
 (export "main" (func $3))
 (start $4)
 (func $0 (; 3 ;) (type $3) (result i32)
  (global.get $global$6)
 )
 (func $1 (; 4 ;) (type $3) (result i32)
  (local $0 i64)
  (block $label$1 (result i32)
   (drop
    (br_if $label$1
     (i32.const 0)
     (i64.ne
      (i64.and
       (local.tee $0
        (global.get $global$7)
       )
       (i64.const -4294967296)
      )
      (i64.const 77309411328)
     )
    )
   )
   (i32.wrap_i64
    (i64.load
     (i32.wrap_i64
      (local.get $0)
     )
    )
   )
  )
 )
 (func $2 (; 5 ;) (type $4) (param $0 i32) (param $1 i64)
  (call $fimport$1
   (local.get $0)
   (i32.wrap_i64
    (local.get $1)
   )
  )
 )
 (func $3 (; 6 ;) (type $2)
  (call $fimport$0
   (i32.const 16)
  )
  (call $2
   (i32.const 1)
   (i64.const 61)
  )
  (call $2
   (i32.const 1)
   (i64.const 68)
  )
  (call $2
   (i32.const 1)
   (i64.const 85)
  )
  (call $2
   (i32.const 1)
   (i64.const 104)
  )
  (call $2
   (i32.const 1)
   (i64.const 125)
  )
  (call $2
   (i32.const 1)
   (i64.const 132)
  )
  (call $2
   (i32.const 1)
   (i64.const 177)
  )
  (call $2
   (i32.const 1)
   (i64.const 222)
  )
  (call $2
   (i32.const 1)
   (i64.const 229)
  )
  (call $2
   (i32.const 1)
   (i64.const 236)
  )
  (call $2
   (i32.const 1)
   (i64.const 243)
  )
  (call $2
   (i32.const 1)
   (i64.const 250)
  )
  (call $2
   (i32.const 1)
   (i64.const 257)
  )
  (call $2
   (i32.const 1)
   (i64.const 264)
  )
  (call $2
   (i32.const 1)
   (i64.const 271)
  )
  (call $fimport$2)
 )
 (func $4 (; 7 ;) (type $2)
  (global.set $global$0
   (i32.const 3)
  )
  (global.set $global$1
   (i32.shl
    (i32.const 1)
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
   (i32.const 1073741824)
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
  (global.set $global$7
   (i64.const 73014444032)
  )
 )
)
