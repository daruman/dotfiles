" vimrcのproject localな設定load
" [Vimでプロジェクト固有の設定を適用する - Qiita](http://qiita.com/unosk/items/43989b61eff48e0665f3)
" .vimrc.localファイルをプロジェクトディレクトリのrootに配置
augroup vimrc-local
  autocmd!
  autocmd BufNewFile,BufReadPost * call s:vimrc_local(expand('<afile>:p:h'))
augroup END

function! s:vimrc_local(loc)
  let files = findfile('.vimrc.local', escape(a:loc, ' ') . ';', -1)
  for i in reverse(filter(files, 'filereadable(v:val)'))
    source `=i`
  endfor
endfunction
