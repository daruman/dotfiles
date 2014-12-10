SETUP
================================================================================

```bash
$ git clone git@github.com/daruman/dotfiles.git ~/Dotfiles
$ cd ~/Dotfiles/
$ chmod +x setup.sh
$ setup.sh
```

設定ファイルの修正
--------------------------------------------------------------------------------

### php
`/usr/local/etc/php/5.6/php.ini`が下記のようになるよう変更・追加する  
(phpのバージョンは読み替え)

```php.ini
date.timezone = Asia/Tokyo
default_charset = "UTF-8"
mbstring.language = Japanese
mbstring.internal_encoding = UTF-8
mbstring.detect_order = UTF-8,SJIS,EUC-JP,JIS,ASCII
```



## Node.js
nodebrewにて管理するので、node.jsはnodebrew経由でInstallする。




