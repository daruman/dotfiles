NeoBundle 'scrooloose/nerdcommenter'

" defaultのキーマップを解除
let g:NERDCreateDefaultMappings = 0

" コメント記号の後ろに半角スペース一つ追加
let NERDSpaceDelims = 1

nmap <Leader>/ <Plug>NERDCommenterToggle
vmap <Leader>/ <Plug>NERDCommenterToggle

" sexyCommentは
" 例えば複数行コメントを // ではなく /* * */ 形式でコメントアウトしてくれる
vmap <Leader>/s <Plug>NERDCommenterSexy
