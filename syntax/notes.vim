if exists("b:current_syntax")
  finish
endif

if !exists('main_syntax')
  let main_syntax = 'notes'
endif

unlet! b:current_syntax

syn case ignore


let b:current_syntax = "notes"
