echo "******************* [$0] start " `date +'%Y/%m/%d %H:%M:%S'` " *****************"


# シンボリックリンク
# =============================================================================
# .vim
ln -sfn "$DOTFILES_ENV/.vim" "$HOME/.vim"
echo "create symbolic link "$DOTFILES_ENV/.vim" > "$HOME/.vim""

# setup vim
# =============================================================================

# installing NeoBundles
echo "[vim] Installing NeoBundles"
vim -c NeoBundleInstall -c q

# for ref.vim
if [ ! -d "$DOTFILES_VIM/php_manual/php-chunked-xhtml" ]; then
    mkdir -p "$DOTFILES_VIM/php_manual"
    curl -L http://jp.php.net/get/php_manual_ja.tar.gz/from/this/mirror |
    tar xz -C "$DOTFILES_VIM/php_manual"
fi

