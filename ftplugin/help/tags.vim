autocmd BufWritePost *.txt if &ft == 'help' | helptags ./ | endif
