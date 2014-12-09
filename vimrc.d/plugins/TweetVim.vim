" Lazyすると :Unite tweetvim が効かなくなるので通常load
NeoBundle 'basyura/TweetVim', {
            \ 'depends' : ['basyura/twibill.vim', 'open-browser.vim', 'webapi-vim', 'unite.vim'],
            \}


" @link [TweetVim 1.0 をリリースします！！！ - basyura's blog](http://blog.basyura.org/entry/20111230/p1)
" タイムライン選択用の Unite を起動する
nnoremap <silent> tt :Unite tweetvim<CR>

" 発言用バッファを表示する
nnoremap <silent> ss :TweetVimSay<CR>

let s:hooks = neobundle#get_hooks("TweetVim")
function! s:hooks.on_source(bundle)
    " スクリーン名のキャッシュを利用して、neocomplcache で補完する
    if !exists('g:neocomplete#sources#dictionary#dictionaries')
        let g:neocomplete#sources#dictionary#dictionaries = {}
    endif

    let g:neco_dic = g:neocomplete#sources#dictionary#dictionaries
    let g:neco_dic.tweetvim_say = $HOME . '/.tweetvim/screen_name'
endfunction

