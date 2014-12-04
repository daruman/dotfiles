# PATH
# =============================================================================
# 手動追加したバイナリへのパス
export PATH=$PATH:$HOME/bin


# コマンドエイリアス
# =============================================================================
alias ll='ls -FlhG'
alias la='ls -FlaG'
alias vi='vim'
# [brew doctorのwarningを解決する](http://mrk1869.com/blog/brew_doctor/)
alias brew="env PATH=${PATH/\/Users\/${USER}\/\.pyenv\/shims:?/} brew"

# ctrl+rでhistory検索した際、行き過ぎた時戻るのにctrl+s出来るようにする
# <C-s>がsttyのスクリーンロックに割り当てられているため、これを未定義にし誤動作を防ぐ
# それと共にhistory検索の<C-s>を有効にし、検索結果を戻せる
# via@http://d.hatena.ne.jp/poch-7003/20090927/1254034581
stty stop undef
stty start undef


# コマンド履歴を共有
# =============================================================================
# via@http://iandeth.dyndns.org/mt/ian/archives/000651.html
function share_history {
    history -a
    history -c
    history -r
}
PROMPT_COMMAND='share_history'
shopt -u histappend
export HISTSIZE=9999

echo '.bashrc loaded'


# for git
# =============================================================================

# gitのPAGERを指定(これをしないとdiffやlogで色指定コードが文字として出力されてしまう)
export GIT_PAGER="less -R"


# Homebrew によるinstall前提設定
# =============================================================================

# Homebrewで入れたほうを優先するためPATH追加
export PATH="/usr/local/bin:$PATH"
if [ ! -d /usr/local/sbin ]; then
    mkdir /usr/local/sbin
fi
export PATH="/usr/local/sbin:$PATH"

# JAVA
export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)

# Generic Colouriser によるシンタックスハイライト
# if [ -f "$(brew --prefix)/etc/grc.bashrc" ]; then
    # source "$(brew --prefix)/etc/grc.bashrc"
# fi

# For MacVim
if [ -d /Applications/MacVim.app/Contents/MacOS ]; then
  export PATH=/Applications/MacVim.app/Contents/MacOS:$PATH
fi

