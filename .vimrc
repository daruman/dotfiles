" vimのバージョンが7以下は.vimrcを読み込まない
" MacOSデフォvim対応
" :if version < 701
" :finish
" :endif
" :colorscheme molokai

if has('gui_running')
endif

" Ev/Rvでvimrcの編集と反映
if has("gui_macvim")
    command! Ev edit $MYVIMRC
    command! Rv source $MYVIMRC
else
    command! Ev edit ~/dotfiles/.vimrc
    command! Rv source ~/dotfiles/.vimrc
endif

" fullscreen
" via@http://nanabit.net/blog/2007/11/01/vim-fullscreen/
"-----------------------------------------------------------
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


"------------------------------------------------
" NeoBundle
"------------------------------------------------
set nocompatible
filetype off

if has('vim_starting')
    if &runtimepath !~ '/neobundle.vim'
        execute 'set runtimepath+=' . expand('~/dotfiles/.vim/bundle/neobundle.vim')
    endif
endif
call neobundle#rc(expand('~/dotfiles/.vim/bundle/'))

autocmd BufNewFile,BufRead *.twig set filetype=twig
autocmd BufNewFile,BufRead *.js set filetype=javascript

" plugins
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/neocomplcache'
" neocompleteの後
NeoBundle 'Shougo/neosnippet'
NeoBundle 'scrooloose/nerdtree'
" NeoBundle 'Shougo/vimfiler.vim'
NeoBundle 'bling/vim-airline'
NeoBundle 'mattn/webapi-vim'
NeoBundle 'vim-scripts/taglist.vim'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'glidenote/memolist.vim'
NeoBundle 'kana/vim-smartinput'
NeoBundle 'mattn/zencoding-vim'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'nathanaelkane/vim-indent-guides'

NeoBundle 'basyura/twibill.vim'
NeoBundle 'basyura/TweetVim'
" NeoBundle 'gregsexton/gitv'
NeoBundle 'Shougo/vimproc'
NeoBundle 'hail2u/vim-css-syntax'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'hail2u/html5.vim'
NeoBundle 'hokaccha/vim-html5validator'
NeoBundle 'uggedal/jinja-vim'
NeoBundle 'jelera/vim-javascript-syntax'
NeoBundle 'nono/jquery.vim'
NeoBundle 'jiangmiao/simple-javascript-indenter'
NeoBundle 'tomasr/molokai'

filetype plugin indent on

