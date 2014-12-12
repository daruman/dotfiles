#!/bin/bash
THIS_PATH=${BASH_SOURCE:-$0}
echo "******************* [${THIS_PATH##*/}] start " `date +'%Y/%m/%d %H:%M:%S'` " *******************"


# 共通関数
# =============================================================================

# ログ出力
#
# @param $1 出力メッセージ
# @param $3 logモード(DEBUG|INFO|WARN|ERR)
function echoLog() {
    local date=`date +'%Y/%m/%d %H:%M:%S'`
    local file=${THIS_PATH##*/}

    if [ -n "$2" ]; then
        local mode=$2
    else
        local mode="INFO"
    fi

    echo "[$mode][$date::$file] $1"
}



# 環境取得
# =============================================================================
CONFIG_ENV="./setup_env.conf"
if [ ! -e "$CONFIG_ENV" ]; then
    echoLog 'setup_env.confが無いです。setup_env.conf.distを元に作成し、設定を変更してください。' 'ERROR'
    exit
fi
. $CONFIG_ENV
echoLog "CONFIG_ENV=$ENV"



# OS判別
# =============================================================================
if [ `uname` = "Darwin" ]; then
    OS_NAME='mac'
elif [ `uname` = "Linux" ]; then
    OS_NAME='linux'
else
    OS_NAME='win'
fi
echoLog "OS_NAME=$OS_NAME"



# ベースディレクトリを取得
# =============================================================================
if [ ! -d "$DOTFILES_DIR" ]; then
    DOTFILES_DIR="$(cd $(dirname ${BASH_SOURCE:-$0}) && pwd)"
fi
DOTFILES_ENV="$DOTFILES_DIR/skel"
DOTFILES_VIM="$DOTFILES_DIR/.vim"

# 移動
cd "$DOTFILES_DIR"



# submodule update
# =============================================================================
# gitmoduleにsubmodule登録
git submodule init

# 登録されたコミット番号のサブモジュールの実体ソースを持ってくる
git submodule update

# [更新作業]各サブモジュールディレクトリにてmasterブランチに切り替えpullする
git submodule foreach 'git checkout master; git pull'



# Symbolic Link
# =============================================================================
source $DOTFILES_DIR/setup/setup_symlink.sh



# setup homebrew
# =============================================================================
source $DOTFILES_DIR/setup/setup_brew.sh



# gem
# =============================================================================
source $DOTFILES_DIR/setup/setup_gem.sh



# npm
# =============================================================================
source $DOTFILES_DIR/setup/setup_npm.sh



# setup vim
# =============================================================================
source $DOTFILES_DIR/setup/setup_vim.sh



