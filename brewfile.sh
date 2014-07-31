# Homebrewを最新にする
# =============================================================================
brew update


# Repositoryを追加する
# =============================================================================

# homebrew-cask用Repository
brew tap caskroom/homebrew-cask

# homebrew-cask用Repository(version指定可能、ベータ版や日本語版が欲しい際に)
brew tap caskroom/homebrew-versions

# バイナリインストール対応Repository
brew tap homebrew/binary

# バージョン指定で古いものに固定する場合に使用
brew tap homebrew/versions
# tap caskroom/versions

# php用(dupesは依存用)
brew tap homebrew/dupes
brew tap homebrew/homebrew-php

# Install Packages
# =============================================================================

# Packages for brew-cask
brew install brew-cask

# Shell
brew install zsh --disable-etcdir

# Commands\Utils
brew install tree
# このcurlはシンボリックリンクを作らない（defaultとのコンフリクトをさけるため
# ここで入れた新しいversionのcurlを使う場合、明示的に指定するか、参照パスを書き換える
brew install curl
brew install openssl
brew link openssl --force
brew install jq
brew install wget
brew install ctags
brew install ag
brew install tig
brew install autoconf
brew install automake
brew install grc
brew install source-highlight
brew install rmtrash

# tools
brew install macvim --with-lua --with-luajit --HEAD
brew install tmux

# Dependent
#   php
brew install jpeg
brew install re2c
brew install libmcrypt
brew install libpng

# 必要かよくわからない
brew install markdown
brew install nkf
brew install pcre
brew install gcc
brew install mcrypt
# imagemagickの依存パッケージとしてinstallされるlibtoolは
# OSのdefaultのとのコンフリクトを避けるため、glibtoolとしてある
# こちらを使用する場合は`alias libtool=glibtool`とでもする
brew install imagemagick
brew install cmake


## Languages/xxenv
# brew install rbenv
# brew install ruby-build
# brew install rbenv-default-gems
# brew install pyenv
# brew install pyenv-virtualenv
# brew install python3
# brew install plenv
# brew install perl-build
# # --HEADつけないと怒られる
# brew install phpenv --HEAD
# # phpenvのpluginとして下記コマンドでInstallしたほういい？
# # $ git clone git@github.com:CHH/php-build.git ~/.phpenv/plugins/php-build
# # install php-build
# brew install josegonzalez/php/composer
# brew install php53-xdebug
# brew install php53-apc
# brew install go --cross-compile-common

# Middleware
# brew install httpd
# brew install phantomjs
# brew install git
# brew install mysql
# brew install memcached
# brew install sqlite
# #install nginx

# DevEnv
#install packer
#install dnsmasq
#install ansible

# Node.js
# brew install nodebrew
# # install node
# # install nvm

# 検討中
# install jenkins
# install hub


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
brew upgrade

# .dmg update
# =============================================================================
brew cask update

# ~/Applications/にシンボリックリンク作成
# 通常のアプリケーションは/Applicationsにあり、ここでの~/Applicationsではない事に注意
# =============================================================================
brew linkapps

# 不要ファイルの削除
# =============================================================================
brew cleanup
brew cask cleanup

# alfredでhomebrew経由でインストールしたアプリも検索出来るようにする
# =============================================================================
brew cask alfred link
