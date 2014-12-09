" カラー関連
" ================================================================================

" ColorScheme指定(GUIで使用する際はgVimで指定する必要があるかも)
" colorschemeはNeoBundleで取得しているので、GUIの場合対策が必要、かも
" colorscheme yuroyoro256

colorscheme mrkn256

" colorscheme molokai
" let g:rehash256 = 1


" ターミナルタイプによるカラー設定
if &term =~ "xterm-256color" || "screen-256color"
    " 256色
    set t_Co=256
    set t_Sf=[3%dm
    set t_Sb=[4%dm
elseif &term =~ "xterm-debian" || &term =~ "xterm-xfree86"
    set t_Co=16
    set t_Sf=[3%dm
    set t_Sb=[4%dm
elseif &term =~ "xterm-color"
    set t_Co=8
    set t_Sf=[3%dm
    set t_Sb=[4%dm
endif



" ハイライト
" ================================================================================

" ハイライト on
syntax enable

" カーソル行をハイライト
set cursorline

" カーソル行をアンダーラインではなく背景色変化に変更
highlight CursorLine cterm=NONE

" 括弧の対応をハイライト
set showmatch

" 文字列中のSQLをハイライトする
let g:php_sql_query = 1

" baselibメソッドハイライト
let g:php_baselib = 1

" 文字列中のHTMLをハイライトする
let g:php_htmlInStrings = 1

" ショートタグ (<?を無効にする→ハイライト除外にする)
let g:php_noShortTags = 1

" }や]のエラーハイライト
let g:php_parent_error_close = 1

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
augroup tabspace
    autocmd!
    autocmd FileType html       setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
    autocmd FileType twig       setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
    autocmd FileType css        setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
    autocmd FileType scss       setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
    autocmd FileType sass       setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
    autocmd FileType javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
augroup END



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



" Misc
" ================================================================================

" 大きい値を渡す事でカーソル行を画面中央にする
set scrolloff=999

" 80、120文字目で縦罫線を出す
if has("autocmd")
    autocmd vimrc FileType php     setlocal colorcolumn=80,120
endif

" 行番号表示
set number

" コマンド実行中は再描画しない
set lazyredraw

" DBの明示
let g:sql_type_default='mysql'