if neobundle#exists_not_installed_bundles()
    echomsg 'Not installed bundles : ' .
                \ string(neobundle#get_not_installed_bundle_names())
    echomsg 'Please execute ":NeoBundleInstall" command.'
    "finish
endif


"-------------------------------------------------------------------------------
" 基本設定 Basics
"-------------------------------------------------------------------------------
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


set helpfile=$VIMRUNTIME/doc/help.txt

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

let g:airline_theme='simple'
let g:airline_powerline_fonts=1
let g:airline_mode_map = {
      \ 'n'  : 'N',
      \ 'i'  : 'I',
      \ 'R'  : 'R',
      \ 'v'  : 'V',
      \ 'V'  : 'VL',
      \ 'c'  : 'CMD',
      \ '' : 'VB',
      \ }



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
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
match ZenkakuSpace /　/

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
syntax enable
" 補完候補の色づけ for vim7
hi PmenuSel cterm=reverse ctermfg=33 ctermbg=222 gui=reverse guifg=#3399ff guibg=#f0e68c


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
set ffs=unix,dos,mac  " 改行文字
set encoding=utf-8    " デフォルトエンコーディング

" ワイルドカードで表示するときに優先度を低くする拡張子
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc


"-------------------------------------------------------------------------------
" その他 Misc
"-------------------------------------------------------------------------------

" ;でコマンド入力( ;と:を入れ替)
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


"------------------------------------------------
" Plugin 設定
"------------------------------------------------
" syntastic
" Shift+Mで構文チェック
nmap M :SyntasticCheck
" javascriptは保存時構文チェックしない、htmlはvim-html5validatorで行う
" cssはエラーでたまままのファイルを保存するとvimが落ちる場合があるので除外
" phpはphp5.2用コードをphp5.3以上の環境でチェックするとnamespace未使用エラーが出るので手動で行う
let g:syntastic_mode_map = { 'mode': 'active',
            \ 'active_filetypes': [],
            \ 'passive_filetypes': ['javascript', 'html', 'css', 'php'] }
" file open時にチェック
let g:syntastic_check_on_open=1
" error行表示部分にマウスオーバーでポップアップするのを非表示
let g:syntastic_enable_balloons=0
" errorを検知した際に自動でQuickfixを開く
let g:syntastic_auto_loc_list=1
" javascriptの構文チェックをclosure compilerに変更
let g:syntastic_javascript_checker = "closurecompiler"
let g:syntastic_javascript_closure_compiler_path = $HOME . "/bin/compiler.jar"
" csslintで連続class指定、装飾無し属性指定のwarn出力を抑止
let g:syntastic_csslint_options = "--ignore=adjoining-classes,unqualified-attributes,box-model"
" phpcsでチェックするコーディング規約をdefaultのPEARからPSRに変更(PSR2を指定する事でPSR0、1も対応)、-nで警告表示無し
let g:syntastic_php_phpcs_args = '--report=csv -n --standard=PSR2'

" tweetvim
" via@http://d.hatena.ne.jp/basyura/20111230/p1
" タイムライン選択用の Unite を起動する
nnoremap <silent> tt :Unite tweetvim<CR>
" 発言用バッファを表示する
nnoremap <silent> ss :TweetVimSay<CR>
" スクリーン名のキャッシュを利用して、neocomplcache で補完する
if !exists('g:neocomplcache_dictionary_filetype_lists')
    let g:neocomplcache_dictionary_filetype_lists = {}
endif
let neco_dic = g:neocomplcache_dictionary_filetype_lists
let neco_dic.tweetvim_say = $HOME . '/.tweetvim/screen_name'


""" unite.vim
" バッファ一覧
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
" レジスタ一覧
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
" 最近使用したファイル一覧
nnoremap <silent> ,um :<C-u>Unite file_mru<CR>
" 常用セット
nnoremap <silent> ,uu :<C-u>Unite buffer file_mru<CR>
" 全部乗せ
nnoremap <silent> ,ua :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>


" neocomplcache
" code補完を表示する
" https://github.com/Shougo/neocomplcache
let g:neocomplcache_enable_at_startup = 1


" taglist.vim
let Tlist_Show_One_File = 1
let Tlist_Use_Right_Window = 1
let Tlist_Exit_OnlyWindow = 1
" F8にtaglistのtoggleを割り当て
nnoremap <silent> <F8> :TlistToggle<CR>


" open-browser.vim
let g:netrw_nogx = 1 " disable netrw's gx mapping.
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)


" NERD-Tree
" 横幅
let NERDTreeWinSize = 40
" ntでトグル
noremap nt :NERDTreeToggle<CR>
" 引数無し起動時、自動的にNERDTreeを開く
autocmd vimenter * if !argc() | NERDTree | endif
" 最後のバッファを閉じた際、NERDTreeだけ残さずに終了させる
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif




" vim-html5validator
" open/close時にsyntax check
" 能動的にやるには:HTML5Validate
"
" loadする前提でパーツ単位でhtmlが記述されているファイルを開くと
" 大量にエラー出すので手動に
" augroup HtmlAutoCommands
" autocmd!
" autocmd FileType html :HTML5Validate
" autocmd FileType html autocmd BufWritePost <buffer> :silent make
" augroup END


" zendcoding-vim
let g:user_zen_settings = {
\  'lang' : 'ja',
\  'html' : {
\    'empty_element_suffix' : '>',
\  }
\}

" nerdcommenter
let g:NERDCreateDefaultMappings = 0
let NERDSpaceDelims = 1
nmap <Leader>/ <Plug>NERDCommenterToggle
vmap <Leader>/ <Plug>NERDCommenterToggle
vmap <Leader>/s <Plug>NERDCommenterSexy

" memolist
map <Leader>mn  :MemoNew<CR>
map <Leader>ml  :MemoList<CR>
map <Leader>mg  :MemoGrep<CR>

" jinja
autocmd BufNewFile,BufRead *.twig set filetype=jinja


" neosnippet
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" openbrowser
" enter押下でカーソル下urlをbrowserでopen
nmap <CR> <Plug>(openbrowser-open)

" taglist
" 以下コマンドでプロジェクト毎のtagsファイルを生成、使用するものをコピーし対象とする
" $ ctags -R --languages=php --langmap=PHP:.php.inc --php-types=c+f+d -f ~/.tags/{プロジェクト名}.tags `pwd` {プロジェクトファイルroot} `pwd`
" $ cd ~/.tags/
" $ cp -vi {プロジェクト名}.tags tags
" 後はCtrl+]等でtag jump、Ctrl+tで元の位置に戻る、:tsで他の候補表示
au BufNewFile,BufRead *.php set tags+=$HOME/.tags/tags

" vim-indent-guides
" vim立ち上げたときに、自動的にvim-indent-guidesをオンにする
let g:indent_guides_enable_on_vim_startup=1
" ガイドをスタートするインデントの量
let g:indent_guides_start_level=3
" 自動カラーを無効にする
let g:indent_guides_auto_colors=0
" 奇数インデントのカラー
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#363636 ctermbg=gray
" 偶数インデントのカラー
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#3c3c3c ctermbg=darkgray
" ハイライト色の変化の幅
let g:indent_guides_color_change_percent = 30
" ガイドの幅
let g:indent_guides_guide_size = 1



" local設定(gitにpushしない)
"  font設定や他アプリケーション連携等
"   (browser別挙動は分岐かけるのでここには記載しない)
" if filereadable(expand($HOME.'/.localsetting/vimrc_local'))
  " source $HOME/.localsetting/vimrc_local
" endif
