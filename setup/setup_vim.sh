THIS_PATH=${BASH_SOURCE:-$0}
echo "******************* [${THIS_PATH##*/}] start " `date +'%Y/%m/%d %H:%M:%S'` " *******************"


# シンボリックリンク
# =============================================================================
# .vim/ (最初の引数には末尾スラッシュが必要なのに注意)
ln -sfn "$DOTFILES_VIM/" "$HOME/.vim"
echoLog "create symbolic link "$DOTFILES_VIM" > "$HOME/.vim""



# setup vim
# =============================================================================
# homebrewにてlua入りvimがインストール済み想定

# poworline fontインストール
if [ $OS_NAME == 'mac' ]; then
    echoLog 'copy Ricty font file at ~/Library/Fonts/'
    cp "$DOTFILES_DIR/vim-powerline-fonts/$OS_NAME/Ricty-Regular-Powerline.ttf" ~/Library/Fonts/
    cp "$DOTFILES_DIR/vim-powerline-fonts/$OS_NAME/Ricty-Bold-Powerline.ttf" ~/Library/Fonts/
fi

# installing NeoBundles
echoLog "Installing NeoBundles"
vim -c NeoBundleInstall -c q
