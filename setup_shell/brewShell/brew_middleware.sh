echo "******************* [$0] start " `date +'%Y/%m/%d %H:%M:%S'` " *******************"

# この状態だと`mysql -u root -p`でlogin
brew install mysql



# Middleware
# apacheのinstall前に以下コマンドを実行
# via@https://github.com/Homebrew/homebrew-apache
# sw_vers -productVersion | grep -E '^10\.[89]' > /dev/null && bash -c "[ -d /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain ] && sudo -u $(ls -ld /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain | awk '{print $3}') bash -c 'ln -vs XcodeDefault.xctoolchain /Applications/Xcode.app/Contents/Developer/Toolchains/OSX$(sw_vers -productVersion | cut -c-4).xctoolchain' || sudo bash -c 'mkdir -vp /Applications/Xcode.app/Contents/Developer/Toolchains/OSX$(sw_vers -productVersion | cut -c-4).xctoolchain/usr && ln -s /usr/bin /Applications/Xcode.app/Contents/Developer/Toolchains/OSX$(sw_vers -productVersion | cut -c-4).xctoolchain/usr/bin'"
brew install httpd22
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
ln -sfv /usr/local/opt/mysql/*.plist ~/Library/LaunchAgents


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

