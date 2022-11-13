function s:ToggleModifications()
    if &ma
        write
        setl noma ro nonumber norelativenumber colorcolumn=
    else
        setl ma noro number relativenumber colorcolumn=80 tw=80
    endif
endfunction

nnoremap <localleader>m :call <SID>ToggleModifications()<CR>
nnoremap gd :call execute("normal yit")<CR>:tag <c-r>0<CR>
