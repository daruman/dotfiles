" gitのcommit log編集editerをvimにしているなら、編集画面をリッチにしてくれる
" 入れておくだけで良い

NeoBundle 'rhysd/committia.vim', {
            \ 'depends' : 'tpope/vim-fugitive',
            \}

" commitlog編集状態でも<C-n><C-p>でdiffのスクロール可能
" @link [momonga.vim #5 でコミットバッファ編集プラグイン committia.vim を完成させた - sorry, uninuplemented:](http://rhysd.hatenablog.com/entry/2014/08/01/222251)
let g:committia_hooks = {}
function! g:committia_hooks.edit_open(info)
    " Additional settings
    setlocal spell

    " If no commit message, start with insert mode
    if a:info.vcs ==# 'git' && getline(1) ==# ''
        startinsert
    end

    " Scroll the diff window from insert mode
    " Map <C-n> and <C-p>
    imap <buffer><C-n> <Plug>(committia-scroll-diff-down-half)
    imap <buffer><C-p> <Plug>(committia-scroll-diff-up-half)

endfunction
