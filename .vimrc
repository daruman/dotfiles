"---------------------------------------------------
" 文字コード関連
" via@https://github.com/cosmo0920/vim-emacs_Setting/tree/master/vimrc
"---------------------------------------------------
if &encoding !=# 'utf-8'
	set encoding=japan
	set fileencoding=japan
endif
if has('iconv')
	let s:enc_euc = 'euc-jp'
	let s:enc_jis = 'iso-2022-jp'
	" iconvがeucJP-msに対応しているかをチェック
	if iconv("\x87\x64\x87\x6a", 'cp932', 'eucjp-ms') ==# "\xad\xc5\xad\xcb"
		let s:enc_euc = 'eucjp-ms'
		let s:enc_jis = 'iso-2022-jp-3'
	" iconvがJISX0213に対応しているかをチェック
	elseif iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
		let s:enc_euc = 'euc-jisx0213'
		let s:enc_jis = 'iso-2022-jp-3'
	endif
	" fileencodingsを構築
	if &encoding ==# 'utf-8'
		let s:fileencodings_default = &fileencodings
		let &fileencodings = s:enc_jis .','. s:enc_euc .',cp932'
		let &fileencodings = &fileencodings .','. s:fileencodings_default
		unlet s:fileencodings_default
	else
		let &fileencodings = &fileencodings .','. s:enc_jis
		set fileencodings+=utf-8,ucs-2le,ucs-2
		if &encoding =~# '^\(euc-jp\|euc-jisx0213\|eucjp-ms\)$'
			set fileencodings+=cp932
			set fileencodings-=euc-jp
			set fileencodings-=euc-jisx0213
			set fileencodings-=eucjp-ms
			let &encoding = s:enc_euc
			let &fileencoding = s:enc_euc
		else
			let &fileencodings = &fileencodings .','. s:enc_euc
		endif
	endif
	" 定数を処分
	unlet s:enc_euc
	unlet s:enc_jis
endif
" 日本語を含まない場合は fileencoding に encoding を使うようにする
if has('autocmd')
	function! AU_ReCheck_FENC()
		if &fileencoding =~# 'iso-2022-jp' && search("[^\x01-\x7e]", 'n') == 0
			let &fileencoding=&encoding
		endif
	endfunction
"	autocmd BufReadPost * call AU_ReCheck_FENC()
	autocmd BufReadPost *
    	\ if line("'\"") > 1 && line("'\"") <= line("$") |
    	\   exe "normal! g`\"" |
    	\ endif
endif

"----------------------------------------------------
" インデント・タブ
" via@https://github.com/cosmo0920/vim-emacs_Setting/tree/master/vimrc
"----------------------------------------------------
" オートインデントを有効にする
" via@http://nanasi.jp/articles/howto/note/top10-viuser-need-to-know-about-vim.html#cindent
set cindent
" タブの空白の数
" via@http://ogawa.s18.xrea.com/fswiki/wiki.cgi?page=Vim%A4%CE%A5%E1%A5%E2
set tabstop=4
" tab押下時のカーソル移動幅
set softtabstop=4
" 自動インデント幅
set shiftwidth=4


"強調表示(色付け)のON/OFF設定
if has("syntax")
	syntax on
endif
filetype on
" ウィンドウの幅より長い行は折り返して、次の行に続けて表示する
set wrap
" 見えない文字の表示
" via@http://d.hatena.ne.jp/potappo2/20061107/1162862536
set list
set listchars=tab:>-,trail:-,nbsp:%,extends:>,precedes:<


"------------------------------------------------
"エディタの動作
" via@https://github.com/cosmo0920/vim-emacs_Setting/tree/master/vimrc
"------------------------------------------------
" 行番号を表示する
set number
" 括弧入力時の対応する括弧を表示
set showmatch
"新しい行を作ったときに高度な自動インデントを行う
set smartindent
"検索時に大文字を含んでいたら大/小を区別
set smartcase
" 検索がファイル末尾まで進んだら、ファイル先頭から再び検索する。（有効:wrapscan/無効:nowrapscan）
set wrapscan
" カーソルが何行目の何列目に置かれているかを表示する。（有効:ruler/無効:noruler）
set ruler
" IMEがonの場合はカーソルを赤くする
" http://www.e2esound.com/wp/2010/11/07/add_vimrc_settings/
hi CursorIM  guifg=black  guibg=red  gui=NONE  ctermfg=black  ctermbg=white  cterm=reverse
" バックアップファイルを作らない
set nobackup
" スワップファイルを作成しない
set noswapfile
" 検索時に大文字・小文字を区別しない
set ignorecase
" via@http://vimwiki.net/?'guioptions'
" クリップボード共有
set guioptions=a
" バックスペースでindent無視 & 改行超えてバックスペース許可
set guioptions=indent,eol
" カーソル行を画面中央にする
set scrolloff=999
" fullscreen
" via@http://nanabit.net/blog/2007/11/01/vim-fullscreen/
"-----------------------------------------------------------
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



"------------------------------------------------
" Plugins
"------------------------------------------------

" javascript-vim
" jsのインデント補正
" http://github.com/pangloss/vim-javascript
"autocmd FileType javascript
"\ :setl omnifunc=jscomplete#CompleteJS

" neocomplcache
" code保管を表示する
" https://github.com/Shougo/neocomplcache
" let g:neocomplcache_enable_at_startup = 1
" 重いので一時停止


" NERD-Tree
" 引数なし起動時はTree表示
" http://kokukuma.blogspot.jp/2011/12/vim-essential-plugin-nerdtree.html
let file_name = expand("%")
if has('vim_starting') &&  file_name == ""
    autocmd VimEnter * NERDTree ./
endif
" 横幅
let NERDTreeWinSize = 40





