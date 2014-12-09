THIS_PATH=${BASH_SOURCE:-$0}
echo "******************* [${THIS_PATH##*/}] start " `date +'%Y/%m/%d %H:%M:%S'` " *******************"


# シンボリックリンク
# =============================================================================
# .vim/ (最初の引数には末尾スラッシュが必要なのに注意)
ln -sfn "$DOTFILES_VIM/" "$HOME/.vim"
echo "create symbolic link "$DOTFILES_VIM" > "$HOME/.vim""

# setup vim
# =============================================================================
# homebrewにてlua入りvimがインストール済み想定


# poworline fontインストール
if [ $OS_NAME == 'mac' ]; then
    echo 'copy Ricty font file at ~/Library/Fonts/'
    cp "$DOTFILES_DIR/vim-powerline-fonts/$OS_NAME/Ricty-Regular-Powerline.ttf" ~/Library/Fonts/
    cp "$DOTFILES_DIR/vim-powerline-fonts/$OS_NAME/Ricty-Bold-Powerline.ttf" ~/Library/Fonts/
fi


# installing NeoBundles
echo "[vim] Installing NeoBundles"
vim -c NeoBundleInstall -c q

# for ref.vim
if [ ! -d "$DOTFILES_VIM/php_manual/php-chunked-xhtml" ]; then
    mkdir -p "$DOTFILES_VIM/php_manual"
    curl -L http://jp.php.net/get/php_manual_ja.tar.gz/from/this/mirror |
    tar xz -C "$DOTFILES_VIM/php_manual"
fi

