" <Leader>はバックスラッシュ

" [Vim の種類 (Vim family) - Qiita](http://qiita.com/b4b4r07/items/f7a4a0461e1fc6f436a4)
if !1 | finish | endif


" Variables
" ================================================================================

" OS判別
" --------------------------------------------------------------------------------
if has("mac")
    let OS_NAME='mac'
elseif has("unix")
    let OS_NAME='unix'
elseif has("win64")
    let OS_NAME='win64'
elseif has("win32unix")
    " minGW/Cygwin固有の設定
    let OS_NAME='win32unix'
elseif has("win32")
    let OS_NAME='win32'
endif





" NeoBundle setting
" ================================================================================
















" Basic Setup
" ================================================================================

" :Ev/:Rvでvimrcの編集と反映
" --------------------------------------------------------------------------------
if has("gui_macvim")
    command! Ev edit $MYVIMRC
    command! Rv source $MYVIMRC
else
    command! Ev edit ~/dotfiles/.vimrc
    command! Rv source ~/dotfiles/.vimrc
endif


"-------------------------------------------------------------------------------
" 基本設定 Basics
"-------------------------------------------------------------------------------
" 初期ディレクトリ
"   NERDTreeの初期表示ディレクトリにも影響する、mac/winで問題なく動く位置に
cd ~
" カーソル行を画面中央にする
set scrolloff=999
" バックアップファイルを作らない
set nobackup
set autoread " 他で書き換えられたら自動で読み直す
" スワップファイルを作成しない
set noswapfile
set hidden                       " 編集中でも他のファイルを開けるようにする
set backspace=indent,eol,start   " バックスペースでなんでも消せるように
set formatoptions=lmoq           " テキスト整形オプション，マルチバイト系を追加
set vb t_vb=                     " ビープをならさない
set whichwrap=b,s,h,l,<,>,[,]    " カーソルを行頭、行末で止まらないようにする
set showcmd                      " コマンドをステータス行に表示
set showmode                     " 現在のモードを表示
set modelines=0                  " モードラインは無効

" OSのクリップボードを使用する
set clipboard+=unnamed

"ヤンクした文字は、システムのクリップボードに入れる"
set clipboard=unnamed

"新しいウィンドウを下に開く
" set splitbelow

set helpfile=$VIMRUNTIME/doc/help.txt

" 80、120文字目で縦罫線を出す
if has("autocmd")
    autocmd FileType php     setlocal colorcolumn=80,120
endif

" 検索時、正規表現をmagicからvery magicに
" via@http://deris.hatenablog.jp/entry/2013/05/15/024932
nnoremap /  /\v
"-------------------------------------------------------------------------------
" ステータスライン StatusLine
"-------------------------------------------------------------------------------
set laststatus=2 " 常にステータスラインを表示

" カーソルが何行目の何列目に置かれているかを表示する。（有効:ruler/無効:noruler）
set ruler



autocmd BufRead,BufNewFile jquery.*.js set filetype=javascript syntax=jquery
autocmd BufNewFile,BufRead *.twig set filetype=twig syntax=jinja
autocmd BufNewFile,BufRead *.js set filetype=javascript
autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown

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



"-------------------------------------------------------------------------------
" 表示 Apperance
"-------------------------------------------------------------------------------
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

" 高速ターミナル接続を行う
set ttyfast


"-------------------------------------------------------------------------------
" 補完・履歴 Complete
"-------------------------------------------------------------------------------
set wildmenu               " コマンド補完を強化
set wildchar=<tab>         " コマンド補完を開始するキー
set wildmode=list:full     " リスト表示，最長マッチ
set history=1000           " コマンド・検索パターンの履歴数
set complete+=k            " 補完に辞書ファイル追加
set undodir=$HOME/.vim/undodir " .unの保存先変更


