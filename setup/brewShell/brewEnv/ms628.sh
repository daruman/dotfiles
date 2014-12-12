THIS_PATH=${BASH_SOURCE:-$0}
echo "******************* [${THIS_PATH##*/}] start " `date +'%Y/%m/%d %H:%M:%S'` " *******************"
# 社用MBP用

brew install lastpass-cli --with-pinentry --with-doc

# LastPassはhomebrewではpkgを落とすが実行してないので、インストールする
brew cask install lastpass

