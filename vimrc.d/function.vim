
" fullscreen
" --------------------------------------------------------------------------------
" via@http://nanabit.net/blog/2007/11/01/vim-fullscreen/
if has("gui_macvim")
    " Lion以前のフルスクリーンに戻す場合は以下のコマンドを実行
    " defaUlts write org.vim.MacVim MMNativeFullScreen 0
    set fuoptions=maxvert,maxhorz
    au GUIEnter * set fullscreen
elseif has("win32")
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
endif

























