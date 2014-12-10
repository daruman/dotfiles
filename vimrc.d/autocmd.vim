" 特定フォーマットのファイル作成または読み込み時
" 指定ファイルタイプとみなし指定シンタックスを使用出来るようにする
augroup syntax
    autocmd!
    autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
augroup END

" 保存時に行末の空白を除去する("文字列の後にspaceが2個"時はmarkdown記法の改行なので削除しない)
" 1.連続していない行末のspace 1つを削除
" 2.行頭から行末までwhitespaceしかない場合は削除
" 3.行末のspace 3つ以上を削除
" 4.行末のtabを削除
autocmd vimrc BufWritePre * :%s/[^[:blank:]]\zs\s\{1\}$\|^\s\+$\|[ ]\{3,\}$\|\t\+$//ge

" phpを保存する際にphp -l
augroup php
    autocmd!

    " 失敗した時だけechoする
    " @link [dotfiles/.vimrc at master · ksss/dotfiles](https://github.com/ksss/dotfiles/blob/master/.vimrc#L105)
    function! s:phplint()
        if &filetype == 'php'
            let l:ret = system(printf("php -l %s", expand('%')))
            if l:ret !~ '^No.*'
                echo l:ret
            endif
        endif
    endfunction

    " PHP保存した時にlint
    autocmd BufWritePost * call s:phplint()

augroup END

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

" 前回のカーソル位置を再現
" @link [Keep cursor's column position after buffer switch : サイト更新停滞ちうっ [ 名無しのVIM使い ]](http://advweb.seesaa.net/article/13443981.html)
augroup vimrcEx
    autocmd!
    autocmd BufRead * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif
augroup END
