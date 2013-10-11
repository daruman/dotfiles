" <Leader>はバックスラッシュ

if has("mac")
" mac用の設定
elseif has("unix")
" unix固有の設定
elseif has("win64")
" 64bit_windows固有の設定
elseif has("win32unix")
" minGW/Cygwin固有の設定
elseif has("win32")
" 32bit_windows固有の設定
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
filetype off
if has('vim_starting')
    set nocompatible               " Be iMproved
    " set runtimepath+=~/.vim/bundle/neobundle.vim/
    if &runtimepath !~ '/neobundle.vim'
        execute 'set runtimepath+=' . expand('~/dotfiles/.vim/bundle/neobundle.vim')
    endif
endif

" call neobundle#rc(expand('~/.vim/bundle/'))
call neobundle#rc(expand('~/dotfiles/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" Recommended to install
" After install, turn shell ~/.vim/bundle/vimproc, (n,g)make -f your_machines_makefile
NeoBundle 'Shougo/vimproc', {
            \    'build' : {
            \        'windows' : 'make -f make_mingw32.mak',
            \        'cygwin'  : 'make -f make_cygwin.mak',
            \        'mac'     : 'make -f make_mac.mak',
            \        'unix'    : 'make -f make_unix.mak',
            \    },
            \}


" My Bundles here:
"   util
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'mattn/webapi-vim'
NeoBundle 'tyru/open-browser.vim'

"   plugins
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'kana/vim-smartinput'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'thinca/vim-ref'
NeoBundle 'itchyny/lightline.vim'
NeoBundleLazy 'hokaccha/vim-html5validator', {
    \ 'autoload' : { 'filetypes' : ['html'] }
    \}
NeoBundleLazy 'jiangmiao/simple-javascript-indenter', {
    \ 'autoload' : { 'filetypes' : ['js'] }
    \}
NeoBundleLazy 'jiangmiao/simple-javascript-indenter', {
    \ 'autoload' : { 'filetypes' : ['js'] }
    \}
NeoBundleLazy 'vim-scripts/taglist.vim', {
    \ 'autoload' : { 'commands' : 'TlistToggle' }
    \}
NeoBundleLazy 'scrooloose/syntastic', {
    \ 'autoload' : { 'commands' : 'SyntasticCheck' }
    \}
NeoBundleLazy 'glidenote/memolist.vim', {
    \ 'autoload' : { 'commands' : ['MemoNew', 'MemoGrep', 'MemoList'] }
    \}
NeoBundleLazy 'kannokanno/previm', {
    \ 'autoload' : { 'filetypes' : ['md', 'mdwn', 'mkd', 'mkdn', 'markdown'] }
    \}

"   twitter
"     Lazyすると :Unite tweetvim が効かなくなるので通常load
NeoBundle 'basyura/TweetVim'
NeoBundle 'basyura/twibill.vim'

"   syntax
NeoBundleLazy 'hail2u/vim-css-syntax', {
    \ 'autoload' : { 'filetypes' : ['css'] }
    \}
NeoBundleLazy 'hail2u/vim-css3-syntax', {
    \ 'autoload' : { 'filetypes' : ['css'] }
    \}
NeoBundleLazy 'hail2u/html5.vim', {
    \ 'autoload' : { 'filetypes' : ['html', 'htm'] }
    \}
NeoBundleLazy 'jelera/vim-javascript-syntax', {
    \ 'autoload' : { 'filetypes' : ['js'] }
    \}
NeoBundleLazy 'uggedal/jinja-vim', {
    \ 'autoload' : { 'filetypes' : ['twig', 'jinja'] }
    \}
NeoBundleLazy 'nono/jquery.vim', {
    \ 'autoload' : { 'filetypes' : ['js'] }
    \}



" 保留
" NeoBundle 'Shougo/vimfiler.vim'
" http://www.karakaram.com/vimfiler
" http://hrsh7th.hatenablog.com/entry/20120229/1330525683

" NeoBundle 'gregsexton/gitv'
" tpope/vim-fugitiveに依存してるぽい
" airblade/vim-gitgutterもいいぽい

NeoBundle 'tomasr/molokai'

" colorscheme
colorscheme molokai
set background=dark
if has('gui_running')
else
    " terminalでのvimで256色を使えるようにする設定
    set term=xterm
    set t_Co=256
    let &t_AF="\e[38;5;%dm"
    let &t_AB="\e[48;5;%dm"
" let g:rehash256 = 1
endif

" NeoBundle 'Shougo/neosnippet'




filetype plugin indent on " Required!

" Installation check.
NeoBundleCheck



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
set splitbelow

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


"------------------------------------------------
" Plugin 設定
"------------------------------------------------
" syntastic
" Shift+Mで構文チェック
nmap M :SyntasticCheck<CR>
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
if !exists('g:neocomplete#sources#dictionary#dictionaries')
    let g:neocomplete#sources#dictionary#dictionaries = {}
