THIS_PATH=${BASH_SOURCE:-$0}
echo "******************* [${THIS_PATH##*/}] start " `date +'%Y/%m/%d %H:%M:%S'` " *******************"


# シンボリックリンク
# =============================================================================
# .vim
ln -sfn "$DOTFILES_ENV/.vim" "$HOME/.vim"
echo "create symbolic link "$DOTFILES_ENV/.vim" > "$HOME/.vim""

# setup vim
# =============================================================================

# installing NeoBundles
echo "[vim] Updating NeoBundles"
vim -c NeoBundleClean -c q
vim -c NeoBundleUpdate -c q
