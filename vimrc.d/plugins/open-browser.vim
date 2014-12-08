NeoBundle 'tyru/open-browser.vim'

" open-browser.vim
" カーソル下のURLをブラウザで開く
nmap <Leader>o <Plug>(openbrowser-open)
vmap <Leader>o <Plug>(openbrowser-open)

let g:netrw_nogx = 1 " disable netrw's gx mapping.

nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)
