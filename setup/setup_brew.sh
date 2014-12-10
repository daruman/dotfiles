THIS_PATH=${BASH_SOURCE:-$0}
echo "******************* [${THIS_PATH##*/}] start " `date +'%Y/%m/%d %H:%M:%S'` " *******************"

source $DOTFILES_DIR/setup/brewShell/setup_brew_init.sh

# dmgを入れる事もあるため、リフレッシュをその後にさせるためbrew_dmg.shより先に実行
$ENV_SHELL="$DOTFILES_DIR/setup/brewShell/brewEnv/$CONFIG_ENV.sh"
if [ -f "$ENV_SHELL" ]; then
    source $ENV_SHELL
fi

source $DOTFILES_DIR/setup/brewShell/brew_shell.sh

source $DOTFILES_DIR/setup/brewShell/brew_command.sh

source $DOTFILES_DIR/setup/brewShell/brew_tool.sh

source $DOTFILES_DIR/setup/brewShell/brew_middleware.sh

source $DOTFILES_DIR/setup/brewShell/brew_dmg.sh

source $DOTFILES_DIR/setup/brewShell/setup_brew_teardown.sh

