echo "******************* [$0] start " `date +'%Y/%m/%d %H:%M:%S'` " *****************"

# 環境取得
# =============================================================================
CONFIG_ENV="./setup_env.conf"
if [ ! -e "$CONFIG_ENV" ]; then
    echo 'setup_env.confが無いです。setup_env.conf.distを元に作成し、設定を変更してください。'
    exit
fi
. $CONFIG_ENV
echo $ENV


# ベースディレクトリを取得
# =============================================================================
if [ ! -d "$DOTFILES_DIR" ]; then
    DOTFILES_DIR="$(cd $(dirname $0) && pwd)"
    # DOTFILES_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]:-$0}")/.." && pwd)"
fi
DOTFILES_ENV="$DOTFILES_DIR/skel"
DOTFILES_VIM="$DOTFILES_DIR/.vim"

# 移動
cd "$DOTFILES_DIR"



# submodule update
# =============================================================================
git submodule foreach 'git checkout master; git pull'
git submodule update --init


# setup homebrew
# =============================================================================
# sh setupShell/setup_brew.sh


# シンボリックリンク
# =============================================================================

# skel内のdotfilesへのシンボリックリンクを~に作成
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
    echo "create symbolic link "$src" > "$dest" "
done
if [ -d "$backupdir" ]; then
    echo -e "既存のドットファイルは \x1b[36m${backupdir}\x1b[0m に移動されました"
fi



# setup vim
# =============================================================================

# sh setupShell/setup_vim.sh


# setup launch
# =============================================================================

# sh setupShell/setup_launch.sh



