" 特定フォーマットのファイル作成または読み込み時、指定ファイルタイプとみなし指定シンタックスを使用
"autocmd BufRead,BufNewFile jquery.*.js set filetype=javascript syntax=jquery
"autocmd BufNewFile,BufRead *.twig set filetype=twig syntax=jinja
"autocmd BufNewFile,BufRead *.js set filetype=javascript
autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown

" 保存時に行末の空白を除去する("文字列の後にspaceが2個"時はmarkdown記法の改行なので削除しない)
" 1.連続していない行末のspace 1つを削除
" 2.行頭から行末までwhitespaceしかない場合は削除
" 3.行末のspace 3つ以上を削除
" 4.行末のtabを削除
autocmd BufWritePre * :%s/[^[:blank:]]\zs\s\{1\}$\|^\s\+$\|[ ]\{3,\}$\|\t\+$//ge

" phpを保存する際にphp -l
autocmd FileType php set makeprg=php\ -l\ %
autocmd BufWritePost *.php silent make | if len(getqflist()) != 1 | copen | else | cclose | endif

" scssファイルを:makeでcssにコンパイル
augroup SassAutoCommands
    autocmd!
    autocmd FileType sass,scss compiler scss
augroup END

" jsファイルを:makeで圧縮
augroup JavascriptAutoCommands
    autocmd!
    autocmd FileType javascript compiler closurecompiler
augroup END

