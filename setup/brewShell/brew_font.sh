THIS_PATH=${BASH_SOURCE:-$0}
echo "******************* [${THIS_PATH##*/}] start " `date +'%Y/%m/%d %H:%M:%S'` " *******************"


# depends
# brew cask install xquartz
brew install pkg-config

# Ricty font
brew install ricty
cp -f /usr/local/Cellar/ricty/*/*/fonts/Ricty*.ttf ~/Library/Fonts/
fc-cache -vf
