echom "indent notes"

let test="* notes"
if test =~# '\v\*.*'
    echom "prev line starts with * (is a list)"
endif



if exists('b:did_indent')
  finish
endif

let b:did_indent = 1

setlocal indentexpr=GetNotesIndent(v:lnum)

" let s:save_cpo = &cpo
" set cpo&vim

function! GetNotesIndent(lnum) 
    echom "getNotesIndent"

    if !exists('b:indent_ignore')
        " this is safe, since we skip blank lines anyway
        let b:indent_ignore='^$'
    endif

    " Find a non-blank line above the current line.
    let lnum = prevnonblank(a:lnum - 1)
    while lnum > 0 && getline(lnum) =~ b:indent_ignore
        let lnum = prevnonblank(lnum - 1)
    endwhile
    if lnum == 0
        return 0
    endif
    let curline = getline(a:lnum)
    let prevline = getline(lnum)
    echom "curline: " . curline
    echom "prevline: " . prevline


    let indent = indent(lnum)
    " if ( prevline =~ b:indent_block_start )
    "     let indent = indent + &sw
    " endif
    " if (curline =~ b:indent_block_end )
    "     let indent = indent - &sw
    " endif
    " return indent

    if prevline =~# '\v\*.*'
        echom "prev line starts with * (is a list)"
        return 2
    endif

endfunction


" let &cpo = s:save_cpo
" unlet s:save_cpo
