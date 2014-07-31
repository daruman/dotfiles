#!/bin/bash

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

