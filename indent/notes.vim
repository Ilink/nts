if exists('b:did_indent')
  finish
endif

let b:did_indent = 1

setlocal indentexpr=GetNotesIndent(v:lnum)

function! GetNotesIndent(lnum) 
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

    let indent = indent(lnum)

    if prevline =~# '\v(\*|#).*'
        let spaces_after_star = 1
        " the +1 is because the * itself counts as part of the indent
        let new_indent = indent + spaces_after_star + 1
        return new_indent
    endif

    return indent

endfunction
