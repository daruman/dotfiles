echo "******************* [$0] start " `date +'%Y/%m/%d %H:%M:%S'` " *******************"

# Commands\Utils
brew install tree
brew install openssl
brew install jq
brew install wget
brew install ctags
brew install ag
brew install tig
brew install autoconf
brew install automake
brew install grc
brew install source-highlight

# 依存
brew install jpeg
brew install re2c
brew install libmcrypt
brew install libpng

# 必要かよくわからない
brew install nkf
brew install pcre
brew install gcc
brew install mcrypt
brew install cmake

# このcurl/opensslはシンボリックリンクを作らない（defaultとのコンフリクトをさけるため
# ここで入れた新しいversionを使う場合、明示的に指定するか、参照パスを書き換える
brew install curl

# imagemagickの依存パッケージとしてinstallされるlibtoolは
# OSのdefaultのとのコンフリクトを避けるため、glibtoolとしてある
# こちらを使用する場合は`alias libtool=glibtool`とでもする
brew install imagemagick

