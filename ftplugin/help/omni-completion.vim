function s:GetTags()
    return split(system('find ./ -name ''*.txt'' \| sed -e ''s:^\\./\\(.*\\)$:\|\\1\|:g''')) + split(system('cat *.txt | tr '' '' ''\n'' | grep ''^[|\\*].*[|\\*]$'' | tr -d ''*'' | tr -d ''|'' | sort | uniq'), '\n')
endfunction

function! s:CompleteTag(findstart, base)
    if a:findstart
        normal! mmB
        let start = col('.') - 1
        normal! `m
        return start
    else
        let s:istag = 1
        let s:tags = <SID>GetTags()

        " Check if tag exist
        for tag in s:tags
            if tag == '__' .. a:base
                let s:istag = 0
            endif
        endfor

        if s:istag == 1
            call complete_add('*__' . tolower(a:base) . '*')
        endif

        for tag in <SID>GetTags()
            if tag =~ '\v' . a:base
                call complete_add('|' . tag . '|')
            endif
        endfor
        call complete_add(a:base)
        call complete_add(tolower(a:base))
    endif
endfunction

set completefunc=<SID>GetTags
set omnifunc=<SID>CompleteTag
