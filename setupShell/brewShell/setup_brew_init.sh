echo "******************* [$0] start " `date +'%Y/%m/%d %H:%M:%S'` " *******************"

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
#brew untap homebrew/homebrew-php
#brew tap homebrew/homebrew-php

# font用
brew untap sanemat/font
brew tap sanemat/font

# Packages for brew-cask
brew unlink brew-cask # versionによってはunlinkしておく必要があるので
brew install brew-cask
brew link brew-cask

# tapのsymlinkで死んでいるものを修復
# =============================================================================
brew tap --repair