"-------------------------------------------------------------------------------
" 検索設定 Search
"-------------------------------------------------------------------------------
" 検索がファイル末尾まで進んだら、ファイル先頭から再び検索する。（有効:wrapscan/無効:nowrapscan）
set wrapscan
set ignorecase " 大文字小文字無視
set smartcase  " 検索文字列に大文字が含まれている場合は区別して検索する
set incsearch  " インクリメンタルサーチ
set hlsearch   " 検索文字をハイライト

"-------------------------------------------------------------------------------
" カラー関連 Colors
"-------------------------------------------------------------------------------
"  gvimrcで指定しないとmacで効かない
" :colorscheme h2u_dark

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

"-------------------------------------------------------------------------------
" 編集関連 Edit
"-------------------------------------------------------------------------------

" コンマの後に自動的にスペースを挿入
inoremap , ,<Space>

" 保存時に行末の空白を除去する("文字列の後にspaceが2個"時はmarkdown記法の改行なので削除しない)
" 1.連続していない行末のspace 1つを削除
" 2.行頭から行末までwhitespaceしかない場合は削除
" 3.行末のspace 3つ以上を削除
" 4.行末のtabを削除
autocmd BufWritePre * :%s/[^[:blank:]]\zs\s\{1\}$\|^\s\+$\|[ ]\{3,\}$\|\t\+$//ge

" Ctrl+Pで0レジスターペースト
vnoremap <silent> <C-p> "0p<CR>


"-------------------------------------------------------------------------------
" エンコーディング関連 Encoding
"-------------------------------------------------------------------------------
if has("win32")
  " via http://www.karakaram.com/20120726-vim-ref
  " set encoding より上に書くこと
  let &termencoding = &encoding
endif
set ffs=unix,dos,mac  " 改行文字
set encoding=utf-8    " デフォルトエンコーディング
set fileencodings=utf-8,cp932,euc-jp

" ワイルドカードで表示するときに優先度を低くする拡張子
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc


"-------------------------------------------------------------------------------
" その他 Misc
"-------------------------------------------------------------------------------

" ;でコマンド入力( ;を:とする)
noremap ; :

" exモード無効化
nnoremap Q <Nop>

" htmlファイル作成時、templateを読み込む
" autocmd BufNewFile *.html 0r ~/.vim/templates/skel.html
augroup SkeletonAu
    autocmd!
    autocmd BufNewFile *.html 0r $HOME/dotfiles/.vim/templates/skel.html
augroup END



if has('win32')
    " IMEがonの場合はカーソルを赤くする
    " http://www.e2esound.com/wp/2010/11/07/add_vimrc_settings/
    hi CursorIM  guifg=black  guibg=red  gui=NONE  ctermfg=black  ctermbg=white  cterm=reverse

    " バックスペースでindent無視 & 改行超えてバックスペース許可
    set guioptions=indent,eol

endif


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



























" Visual Settigns
" ================================================================================

" Mappings
" ================================================================================


" Functions
" ================================================================================


" fullscreen
" --------------------------------------------------------------------------------
" via@http://nanabit.net/blog/2007/11/01/vim-fullscreen/
if has("gui_macvim")
    " Lion以前のフルスクリーンに戻す場合は以下のコマンドを実行
    " defaUlts write org.vim.MacVim MMNativeFullScreen 0
    set fuoptions=maxvert,maxhorz
    au GUIEnter * set fullscreen
elseif has("win32")
    " windows用
    nnoremap <F11> :call ToggleFullScreen()<CR>
    function! ToggleFullScreen()
        if &guioptions =~# 'C'
            set guioptions-=C
            if exists('s:go_temp')
                if s:go_temp =~# 'm'
                    set guioptions+=m
                endif
                if s:go_temp =~# 'T'
                    set guioptions+=T
                endif
            endif
            simalt ~r
        else
            let s:go_temp = &guioptions
            set guioptions+=C
            set guioptions-=m
            set guioptions-=T
            simalt ~x
        endif
    endfunction
    set guioptions-=T
    set guioptions-=m
    set guioptions-=r
    set guioptions-=R
    set guioptions-=l
    set guioptions-=L
    set guioptions-=b
endif

























