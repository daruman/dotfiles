# Homebrewを最新にする
# =============================================================================
brew update || true


# Repositoryを追加する
# =============================================================================

# homebrew-cask用Repository
brew tap caskroom/homebrew-cask || true

# homebrew-cask用Repository(version指定可能、ベータ版や日本語版が欲しい際に)
brew tap caskroom/homebrew-versions || true

# バイナリインストール対応Repository
brew tap homebrew/binary || true

# バージョン指定で古いものに固定する場合に使用
brew tap homebrew/versions || true
# tap caskroom/versions || true

# php用(dupesは依存用)
brew tap homebrew/dupes || true
brew tap josegonzalez/homebrew-php || true

# Install Packages
# =============================================================================

# Packages for brew-cask
brew install brew-cask || true

# Shell
brew install zsh --disable-etcdir || true

## Languages/xxenv
brew install rbenv || true
brew install ruby-build || true
brew install rbenv-default-gems || true
brew install pyenv || true
brew install pyenv-virtualenv
brew install python3 || true
brew install plenv || true
brew install perl-build || true
# --HEADつけないと怒られる
brew install phpenv --HEAD || true
# phpenvのpluginとして下記コマンドでInstallしたほういい？
# $ git clone git@github.com:CHH/php-build.git ~/.phpenv/plugins/php-build
# install php-build || true
brew install josegonzalez/php/composer
brew install php53-xdebug || true
brew install php53-apc || true
brew install go --cross-compile-common || true
brew install lua
brew install luajit

# Middleware
brew install httpd || true
brew install phantomjs || true
brew install git || true
brew install mysql || true
brew install memcached || true
brew install sqlite || true
#install nginx ||  true

# DevEnv
#install packer      || true
#install dnsmasq     || true
#install ansible     || true

# Node.js
brew install nodebrew || true
# install node || true
# install nvm || true

# tools
brew install macvim --with-lua --with-luajit --HEAD || true
brew install tmux || true

# Commands\Utils
brew install curl || true
brew install tree || true
brew install openssl || true
brew install jq || true
brew install wget || true
brew install ctags || true
brew install ag || true
brew install tig || true
brew install autoconf || true
brew install automake || true
brew install grc || true
brew install source-highlight || true
brew install rmtrash || true

# Dependent
#   php
brew install jpeg || true
brew install re2c || true
brew install libmcrypt || true
brew install libpng || true

# 必要かよくわからない
brew install markdown || true
brew install nkf || true
brew install pcre || true
brew install gcc || true
brew install mcrypt || true
brew install imagemagick || true
brew install cmake || true
# install libtool || true

# 検討中
# install jenkins || true
# install hub || true


# Install .dmg
# =============================================================================

# JAVA
#   JDK8
brew cask install java
#   JDK7
# cask install java7

# Application
brew cask install iterm2
brew cask install sequel-pro
brew cask install sourcetree
brew cask install vlc
brew cask install cyberduck
brew cask install dash
brew cask install alfred
brew cask install coteditor
#   alfredでhomebrew経由でインストールしたアプリも検索出来るようにする
brew cask alfred link

# Browser
brew cask install google-chrome
brew cask install google-chrome-canary
brew cask install firefox-ja
brew cask install opera

# DevEnv
# cask install virtualbox
# cask install vagrant

# Utility
brew cask install google-japanese-ime
brew cask install caffeine
brew cask install karabiner
brew cask install appcleaner
brew cask install the-unarchiver

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
brew upgrade || true

# .dmg update
# =============================================================================
brew cask update

# ~/Applications/にシンボリックリンク作成
# =============================================================================
brew linkapps

# 不要ファイルの削除
# =============================================================================
brew cleanup
brew cask cleanup
