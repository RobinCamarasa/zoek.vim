" Redefine tags
onoremap it :<c-u>execute "normal! e?__\rv/[\\*\\\|]\rh"<cr>
vnoremap it :<c-u>execute "normal! e?__\rv/[\\*\\\|]\rh"<cr>

onoremap at :<c-u>execute "normal! e?__\rv/[\\*\\\|]\roh"<cr>
vnoremap at :<c-u>execute "normal! e?__\rv/[\\*\\\|]\roh"<cr>

if exists('*s:MainTagOperator')
    finish
endif

nnoremap <localleader>t :set operatorfunc=<SID>MainTagOperator<cr>g@
vnoremap <localleader>t :<c-u>call <SID>MainTagOperator(visualmode())<cr>

function! s:MainTagOperator(type)
    let saved_register = @@
    if a:type ==# 'v'
        execute "normal! `<v`>y"
    elseif a:type ==# 'char'
        execute "normal! `[v`]y"
    else
        return
    endif
    silent execute "normal! mM"

    silent execute "tag " . @@

    setl noro ma
    silent execute "normal f_ditr|h.p"
    silent update
    setl ro noma

    silent execute "normal `M"
    setl noro ma
    silent execute "normal ditr*h.p"
    silent update
    setl ro noma

    let @@ = saved_register
    redraw!
endfunction