endif
let neco_dic = g:neocomplete#sources#dictionary#dictionaries
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

""" unite.vimでのgrep(agを使用)
" insert modeで開始
let g:unite_enable_start_insert = 1

" 大文字小文字を区別しない
let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case = 1

" grep検索
nnoremap <silent> ,gg  :<C-u>Unite grep: -buffer-name=search-buffer<CR>

" grep検索結果の再呼出（ctrl+n|ctrl+pで候補移動）
nnoremap <silent> ,gr  :<C-u>UniteResume search-buffer<CR>

" unite grep に ag(The Silver Searcher) を使う
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
endif



" neocomplcache
" code補完を表示する
" https://github.com/Shougo/neocomplcache
let g:neocomplete#enable_at_startup = 1


" taglist.vim
let Tlist_Show_One_File = 1
let Tlist_Use_Right_Window = 1
let Tlist_Exit_OnlyWindow = 1
" F8にtaglistのtoggleを割り当て
nnoremap <silent> <F8> :TlistToggle<CR>

" 以下コマンドでプロジェクト毎のtagsファイルを生成、使用するものをコピーし対象とする
" $ ctags -R --languages=php --langmap=PHP:.php.inc --php-types=c+f+d -f ~/.tags/{プロジェクト名}.tags `pwd` {プロジェクトファイルroot} `pwd`
" $ cd ~/.tags/
" $ cp -vi {プロジェクト名}.tags tags
" 後はCtrl+]等でtag jump、Ctrl+tで元の位置に戻る、:tsで他の候補表示
au BufNewFile,BufRead *.php set tags+=$HOME/.tags/tags

" open-browser.vim
" カーソル下のURLをブラウザで開く
nmap <Leader>o <Plug>(openbrowser-open)
vmap <Leader>o <Plug>(openbrowser-open)
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
" 起動時にブックマークを表示
let NERDTreeShowBookmarks=1
" vimでの位置を開いているrootと同期させる(:pwd)
let NERDTreeChDirMode = 2
" ブックマークファイルのパス(minttyの時のみブックマークファイルのパスを殺す)
"  通常のブックマークファイルのパスはC:\hogeだが、minttyでは/c/hogeなのでエラーになる
if has('win32unix')
    let NERDTreeBookmarksFile = expand('$HOME')
endif
" 最小表示
let NERDTreeMinimalUI = 1



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


" emmet-vim
let g:user_emmet_settings  = {
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
" autocmd BufNewFile,BufRead *.twig set filetype=jinja


" " neosnippet
" imap <C-k>     <Plug>(neosnippet_expand_or_jump)
" smap <C-k>     <Plug>(neosnippet_expand_or_jump)
" xmap <C-k>     <Plug>(neosnippet_expand_target)

" " SuperTab like snippets behavior.
" imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
" \ "\<Plug>(neosnippet_expand_or_jump)"
" \: pumvisible() ? "\<C-n>" : "\<TAB>"
" smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
" \ "\<Plug>(neosnippet_expand_or_jump)"
" \: "\<TAB>"

" " For snippet_complete marker.
" if has('conceal')
"   set conceallevel=2 concealcursor=i
" endif



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


" quickrun
" <Leader>rでテスト実行
" see also http://www.karakaram.com/quickrun-phpunit
"
" 実行時は:cd で設定ファイルがあるdirへ移動し
" :Quickrun -cmdopt '-c "phpunit.xml.dist"'とかするといいぽい
" 場合によっては:Quickrunだけで行けるぽい(<Leader>rでいける)
augroup QuickRunPHPUnit
    " *Test.phpをphpunitファイルとして定義する
    autocmd!
    autocmd BufWinEnter,BufNewFile *Test.php set filetype=php.phpunit
augroup END

" init
let g:quickrun_config = {}
let g:quickrun_config['*'] = {'runmode': "async:remote:vimproc", 'split':'below'}
" runnerにvimprocを設定、非同期処理させてvim自体の動作に影響を出さない
let g:quickrun_config['_'] = {'runner': 'vimproc', 'runner/vimproc/updatetime': 100}

let g:quickrun_config['php.phpunit'] = {}
let g:quickrun_config['php.phpunit']['outputter/buffer/split'] = '10'
let g:quickrun_config['php.phpunit']['command'] = 'phpunit'
let g:quickrun_config['php.phpunit']['exec'] = '%c %o %s'




" vim-ref
"   localsettingに移動
" let g:ref_phpmanual_path = $HOME . '/Documents/phpmanual'

" local設定(gitにpushしない)
"  font設定や他アプリケーション連携等
"   (browser別挙動は分岐かけるのでここには記載しない)
" via@http://auewe.hatenablog.com/entry/2013/05/14/003610
if filereadable(expand($HOME.'/.localsetting/vimrc_local'))
  source $HOME/.localsetting/vimrc_local
endif
