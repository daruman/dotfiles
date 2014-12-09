THIS_PATH=${BASH_SOURCE:-$0}
echo "******************* [${THIS_PATH##*/}] start " `date +'%Y/%m/%d %H:%M:%S'` " *******************"

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
brew cask install dash
brew cask install coteditor
brew cask install filezilla
brew cask install kobito

# Browser
brew cask install google-chrome
brew cask install google-chrome-canary
brew cask install firefox-ja
brew cask install opera

# DevEnv
brew cask install virtualbox
brew cask install vagrant

# Utility
brew cask install caffeine
brew cask install karabiner
brew cask install appcleaner
brew cask install the-unarchiver
brew cask install alfred

# Google日本語入力はhomebrewではpkgを落とすが実行してないので、インストールする
# password聞かれるので入力が間に合えばインストールしてるかも
# 起動後は以下設定追加
# [環境設定] → [一般] → [キー設定] → [キー設定の選択 > 編集]にて以下キー追加
# 入力文字なし	Escape	キャンセル後 IME を無効化
brew cask install google-japanese-ime
sudo installer -pkg /opt/homebrew-cask/Caskroom/google-japanese-ime/latest/GoogleJapaneseInput.pkg -tgt /


# ~/Applications/にシンボリックリンク作成
# 通常のアプリケーションは/Applicationsにあり、ここでの~/Applicationsではない事に注意
# =============================================================================
brew linkapps


# alfredでhomebrew経由でインストールしたアプリも検索出来るようにする
# =============================================================================
brew cask alfred link
