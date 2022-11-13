setlocal foldmethod=expr
setlocal foldexpr=GetHelpFold(v:lnum)

function! GetHelpFold(lnum)
    if getline(a:lnum) =~? 'vim: ft=help'
        return '1'
    endif
    if getline(a:lnum + 1) =~? 'vim: ft=help'
        return '1'
    endif
    if getline(a:lnum + 2) =~? 'vim: ft=help'
        return '1'
    endif

    return '0'
endfunction
