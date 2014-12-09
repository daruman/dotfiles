THIS_PATH=${BASH_SOURCE:-$0}
echo "******************* [${THIS_PATH##*/}] start " `date +'%Y/%m/%d %H:%M:%S'` " *******************"


# tools
brew install macvim --with-lua --with-luajit --HEAD
brew install tmux
brew install ansible

