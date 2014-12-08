" GUIに関する設定
"
" macはGVIMを使わないのでこの設定は不要
"================================================================================


" GVimでのカーソル形状については'guicursor'を設定


" Setting Color
"--------------------------------------------------------------------------------

:colorscheme molokai

" 行番号背景色
" hi LineNr guibg=#111111
" 検索ハイライト
" hi Search guifg=#ffffff  guibg=#fe57a1  gui=NONE
" カラムライン(横幅ガイドライン)の色
" hi ColorColumn guibg=#444444


" Font Size
"--------------------------------------------------------------------------------

if has('win32')
    " Windows用
    set guifont=Consolas:h9:cSHIFTJIS
endif


" Default GUI Size
" via@https://github.com/cosmo0920/vim-emacs_Setting/tree/master/vimrc
"--------------------------------------------------------------------------------

" コマンドラインの高さ(GUI使用時)
set cmdheight=2
if has('win32')
    "半透過
    gui
    set transparency=230
endif
