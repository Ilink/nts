if exists("b:current_syntax")
  finish
endif

if !exists('main_syntax')
  let main_syntax = 'notes'
endif

unlet! b:current_syntax

" https://jonasjacek.github.io/colors/
let brightBlue=[81, "#5fd7ff"]
let brightOrange=[214, "#ff8700"] 
let darkTurqoise=[44, "#00d7d7"] 

" the 3rd argument is the optional background
function! MakeHighlight(name, fg, isBold, ...)
    let hiStr="hi! ".a:name." ctermfg=".a:fg[0]." guifg=".a:fg[1]
    if a:isBold
        let hiStr = hiStr." cterm=bold"
    endif
    if a:0 >= 1
        let bg=a:1
        let hiStr = hiStr." ctermbg=".bg[0]." guibg=".bg[1]
    endif
    exec hiStr
endfunction

call MakeHighlight("NotesBullet", brightBlue, 0)
call MakeHighlight("NotesHeader", brightOrange, 1)
call MakeHighlight("NotesSubHeader", darkTurqoise, 0)

" syn case ignore

syn region notesListMarker start="\v^\s*(\*|#)" end="" keepend
syn region notesHeaderUnderline start="\v.*\w\n\=\=\=" end="=$" keepend
syn region notesSubHeaderUnderline start="\v.*\w\n\~\~\~" end="\~$" keepend
syn keyword notesTodo TODO NOTE skipwhite

" hi def link markdownListMarker htmlTagName
hi def link notesListMarker NotesBullet
hi def link notesHeaderUnderline NotesHeader
hi def link notesSubHeaderUnderline NotesSubHeader
hi def link notesTodo Todo

let b:current_syntax = "notes"

