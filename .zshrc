autoload -U compinit
compinit

alias ls='ls -G'


case ${OSTYPE} in
    darwin*) # Mac OS X
      function macvim () {
          if [ -d /Applications/MacVim.app ]
          then
            [ ! -f $1 ] && touch $1
            open -a MacVim $1
          else
            vim $1
        fi
      }
    alias vim='macvim'
    ;;
esac
