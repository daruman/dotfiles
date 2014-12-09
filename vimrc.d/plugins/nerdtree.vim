NeoBundle 'scrooloose/nerdtree'

" 横幅
let g:NERDTreeWinSize = 40

" ntでトグル
nnoremap nt :NERDTreeToggle<CR>

augroup nerdtree
  autocmd!

  " 引数無し起動時、自動的にNERDTreeを開く
  autocmd vimenter * if !argc() | NERDTree | endif

  " 最後のバッファを閉じた際、NERDTreeだけ残さずに終了させる
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
augroup END

" 起動時にブックマークを表示
let g:NERDTreeShowBookmarks=1

" vimでの位置を開いているrootと同期させる(:pwd)
let g:NERDTreeChDirMode = 2

" ブックマークファイルのパス(winの時のみブックマークファイルのパスを殺す)
"  通常のブックマークファイルのパスはC:\hogeだが、minttyでは/c/hoge、cygwinでは/cygdrive/cなのでエラーになる
if has('win32unix')
    let g:NERDTreeBookmarksFile = expand('$HOME')
endif

" 最小表示
let g:NERDTreeMinimalUI = 1

