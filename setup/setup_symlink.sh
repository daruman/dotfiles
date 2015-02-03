THIS_PATH=${BASH_SOURCE:-$0}
echo "******************* [${THIS_PATH##*/}] start " `date +'%Y/%m/%d %H:%M:%S'` " *******************"


# .bashrc
# --------------------------------------------------------------------------------
ln -sfn "$DOTFILES_ENV/bashrc_$OS_NAME" "$HOME/.bashrc"
source ~/.bashrc
echoLog "create symbolic link and loaded $DOTFILES_ENV/bashrc_$OS_NAME > $HOME/.bashrc"

# composer
# --------------------------------------------------------------------------------
# brewでcomposerを入れる前に行う
# @see ~/Dotfiles/setup.sh

# create ~/.composer dir
COMPOSER_HOME="$HOME/.composer"
if [ ! -e $COMPOSER_HOME ]; then
    mkdir $COMPOSER_HOME
    echoLog "create $COMPOSER_HOME directory"
fi

# chmod 757 $COMPOSER_HOME
COMPOSER_GLOBAL_JSON="$DOTFILES_ENV/composer.json"
ln -sfn "$COMPOSER_GLOBAL_JSON" "$COMPOSER_HOME/composer.json"
echoLog "create symbolic link $COMPOSER_GLOBAL_JSON > $COMPOSER_HOME/composer.json"

# skel内のdotfilesへのシンボリックリンクを~に作成
# --------------------------------------------------------------------------------
# .bashrcはOS毎にSkeletonがあり、composer.jsonと同じく元ファイルはdotfileではないのでこのループで処理されない
backupdir="$HOME/dotfiles-backup-`date +%Y%m%dT%H%M%S`"
(
    find "$DOTFILES_ENV" -mindepth 1 -maxdepth 1 -name .\* ! -name .\*.swp
) |
while read src; do
    dest="$HOME/${src##*/}"

    # 既存の実ファイルが存在したらリネームしてとっておく(srcとdestの実体が同じ場合はスキップ)
    if [ -e "$dest" -a ! "$src" -ef "$dest" ]; then
        mkdir -p "$backupdir"
        mv "$dest" "$backupdir/${src##*/}"
    fi

    # シンボリックリンクを作る
    ln -sfn "$src" "$dest"
    echoLog "create symbolic link $src > $dest"
done
if [ -d "$backupdir" ]; then
    echoLog "既存のドットファイルは $backupdir に移動されました"
fi

