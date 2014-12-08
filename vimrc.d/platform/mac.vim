" 挿入モードでカーソル形状を変更する
if &term =~ "screen"
    " screen使用時
    let &t_SI = "\eP\e]50;CursorShape=1\x7\e\\"
    let &t_EI = "\eP\e]50;CursorShape=0\x7\e\\"
elseif &term =~ "xterm-256color"
    " iterm用
    let &t_SI = "\e]50;CursorShape=1\x7"
    let &t_EI = "\e]50;CursorShape=0\x7"
endif

" [VimでESCの反応を素早くする，再び ~timeoutlenとttimeoutlen~ | PCと遊ぶ日々の記録](http://calcurio.com/wordpress/?p=1101)
set timeout timeoutlen=1000 ttimeoutlen=75

" fullscreen
" --------------------------------------------------------------------------------
" via@https://gist.github.com/acotie/279298#file-vimrc

if has("gui_running")
    set fuoptions=maxvert,maxhorz
    au GUIEnter * set fullscreen
endif

