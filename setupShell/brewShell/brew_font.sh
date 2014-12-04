echo "******************* [$0] start " `date +'%Y/%m/%d %H:%M:%S'` " *******************"

# Ricty font
brew install ricty
cp -f /usr/local/Cellar/ricty/*/*/fonts/Ricty*.ttf ~/Library/Fonts/
fc-cache -vf
