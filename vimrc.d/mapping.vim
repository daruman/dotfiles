" 検索時、正規表現をmagicからvery magicに
" via@http://deris.hatenablog.jp/entry/2013/05/15/024932
nnoremap /  /\v

" コンマの後に自動的にスペースを挿入
inoremap , ,<Space>

" Ctrl+Pで0レジスターペースト
vnoremap <silent> <C-p> "0p<CR>

" ;でコマンド入力( ;を:とする)
noremap ; :

" exモード無効化
nnoremap Q <Nop>
