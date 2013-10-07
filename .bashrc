# export PATH=$PATH:/Users/daruman/bin
# export PATH=$PATH:/usr/local/share/npm/bin

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

# コマンドエイリアス
alias ls='ls -CFG'
alias ll='ls -lF'
alias la='ls -CalF'
alias l='ls -AlFh'
alias vi='vim'
# alias vi='C:/Users/E0179/tools/vim/vim.exe'

# カラーリング
# source ~/mintty_color_theme/terminal-color-theme/color-theme-molokai/molokai.sh
export TERM=xterm-256color

# 言語設定
# export LANG=japanese
# export TYPE=utf-8
export LANG='ja_JP.UTF-8' # 以下 3 つ文字コード
export LC_ALL='ja_JP.UTF-8'
export LC_MESSAGES='ja_JP.UTF-8'

# プロンプトにgit情報
function parse_git_branch {
   git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
export PS1="\t [\u@\h \W] \$(parse_git_branch)$ "

# ウィンドウ名編集
# via http://www.glamenv-septzen.net/view/1107
function settitle ()
{
  if $OSTYPE != darwin12 ; then
      t="mintty [$@]@`hostname`"
  # "\e]2;"までがウインドウタイトル変更開始の制御コード
  # "\007"が変更終了・・・らしい、です。
      echo -ne "\e]2;$t\007"
  fi
}
function cd()
{
   builtin cd $@ && settitle $@
}
function pwd()
{
  settitle $@
  builtin pwd $@
}


# ctrl+rでhistory検索した際、行き過ぎた時戻るのにctrl+s出来るようにする
# via@http://d.hatena.ne.jp/poch-7003/20090927/1254034581
# スクリーンロックを未定義にする
#   winのgit bashで固まるので何か方法考え中
# stty stop undef
# stty start undef

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
printf "          (このメッセージは~/.bashrcから出力されてます)\n"
printf "********************************************************************************\n"
