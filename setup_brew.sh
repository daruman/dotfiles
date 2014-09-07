
echo "***** [$0] start " `date +'%Y/%m/%d %H:%M:%S'` " *****"

# Homebrewを最新にする
# =============================================================================
brew update


# Repositoryを追加する
# =============================================================================

# homebrew-cask用Repository
brew untap caskroom/homebrew-cask
brew tap caskroom/homebrew-cask

# homebrew-cask用Repository(version指定可能、ベータ版や日本語版が欲しい際に)
brew untap caskroom/homebrew-versions
brew tap caskroom/homebrew-versions

# バイナリインストール対応Repository
brew untap homebrew/binary
brew tap homebrew/binary

# バージョン指定で古いものに固定する場合に使用
brew untap homebrew/versions
brew tap homebrew/versions
# tap caskroom/versions

# apache用
brew untap homebrew/apache
brew tap homebrew/apache

# php用(dupesは依存用)
brew untap homebrew/dupes
brew tap homebrew/dupes
brew untap homebrew/homebrew-php
brew tap homebrew/homebrew-php

# font用
brew untap sanemat/font
brew tap sanemat/font

# Install Packages
# =============================================================================

# Packages for brew-cask
brew unlink brew-cask # versionによってはunlinkしておく必要があるので
brew install brew-cask
brew link brew-cask

# Shell
brew install zsh --disable-etcdir

# Commands\Utils
brew install tree
# このcurl/opensslはシンボリックリンクを作らない（defaultとのコンフリクトをさけるため
# ここで入れた新しいversionを使う場合、明示的に指定するか、参照パスを書き換える
brew install curl
brew install openssl
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
# --HEADつけないと怒られる
# php-buildはphpenvのpluginとしてinstallしたほうがよい
brew install phpenv --HEAD
# @todo pluginディレクトリがないなら作って、php-buildインストール
if [ ! -d "$HOME/.phpenv/plugins/" ]; then
    mkdir -p "$HOME/.phpenv/plugins/"
fi
# brew install josegonzalez/php/composer
# brew install php53-xdebug
# brew install php53-apc
# brew install go --cross-compile-common

# Middleware
# apacheのinstall前に以下コマンドを実行
# via@https://github.com/Homebrew/homebrew-apache
# sw_vers -productVersion | grep -E '^10\.[89]' > /dev/null && bash -c "[ -d /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain ] && sudo -u $(ls -ld /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain | awk '{print $3}') bash -c 'ln -vs XcodeDefault.xctoolchain /Applications/Xcode.app/Contents/Developer/Toolchains/OSX$(sw_vers -productVersion | cut -c-4).xctoolchain' || sudo bash -c 'mkdir -vp /Applications/Xcode.app/Contents/Developer/Toolchains/OSX$(sw_vers -productVersion | cut -c-4).xctoolchain/usr && ln -s /usr/bin /Applications/Xcode.app/Contents/Developer/Toolchains/OSX$(sw_vers -productVersion | cut -c-4).xctoolchain/usr/bin'"
brew install httpd22
# brew install phantomjs
# brew install git
brew install mysql
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


# Ricty font
brew install ricty
cp -f /usr/local/Cellar/ricty/*/*/fonts/Ricty*.ttf ~/Library/Fonts/
fc-cache -vf


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

# tapのsymlinkで死んでいるものを修復
# =============================================================================
brew tap --repair

# 不要ファイルの削除
# =============================================================================
brew cleanup
brew cask cleanup

# alfredでhomebrew経由でインストールしたアプリも検索出来るようにする
# =============================================================================
brew cask alfred link
