
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

" バックアップファイルを作らない
set nobackup
set autoread " 他で書き換えられたら自動で読み直す

" スワップファイルを作成しない
set noswapfile

set hidden                       " 編集中でも他のファイルを開けるようにする
set backspace=indent,eol,start   " バックスペースでなんでも消せるように
set vb t_vb=                     " ビープをならさない
set whichwrap=b,s,h,l,<,>,[,]    " カーソルを行頭、行末で止まらないようにする
set formatoptions=lmoq           " テキスト整形オプション，マルチバイト系を追加
set modelines=0                  " モードラインは無効

" OSのクリップボードを使用する
set clipboard+=unnamed

"ヤンクした文字は、システムのクリップボードに入れる"
set clipboard=unnamed

set helpfile=$VIMRUNTIME/doc/help.txt


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
" 編集関連 Edit
"-------------------------------------------------------------------------------



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

