THIS_PATH=${BASH_SOURCE:-$0}
echo "******************* [${THIS_PATH##*/}] start " `date +'%Y/%m/%d %H:%M:%S'` " *******************"


# 既にインストールされているFormulaを最新にする
# =============================================================================
brew upgrade



# .dmg update
# =============================================================================
# [Homebrew-caskのアプリをアップグレードする](http://rcmdnk.github.io/blog/2014/09/01/computer-mac-homebrew/)

# brew cask update
caskroom="/opt/homebrew-cask/Caskroom"
apps=($(brew cask list))
for a in ${apps[@]};do
  info=$(brew cask info $a)
  if echo "$info"| grep -q "Not installed";then
    brew cask install $a
  fi
  current=$(echo "$info"|grep "${caskroom}/${a}"|cut -d' ' -f1)
  for dir in $(ls ${caskroom}/${a});do
    testdir="${caskroom}/${a}/${dir}"
    if [ "$testdir" != "$current" ];then
      rm -rf "$testdir"
    fi
  done
done


# Homebrewprefixからデッドシンボリックリンクを削除する
# =============================================================================
brew prune



# 不要ファイルの削除
# =============================================================================
brew cleanup --force -s && rm -rf $(brew --cache)
brew cask cleanup

