# Homebrewを最新にする
# =============================================================================
update || true


# Repositoryを追加する
# =============================================================================

# homebrew-cask用Repository
tap caskroom/homebrew-cask || true

# バイナリインストール対応Repository
tap homebrew/binary || true

# バージョン指定で古いものに固定する場合に使用
tap homebrew/versions || true
# tap caskroom/versions || true

# php用(dupesは依存用)
tap homebrew/dupes || true
tap josegonzalez/homebrew-php || true


# Install Packages
# =============================================================================

# Packages for brew-cask
install brew-cask || true

# Shell
install zsh --disable-etcdir || true

## Languages/xxenv
install rbenv || true
install ruby-build || true
install rbenv-default-gems || true
install pyenv || true
install pyenv-virtualenv
install python3 || true
install plenv || true
install perl-build || true
# --HEADつけないと怒られる
install phpenv --HEAD || true
# phpenvのpluginとして下記コマンドでInstallしたほういい？
# $ git clone git@github.com:CHH/php-build.git ~/.phpenv/plugins/php-build
# install php-build || true
install josegonzalez/php/composer
install php53-xdebug || true
install php53-apc || true
install go --cross-compile-common || true
install lua
install luajit

# Middleware
install httpd || true
install phantomjs || true
install git || true
install mysql || true
install memcached || true
install sqlite || true
#install nginx ||  true

# DevEnv
#install packer      || true
#install dnsmasq     || true
#install ansible     || true

# Node.js
install nodebrew || true
# install node || true
# install nvm || true

# tools
install macvim --with-lua --with-luajit --HEAD || true
install tmux || true

# Commands\Utils
install curl || true
install tree || true
install openssl || true
install jq || true
install wget || true
install ctags || true
install ag || true
install tig || true
install autoconf || true
install automake || true
install grc || true
install source-highlight || true
install rmtrash || true

# Dependent
#   php
install jpeg || true
install re2c || true
install libmcrypt || true
install libpng || true

# 必要かよくわからない
install markdown || true
install nkf || true
install pcre || true
install gcc || true
install mcrypt || true
install imagemagick || true
install cmake || true
# install libtool || true

# 検討中
# install jenkins || true
# install hub || true


# Install .dmg
# =============================================================================

# JAVA
#   JDK8
cask install java
#   JDK7
# cask install java7

# Application
cask install iterm2
cask install sequel-pro
cask install sourcetree
cask install vlc
cask install Cyberduck
cask install dash
cask install alfred
#   alfredでhomebrew経由でインストールしたアプリも検索出来るようにする
cask alfred link

# Browser
cask install google-chrome
cask install Chromium
cask install firefox
cask install opera

# DevEnv
# cask install virtualbox
# cask install vagrant

# Utility
cask install google-japanese-ime
cask install caffeine
cask install karabiner
cask install appcleaner
cask install Unarchiver

# 検討中
# cask install slate
# cask install dropbox
# cask install hipchat
# cask install xtrafinder
# cask install skitch
# cask install lastpass-universal
# cask install keepassx

# 既にインストールされているFormulaを最新にする
# =============================================================================
upgrade || true

# .dmg update
# =============================================================================
cask update

# ~/Applications/にシンボリックリンク作成
# =============================================================================
linkapps

# 不要ファイルの削除
# =============================================================================
cleanup
cask cleanup
