" IMEがonの場合はカーソルを赤くする
" http://www.e2esound.com/wp/2010/11/07/add_vimrc_settings/
hi CursorIM  guifg=black  guibg=red  gui=NONE  ctermfg=black  ctermbg=white  cterm=reverse

" バックスペースでindent無視 & 改行超えてバックスペース許可
set guioptions=indent,eol




" fullscreen
" --------------------------------------------------------------------------------
" via@http://nanabit.net/blog/2007/11/01/vim-fullscreen/
" windows用
nnoremap <F11> :call ToggleFullScreen()<CR>
function! ToggleFullScreen()
    if &guioptions =~# 'C'
        set guioptions-=C
        if exists('s:go_temp')
            if s:go_temp =~# 'm'
                set guioptions+=m
            endif
            if s:go_temp =~# 'T'
                set guioptions+=T
            endif
        endif
        simalt ~r
    else
        let s:go_temp = &guioptions
        set guioptions+=C
        set guioptions-=m
        set guioptions-=T
        simalt ~x
    endif
endfunction

set guioptions-=T
set guioptions-=m
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L
set guioptions-=b

