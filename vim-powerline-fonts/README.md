vim-powerline font
================================================================================

環境にあったfontをインストールし、vimでそのfontを使用する事で
powerline互換のpluginで使用する事が出来るようにする。


mac
--------------------------------------------------------------------------------

```
$ cp mac/Ricty* ~/Library/Fonts/
```


作成方法
================================================================================

Rictyフォントとfontforgeをインストールしておく。


mac
--------------------------------------------------------------------------------

### Ricty font
```
brew tap sanemat/font
brew install ricty
cp -f /usr/local/Cellar/ricty/*/*/fonts/Ricty*.ttf ~/Library/Fonts/
fc-cache -vf
```

### fontforge
最初から入ってる気がする
```
brew install fontforge
```

### 作成
```
$ git clone https://github.com/Lokaltog/vim-powerline.git
$ cd ./vim-powerline/fontpatcher
$ fontforge -script ./fontpatcher ~/Library/Fonts/Ricty-Regular.ttf
$ fontforge -script ./fontpatcher ~/Library/Fonts/Ricty-Bold.ttf
# 格納
$ mv Ricty* ~/Dotfiles/vim-powerline-fonts/mac/
```

生成したフォントを所定のパスに配置したらLokaltog/vim-powerlineは削除しても良い

