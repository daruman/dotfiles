
" :Ev/:Rvでvimrcの編集と反映
" ================================================================================
if has("gui_macvim")
    command! Ev edit $MYVIMRC
    command! Rv source $MYVIMRC
else
    command! Ev edit ~/dotfiles/.vimrc
    command! Rv source ~/dotfiles/.vimrc
endif



" バックアップ
" ================================================================================

" バックアップファイルを作らない
set nobackup

" スワップファイルを作成しない
set noswapfile



" クリップボード
" ================================================================================

" OSのクリップボードを使用する
set clipboard+=unnamed



" 検索設定
" ================================================================================

" 検索がファイル末尾まで進んだら、ファイル先頭から再び検索する。（有効:wrapscan/無効:nowrapscan）
set wrapscan

" 大文字小文字無視
set ignorecase

" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase

" インクリメンタルサーチ
set incsearch

" 検索文字をハイライト
set hlsearch



" 補完・履歴
" ================================================================================

" コマンドラインモードで補完を強化
set wildmenu

" コマンド補完を開始するキー
set wildchar=<tab>

" リスト表示，最長マッチ
set wildmode=list:full

" コマンド・検索パターンの履歴数
set history=1000

" 補完に辞書ファイル追加
set complete+=k

" .unの保存先変更
set undodir=$HOME/.vim/undodir



" 文字コード関連
" ================================================================================

" 改行文字
set fileformats=unix,dos,mac  

" 前から試してマッチした文字コードを使用
set fileencodings=utf-8,cp932,euc-jp

" ワイルドカードで表示するときに優先度を低くする拡張子
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc



" Misc
" ================================================================================

" 他で書き換えられたら自動で読み直す
set autoread

" 表示中のバッファを保存していなくても、別のファイルを開く事が出来るようになる
set hidden

" バックスペースでなんでも消せるように
set backspace=indent,eol,start

" ビープをならさない
set visualbell t_vb=

" カーソルを行頭、行末で止まらないようにする
" `:set [no]compatible`を設定する場合、これ以降に書く必要があるが
" 上記設定は(必要としても)NeoBundleのインストレーション箇所で使用するため
" plugin処理以降に下記記載があれば問題なし
set whichwrap=b,s,h,l,<,>,[,]

" テキスト整形オプション，マルチバイト系を追加
set formatoptions=lmoq

" モードラインは無効
set modelines=0

" helpファイルパス指定
set helpfile=$VIMRUNTIME/doc/help.txt

" 高速ターミナル接続を行う
set ttyfast

" カレントディレクトリから親階層をtagsが見つかるまで探す
" @link [VimをIDEっぽく(主にC++/Java用)整える - rcmdnk’s blog](http://rcmdnk.github.io/blog/2014/07/25/computer-vim/)
if has("path_extra")
  set tags+=tags;
endif

" 長い文章を自動改行しない
set textwidth=0
