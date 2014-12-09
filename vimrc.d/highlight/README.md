色指定修正方法
================================================================================

修正を当てるカラースキームに対応するvimファイルを作成  
例  
mrkn256を使っている場合、mrkn256.vim

```
:highlight
```
で現在あたってるカラースキームの配色を調べる事が出来る

変更したい色指定行をコピー
```
ErrorMsg       xxx term=standout ctermfg=15 ctermbg=1 guifg=White guibg=Red
```

これを下記のように修正し、先ほど作成した.vimに追加

```
highlight ErrorMsg term=standout ctermfg=15 ctermbg=1 guifg=White guibg=Red
```
ctermfg: cui vimでのフォント色  
ctermbg: cui vimでの背景色  
guifg: gui vimでのフォント色  
guibg: gui vimでの背景色  

となっているので、それぞれ好きな色に変える。

guiのほうは16進法での記述が可能だが、cuiは色番号指定となる。
[dotfiles/.vim-256color.pl at master · pegrande/dotfiles](https://github.com/pegrande/dotfiles/blob/master/.vim-256color.pl)
[vim-256color.png (604×558)](http://cl.pocari.org/images/vim-256color.png)


