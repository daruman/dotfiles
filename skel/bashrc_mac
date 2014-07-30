# PATH
# =============================================================================
# 手動追加したバイナリへのパス
export PATH=$PATH:/Users/daruman/bin

# コマンドエイリアス
# =============================================================================
alias ll='ls -FlhG'
alias la='ls -FlaG'
alias vi='vim'

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

