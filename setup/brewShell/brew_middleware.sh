THIS_PATH=${BASH_SOURCE:-$0}
echo "******************* [${THIS_PATH##*/}] start " `date +'%Y/%m/%d %H:%M:%S'` " *******************"


# php
# =============================================================================
# with-fpmする必要がある
# @link [brew install php56 error · Issue #1148 · Homebrew/homebrew-php](https://github.com/Homebrew/homebrew-php/issues/1148)
brew install php56 --with-fpm
brew install php56-xdebug

brew install composer
# create ~/.composer dir
COMPOSER_HOME="$HOME/.composer"
if [ ! -e $COMPOSER_HOME ]; then
    mkdir $COMPOSER_HOME
    echoLog "create $COMPOSER_HOME directory"
fi
chmod 757 $COMPOSER_HOME

# composer update & install
echoLog "composer update"
composer global update
echoLog "composer install"
composer global install



# node
# =============================================================================
brew install node



# この状態だと`mysql -u root -p`でlogin
#brew install mysql



# Middleware
# apacheのinstall前に以下コマンドを実行
# via@https://github.com/Homebrew/homebrew-apache
# sw_vers -productVersion | grep -E '^10\.[89]' > /dev/null && bash -c "[ -d /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain ] && sudo -u $(ls -ld /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain | awk '{print $3}') bash -c 'ln -vs XcodeDefault.xctoolchain /Applications/Xcode.app/Contents/Developer/Toolchains/OSX$(sw_vers -productVersion | cut -c-4).xctoolchain' || sudo bash -c 'mkdir -vp /Applications/Xcode.app/Contents/Developer/Toolchains/OSX$(sw_vers -productVersion | cut -c-4).xctoolchain/usr && ln -s /usr/bin /Applications/Xcode.app/Contents/Developer/Toolchains/OSX$(sw_vers -productVersion | cut -c-4).xctoolchain/usr/bin'"
# brew install httpd22
# brew install phantomjs
# brew install git

# brew install memcached
# brew install sqlite
# #install nginx





# setup launch
#     login時に起動
#     apache2.2想定
# =============================================================================

# mysql
# ln -sfv /usr/local/opt/mysql/*.plist ~/Library/LaunchAgents


# apache (apacheはrootとして最初に動作する必要があるためLaunchAgentsではなくLaunchDaemonsにplistを配置)
# @todo 外に切り出し、再調査+テスト
#if [ ! -d "/Library/LaunchDaemons" ]; then
#    mkdir -p "/Library/LaunchDaemons"
#fi
#ln -sfv /usr/local/opt/httpd22/*.plist ~/Library/LaunchDaemons
#sudo launchctl load -w /Library/LaunchDaemons/homebrew.mxcl.httpd22.plist



# via@https://github.com/jaswsinc/homebrew-apache2
#if [ ! -d "/Library/LaunchDaemons" ]; then
#    mkdir -p "/Library/LaunchDaemons"
#fi
#sudo cp /usr/local/opt/httpd22/*.plist /Library/LaunchDaemons
# sudo launchctl unload -w /System/Library/LaunchDaemons/org.apache.httpd.plist
#sudo launchctl load /Library/LaunchDaemons/homebrew.mxcl.httpd22.plist

