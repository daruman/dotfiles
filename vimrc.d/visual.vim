if has('gui_running')
else
    " terminalでのvimで256色を使えるようにする設定
    set term=xterm
    set t_Co=256
    let &t_AF="\e[38;5;%dm"
    let &t_AB="\e[48;5;%dm"
    " let g:rehash256 = 1
endif

" カーソル行を画面中央にする
set scrolloff=999


set showcmd                      " コマンドをステータス行に表示

set showmode                     " 現在のモードを表示

" 80、120文字目で縦罫線を出す
if has("autocmd")
    autocmd FileType php     setlocal colorcolumn=80,120
endif

"-------------------------------------------------------------------------------
" ステータスライン StatusLine
"-------------------------------------------------------------------------------
set laststatus=2 " 常にステータスラインを表示

" カーソルが何行目の何列目に置かれているかを表示する。（有効:ruler/無効:noruler）
set ruler

"-------------------------------------------------------------------------------
" インデント Indent
"-------------------------------------------------------------------------------
set autoindent   " 改行時に前の行のインデントを継続する
set smartindent  " 新しい行を開始したときに、新しい行のインデントを現在行と同じ量にする。
set expandtab    " タブ入力を複数の空白入力に置き換える (既存のタブには影響しない)
set cindent      " Cプログラムファイルの自動インデントを始める

" ウィンドウの幅より長い行は折り返して、次の行に続けて表示する
set wrap

" softtabstopはTabキー押し下げ時の挿入される空白の量，0の場合はtabstopと同じ，BSにも影響する
" tabstop:     画面上でタブ文字が占める幅
" shiftwidth:  自動インデントでずれる幅
" softtabstop: 連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set tabstop=4 shiftwidth=4 softtabstop=4

autocmd FileType html       setlocal sw=2 sts=2 ts=2 et
autocmd FileType twig       setlocal sw=2 sts=2 ts=2 et
autocmd FileType css        setlocal sw=2 sts=2 ts=2 et
autocmd FileType scss       setlocal sw=2 sts=2 ts=2 et
autocmd FileType sass       setlocal sw=2 sts=2 ts=2 et
autocmd FileType javascript setlocal sw=2 sts=2 ts=2 et



"if has("autocmd")
"  "ファイルタイプの検索を有効にする
"  filetype plugin on
"  "そのファイルタイプにあわせたインデントを利用する
"  filetype indent on
"  " これらのftではインデントを無効に
"  "autocmd FileType php filetype indent off
"
"  autocmd FileType apache     setlocal sw=4 sts=4 ts=4 et
"  autocmd FileType aspvbs     setlocal sw=4 sts=4 ts=4 et
"  autocmd FileType c          setlocal sw=4 sts=4 ts=4 et
"  autocmd FileType cpp        setlocal sw=4 sts=4 ts=4 et
"  autocmd FileType cs         setlocal sw=4 sts=4 ts=4 et
"  autocmd FileType css        setlocal sw=2 sts=2 ts=2 et
"  autocmd FileType diff       setlocal sw=4 sts=4 ts=4 et
"  autocmd FileType eruby      setlocal sw=4 sts=4 ts=4 et
"  autocmd FileType html       setlocal sw=2 sts=2 ts=2 et
"  autocmd FileType java       setlocal sw=4 sts=4 ts=4 et
"  autocmd FileType javascript setlocal sw=2 sts=2 ts=2 et
"  autocmd FileType perl       setlocal sw=4 sts=4 ts=4 et
"  autocmd FileType php        setlocal sw=4 sts=4 ts=4 et
"  autocmd FileType python     setlocal sw=4 sts=4 ts=4 et
"  autocmd FileType ruby       setlocal sw=2 sts=2 ts=2 et
"  autocmd FileType haml       setlocal sw=2 sts=2 ts=2 et
"  autocmd FileType sh         setlocal sw=4 sts=4 ts=4 et
"  autocmd FileType sql        setlocal sw=4 sts=4 ts=4 et
"  autocmd FileType vb         setlocal sw=4 sts=4 ts=4 et
"  autocmd FileType vim        setlocal sw=2 sts=2 ts=2 et
"  autocmd FileType wsh        setlocal sw=4 sts=4 ts=4 et
"  autocmd FileType xhtml      setlocal sw=4 sts=4 ts=4 et
"  autocmd FileType xml        setlocal sw=4 sts=4 ts=4 et
"  autocmd FileType yaml       setlocal sw=2 sts=2 ts=2 et
"  autocmd FileType zsh        setlocal sw=4 sts=4 ts=4 et
"  autocmd FileType scala      setlocal sw=2 sts=2 ts=2 et
"endif


set showmatch         " 括弧の対応をハイライト
set number            " 行番号表示
set list              " 不可視文字表示
set listchars=tab:>-,trail:-,nbsp:%,extends:>,precedes:<
set display=uhex      " 印字不可能文字を16進数で表示

" 全角スペースの表示　
function! ZenkakuSpace()
  highlight ZenkakuSpace cterm=underline ctermfg=darkgrey gui=underline guifg=darkgrey
endfunction

if has('syntax')
  augroup ZenkakuSpace
    autocmd!
    " ZenkakuSpaceをカラーファイルで設定するなら次の行は削除
    autocmd ColorScheme       * call ZenkakuSpace()
    " 全角スペースのハイライト指定
    autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
  augroup END
  call ZenkakuSpace()
endif


" カーソル行をハイライト
set cursorline

" コマンド実行中は再描画しない
set lazyredraw

"-------------------------------------------------------------------------------
" カラー関連 Colors
"-------------------------------------------------------------------------------
"  gvimrcで指定しないとmacで効かない
" :colorscheme h2u_dark
colorscheme wombat

" ハイライト on
syntax on
" 補完候補の色づけ for vim7
hi PmenuSel cterm=reverse ctermfg=33 ctermbg=222 gui=reverse guifg=#3399ff guibg=#f0e68c

" markdown内スクリプトのハイライト
" via@http://mattn.kaoriya.net/software/vim/20140523124903.htm
let g:markdown_fenced_languages = [
\  'php',
\  'css',
\  'javascript',
\  'js=javascript',
\  'json=javascript',
\  'sass',
\  'xml',
\]


if has('win32')
    " IMEがonの場合はカーソルを赤くする
    " http://www.e2esound.com/wp/2010/11/07/add_vimrc_settings/
    hi CursorIM  guifg=black  guibg=red  gui=NONE  ctermfg=black  ctermbg=white  cterm=reverse

    " バックスペースでindent無視 & 改行超えてバックスペース許可
    set guioptions=indent,eol

endif

" 文字列中のSQLをハイライトする
let php_sql_query = 1

" baselibメソッドハイライト
let php_baselib = 1

" 文字列中のHTMLをハイライトする
let php_htmlInStrings = 1

" ショートタグ (<?を無効にする→ハイライト除外にする)
let php_noShortTags = 1

" }や]のエラーハイライト
let php_parent_error_close = 1

" DBの明示
let g:sql_type_default='mysql'
