let g:zk_path="~/.local/share/zettelkasten/"

function! s:HandleNote(title)
    update
    if &ft != "help" 
        tabnew 
    endif
    let stem = '__' .. join(split(tolower(a:title), ' '), '-') .. '.txt'
    let filename = expand(g:zk_path .. 'doc/' .. stem)
    if filereadable(filename)
        echom filereadable(filename)
        call execute('edit ' . filename)
        setl ft=help ma noro number relativenumber colorcolumn=80 tw=80
    else
        call execute('edit ' .. filename)
        call execute("normal! i" .. "*" .. stem .. "*\r\r\r\r================================================================================\r\rvim: ft=help")
        setl ft=help ma noro number relativenumber colorcolumn=80 tw=80
        write
    endif
    call execute("normal! :3\r")
endfunction

command -nargs=* -complete=file -bar ZK :call <SID>HandleNote('<args>')

function! s:Search(search)
    "Generate new tab if necessary
    update
    if &ft != "help" 
        tabnew 
    endif
    call execute('grep ''' .. a:search .. ''' -R ' .. g:zk_path .. 'doc/ --exclude tags')
    cdo execute('setl ro noma nonumber norelativenumber')
    redraw!
    copen
endfunction

command -nargs=* -complete=file -bar ZS :call <SID>Search('<args>')

nnoremap <leader>zz :ZK 
nnoremap <leader>z/ :ZS 
