
" php lint
  autocmd!
  autocmd FileType php set makeprg=php\ -l\ %
  " php -lの構文チェックでエラーがなければ「No syntax errors」の一行だけ出力される
  autocmd BufWritePost *.php silent make | if len(getqflist()) != 1 | copen | else | cclose | endif
