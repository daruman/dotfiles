" カラー関連
" ================================================================================

" terminalでのvimで256色を使えるようにする設定
if ! has('gui_running')
    set term=xterm
    set t_Co=256
    let &t_AF="\e[38;5;%dm"
    let &t_AB="\e[48;5;%dm"
    " let g:rehash256 = 1
endif

" ColorScheme指定(GUIで使用する際はgVimで指定する必要があるかも)
" colorschemeはNeoBundleで取得しているので、GUIの場合対策が必要、かも
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


if g:OS_NAME == 'win'
    " IMEがonの場合はカーソルを赤くする
    " http://www.e2esound.com/wp/2010/11/07/add_vimrc_settings/
    hi CursorIM  guifg=black  guibg=red  gui=NONE  ctermfg=black  ctermbg=white  cterm=reverse

    " バックスペースでindent無視 & 改行超えてバックスペース許可
    set guioptions=indent,eol
endif



" ステータスライン
" ================================================================================

" コマンドをステータス行に表示
set showcmd

" 現在のモードを表示
set showmode

" 常にステータスラインを表示
set laststatus=2

" カーソルが何行目の何列目に置かれているかを表示する。（有効:ruler/無効:noruler）
set ruler



" インデント
" ================================================================================

" タブ入力を複数の空白入力に置き換える (既存のタブには影響しない)
set expandtab

" Cプログラムファイルの自動インデントを始める
set cindent

" ウィンドウの幅より長い行は折り返して、次の行に続けて表示する
set wrap

" softtabstopはTabキー押し下げ時の挿入される空白の量，0の場合はtabstopと同じ，BSにも影響する
" tabstop:     画面上でタブ文字が占める幅
" shiftwidth:  自動インデントでずれる幅
" softtabstop: 連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set tabstop=4 shiftwidth=4 softtabstop=4

" 以下のファイルタイプではタブ幅は2スペにする
autocmd FileType html       setlocal sw=2 sts=2 ts=2 et
autocmd FileType twig       setlocal sw=2 sts=2 ts=2 et
autocmd FileType css        setlocal sw=2 sts=2 ts=2 et
autocmd FileType scss       setlocal sw=2 sts=2 ts=2 et
autocmd FileType sass       setlocal sw=2 sts=2 ts=2 et
autocmd FileType javascript setlocal sw=2 sts=2 ts=2 et



" ホワイトスペース
" ================================================================================

" 不可視文字表示
set list
set listchars=tab:>-,trail:-,nbsp:%,extends:>,precedes:<

" 印字不可能文字を16進数で表示
set display=uhex

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



" ハイライト
" ================================================================================

" カーソル行をハイライト
set cursorline

" 括弧の対応をハイライト
set showmatch

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



" Misc
" ================================================================================

" 大きい値を渡す事でカーソル行を画面中央にする
set scrolloff=999

" 80、120文字目で縦罫線を出す
if has("autocmd")
    autocmd FileType php     setlocal colorcolumn=80,120
endif

" 行番号表示
set number

" コマンド実行中は再描画しない
set lazyredraw

" DBの明示
let g:sql_type_default='mysql'
