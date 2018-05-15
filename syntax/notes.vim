if exists("b:current_syntax")
  finish
endif

if !exists('main_syntax')
  let main_syntax = 'notes'
endif

unlet! b:current_syntax

" https://jonasjacek.github.io/colors/
let brightBlue=[81, "#5fd7ff"]
" let brightOrange=[208, "#ff8700"] 
let brightOrange=[214, "#ff8700"] 

" the 3rd argument is the optional background
function! MakeHighlight(name, fg, ...)
    let hiStr="hi! ".a:name." ctermfg=".a:fg[0]." guifg=".a:fg[1]
    if a:0 >= 1
        let bg=a:1
        let hiStr = hiStr." ctermbg=".bg[0]." guibg=".bg[1]
    endif
    exec hiStr
endfunction

call MakeHighlight("NotesBullet", brightBlue)
call MakeHighlight("NotesHeader", brightOrange)
" exec "hi! NotesBullet guifg=red guibg=green ctermfg=#000000 ctermbg=green"

" syn case ignore

syn region notesListMarker start="\v\s*(\*|#)" end="" keepend
syn region notesHeaderUnderline start="\v.*\w\n\=\=\=" end="=$" keepend
syn keyword notesTodo TODO NOTE skipwhite

" hi def link markdownListMarker htmlTagName
hi def link notesListMarker NotesBullet
hi def link notesHeaderUnderline NotesHeader
hi def link notesTodo Todo

let b:current_syntax = "notes"

