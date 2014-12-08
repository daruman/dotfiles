" declaration character code
set encoding=utf-8
scriptencoding utf-8

" 一旦ファイルタイプ関連を無効化する
filetype off
filetype plugin indent off

" [Vim の種類 (Vim family) - Qiita](http://qiita.com/b4b4r07/items/f7a4a0461e1fc6f436a4)
if !1 | finish | endif



" Variables
" ================================================================================

" OS判別
" --------------------------------------------------------------------------------
if has("mac")
    let g:OS_NAME='mac'
elseif has("unix")
    let g:OS_NAME='unix'
elseif has("win64")
    let g:OS_NAME='win'
elseif has("win32unix")
    " minGW/Cygwin固有の設定
    let g:OS_NAME='win'
elseif has("win32")
    let g:OS_NAME='win'
endif



" plugin (NeoBundle is required)
" ================================================================================

if has('vim_starting')
    if &compatible
        set nocompatible               " Be iMproved
    endif

    " 普通に`set runtimepath+=~/.vim/bundle/neobundle.vim/`すると
    " windowsでうまくシンボリックリンク元を探ってくれなかったので
    " expandし実体へのフルパス指定
    if &runtimepath !~ '/neobundle.vim'
        execute 'set runtimepath+=' . expand('~/Dotfiles/.vim/bundle/neobundle.vim/')
    endif
endif

" Required:
call neobundle#begin(expand('~/Dotfiles/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" vimrm.d/plugins/以下の.vimを全てload
set runtimepath+=~/Dotfiles/vimrc.d/
runtime! plugins/*.vim


call neobundle#end()

" Required:
filetype plugin indent on

" 未インストールpluginがないか確認
NeoBundleCheck



" Basic Setup
" ================================================================================
source ~/dotfiles/vimrc.d/basic.vim



" Visual Settigns
" ================================================================================
source ~/dotfiles/vimrc.d/visual.vim

" colorscheme ごとの カスタムhighlight 設定読み込み
if has('g:colors_name')
    let highlight = expand("~/Dotfiles/vimrc.d/highlight/" . g:colors_name . '.vim')
    if filereadable(g:highlight)
        execute 'source ' . g:highlight
    endif
endif



" Mappings
" ================================================================================
source ~/dotfiles/vimrc.d/mapping.vim



" Autocmd Rules
" ================================================================================
source ~/dotfiles/vimrc.d/autocmd.vim



" Functions
" ================================================================================
source ~/dotfiles/vimrc.d/function.vim



" platform毎設定
" ================================================================================
if has('vim_starting')
  for platform in ['win', 'mac', 'unix']
    if g:OS_NAME == platform
      execute 'source ~/Dotfiles/vimrc.d/platform/' . platform . '.vim'
      break
    endif
  endfor
endif
