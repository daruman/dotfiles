echo "******************* [$0] start " `date +'%Y/%m/%d %H:%M:%S'` " *******************"

sh $DOTFILES_DIR/setup_shell/brewShell/setup_brew_init.sh

sh $DOTFILES_DIR/setup_shell/brewShell/brew_shell.sh

sh $DOTFILES_DIR/setup_shell/brewShell/brew_command.sh

#sh $DOTFILES_DIR/setup_shell/brewShell/brew_middleware.sh

sh $DOTFILES_DIR/setup_shell/brewShell/brew_dmg.sh

sh $DOTFILES_DIR/setup_shell/brewShell/setup_brew_teardown.sh



# 検討中

## Languages/xxenv
# brew install rbenv
# brew install ruby-build
# brew install rbenv-default-gems
# brew install pyenv
# brew install pyenv-virtualenv
# brew install python3
# brew install plenv
# brew install perl-build
# --HEADつけないと怒られる
# php-buildはphpenvのpluginとしてinstallしたほうがよい
# brew install phpenv --HEAD
# # @todo pluginディレクトリがないなら作って、php-buildインストール
# if [ ! -d "$HOME/.phpenv/plugins/" ]; then
    # mkdir -p "$HOME/.phpenv/plugins/"
# fi
# brew install josegonzalez/php/composer
# brew install php53-xdebug
# brew install php53-apc
# brew install go --cross-compile-common

# DevEnv
#install packer
#install dnsmasq
#install ansible

# Node.js
# brew install nodebrew
# # install node
# # install nvm

# 検討中
# install jenkins
# install hub


# dmg
# cask install slate
# cask install dropbox
# cask install hipchat
# cask install xtrafinder
# cask install skitch
# cask install lastpass-universal
# cask install keepassx
