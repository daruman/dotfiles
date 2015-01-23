##################################################
# .profile
#
# bash、zsh共通設定
# 全環境共通設定を記述する
# 環境依存設定は.bashrcや.zshecに記述する
##################################################
echo '.profile loaded'

if [ ! -d /usr/local/sbin ]; then
    mkdir /usr/local/sbin
fi
export PATH="/usr/local/sbin:$PATH"

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# if running bash
if [ -n "$BASH_VERSION" ]; then

    # share setting bash

    # 重複するコマンドを保存しない、空白から始めたコマンドを無視
    export HISTCONTROL=ignoreboth

    # 以下のコマンドを履歴に保存しない
    export HISTIGNORE="fg*:bg*:history*:cd*:ls*:pwd*"

    # 履歴のサイズを増やす
    export HISTSIZE=10000

    # 履歴に日時を追加
    export HISTTIMEFORMAT='%Y-%m-%d %H:%M:%S '

    # ビープ音抑止
    export LESS=-q

    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi

    printf "********************************************************************************\n"
    printf "          Bash "
    printf $BASH_VERSION
    printf "\n\n"
    printf "          HOSTNAME: "
    printf $HOSTNAME
    printf "\n"
    printf "          OSTYPE:   "
    printf $OSTYPE
    printf "\n"
    printf "********************************************************************************\n"
fi
