(module
  (func $fibonacci(param $index i32) (result i32) (local $fibn i32) (local $fibn1 i32) (local $fibn2 i32)  (local $n i32)
  i32.const 0
  ;; this is declared in (local $fibn i32) then is used in the next source code line
  local.set $fibn

  i32.const 0
  local.set $fibn

  i32.const 1
  local.set $fibn1

  i32.const 0
  local.set $fibn2

  local.get $index
  local.set $n 
  (block 
  ;;jump of br 0
  ;; block is used for all of loops , branches in source code ... 
    (loop 
    ;;jump of br_if 1
      ;; same loops can be used for while , for , ... webassembly doesn't distinguish between the type of looops
      ;; n > 0 
      ;; first let see the n on the stack
      local.get $n
      ;; set the value to compare
      i32.const 0 
      ;; check the equality of the n with 0, n = 0 the result will be 1 and if not will be 0
      i32.eq 
      ;; this will break the loop only if is n result > 0 and will break here in the (loop ...) and will stay on the (block ...) area 
      br_if 1 
      ;; fibn2 = fibn1;
      ;; get fibn1 value ... and set it in the top of the stack for fibn2 
      local.get $fibn1
      ;; set this value for the fibn2 
      local.set $fibn2

      ;; fibn1 = fibn; similar with fibn2 = fibn1;
      local.get $fibn
      local.set $fibn1 

      ;; fibn = fibn1 + fibn2;
      local.get $fibn1
      local.get $fibn2
      i32.add
      ;; the result of the add is stored in the stack on fibn 
      local.set $fibn

      ;; n--;
      ;; take the n and push pono stack 
      local.get $n
      ;; set a constant value to 1 
      i32.const 1
      ;; make an substract operation 
      i32.sub 
      ;; the result is the substract is stored in the stack on n
      local.set $n

      ;; this sending the result to the start of the loop 
      ;; branch is set to zero and will go to the start of the loop , is similar with an old GOTO instruction
      ;; the old GOTO is a little evil , but works well with the stack ordering 
      ;; br 0 - goto the top on the current block and in the front of the first (block ... ) 
      ;; br 1 - will goto the next block source code wich is the (loop ... ), in this case in the area of declaration (block ... ) 
      br 0
    )
  )
  ;; after all calculations the stack will have the result of fibonacci
  local.get $fibn
  )
  ;; export this function like this ...
  (export "fibonacci" (func $fibonacci))
)
;; use wat2wasm tool to create fibonacci.wasm with this command  E:/wabt/bin/wat2wasm fibonacci.wat -o fibonacci.wasm 