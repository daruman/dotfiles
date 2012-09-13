:colorscheme h2u_dark

"---------------------------------------------------
" color override
"---------------------------------------------------
" 行番号背景色
hi LineNr guibg=#111111
" カレント行ハイライト
set cursorline

"---------------------------------------------------
" Font Size
"---------------------------------------------------
if has('win32')
  " Windows用
  set guifont=Consolas:h9:cSHIFTJIS
endif
if has('mac')
  " mac用
  set guifont=Menlo:h12
endif




"---------------------------------------------------
" Default GUI Size
" via@https://github.com/cosmo0920/vim-emacs_Setting/tree/master/vimrc
"---------------------------------------------------
if has("gui_running")
"  set lines=45 columns=125
"    au GUIEnter * simalt ~x
endif
" コマンドラインの高さ(GUI使用時)
set cmdheight=2


"半透過
gui
set transparency=230
