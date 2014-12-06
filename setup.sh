#!/bin/bash

# OS判別
# =============================================================================
if [ `uname` = "Darwin" ]; then
    OS_NAME='mac'
elif [ `uname` = "Linux" ]; then
    OS_NAME='linux'
else
    OS_NAME='win'
fi



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



# submodule
# =============================================================================

# リモートに上がってるバージョンにupdateするので、最新になるわけではない(git addしたタイミングのバージョンの実体を取得している
# 最新にするには最新のバージョンをsubmoduleに登録し、そのバージョンを登録している事をpushする必要がある
# `cd {submodule dir}` `git checkout master` `git pull -f` 'cd ~/Dotfiles' `git add -A`
# もっとましな方法ないのかな
git submodule init
git submodule update



# シンボリックリンク
# =============================================================================

# .vim
ln -sfn "$DOTFILES_VIM" "$HOME/.vim"
echo "create symbolic link "$DOTFILES_VIM" > "$HOME/.vim""

# .bashrc
ln -sfn "$DOTFILES_ENV/bashrc_$OS_NAME" "$HOME/.bashrc"
echo "create symbolic link "$DOTFILES_ENV/bashrc_$OS_NAME" > "$HOME/.bashrc""

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
# installing NeoBundles
echo "[vim] Installing NeoBundles"
vim -c NeoBundleInstall -c q

# for ref.vim
if [[ ! -d "$DOTFILES_VIM/php_manual/php-chunked-xhtml" ]]; then
    mkdir -p "$DOTFILES_VIM/php_manual"
    curl -L http://jp.php.net/get/php_manual_ja.tar.gz/from/this/mirror |
    tar xz -C "$DOTFILES_VIM/php_manual"
fi

