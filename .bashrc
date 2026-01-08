export EDITOR=nvim
#
#
# run function from Auto Start
function run {
  if ! pgrep $1 ;
  then
    $@ > /dev/null 2> /dev/null &
  fi
}


# Make and enter directories.
mcd() { mkdir "$@" && cd "$@"; }


# ARCHIVE EXTRACTION
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1                   ;;
      *.tar.gz)    tar xzf $1                   ;;
      *.bz2)       bunzip2 $1                   ;;
      *.rar)       unrar x $1                   ;;
      *.gz)        gunzip $1                    ;;
      *.tar)       tar xf $1                    ;;
      *.tbz2)      tar xjf $1                   ;;
      *.tgz)       tar xzf $1                   ;;
      *.zip)       unzip $1                     ;;
      *.Z)         uncompress $1                ;;
      *.7z)        7z x $1                      ;;
      *.deb)       ar x $1                      ;;
      *.tar.xz)    tar xf $1                    ;;
      *.txz)       tar Jxvf $1                  ;;
      *.tar.zst)   unzstd $1                    ;;
      *.lzma)      xz --decompress --keep $1    ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}



# Making sure the terminal opens at the right place.
cd "`cat /current &> /dev/null || cat ~/.config/PWD/current`"

alias t='echo $PWD > ~/.config/PWD/current'
alias tt='echo $PWD > /current'
alias t1='echo $PWD > ~/.config/PWD/c1'
alias t2='echo $PWD > ~/.config/PWD/c2'
alias t3='echo $PWD > ~/.config/PWD/c3'
alias t4='echo $PWD > ~/.config/PWD/c4'

alias cd0='cd `cat "/current" || cd `cat "~/.config/PWD/current"'
alias cd1='cd `cat ~/.config/PWD/c1`'
alias cd2='cd `cat ~/.config/PWD/c2`'
alias cd3='cd `cat ~/.config/PWD/c3`'
alias cd4='cd `cat ~/.config/PWD/c4`'


# Aliases to make my life easier
## cd
alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../..'
alias .3='cd ../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../../'

## ls
alias ls='exa -l --color=always --group-directories-first'
alias ll='exa -laHhg --color=always --group-directories-first'
alias la='exa --color=always --group-directories-first'
alias l='ll'

## vim
alias v='/bin/vi'
alias vim='nvim'
alias notes="nvim notes.md"

## cp and mv
alias cp='cp -i'
alias mv='mv -i'

## git
alias gitlog="git log --all --graph --decorate"

## Midnight Commander.
alias mc='mc -b'

## Object Dump.
alias objdump='objdump -M intel'

## Toolbox
alias tb='toolbox enter'

## copy
alias copy='wl-copy'



# Exploit dev additions.
c64="aaaaaaaaBaaaaaaaCaaaaaaaDaaaaaaaEaaaaaaaFaaaaaaaGaaaaaaaHaaaaaaaIaaaaaaaJaaaaaaaKaaaaaaaLaaaaaaaMaaaaaaaNaaaaaaaOaaaaaaaPaaaaaaaQaaaaaaaRaaaaaaaSaaaaaaaTaaaaaaaUaaaaaaaVaaaaaaaWaaaaaaaXaaaaaaaYaaaaaaaZaaaaaaBBaaaaaaBCaaaaaaBDaaaaaaBEaaaaaaBFaaaaaaBGaaaaaaBHaaaaaaBIaaaaaaBJaaaaaaBKaaaaaaBLaaaaaaBMaaaaaaBNaaaaaaBOaaaaaaBPaaaaaaBQaaaaaaBRaaaaaaBSaaaaaaBTaaaaaaBUaaaaaaBVaaaaaaBWaaaaaaBXaaaaaaBYaaaaaaBZaaaaaaCBaaaaaaCCaaaaaaCDaaaaaaCEaaaaaaCFaaaaaaCGaaaaaaCHaaaaaaCIaaaaaaCJaaaaaaCKaaaaaaCLaaaaaaCMaaa"
c32="aaaaBaaaCaaaDaaaEaaaFaaaGaaaHaaaIaaaJaaaKaaaLaaaMaaaNaaaOaaaPaaaQaaaRaaaSaaaTaaaUaaaVaaaWaaaXaaaYaaaZaaBBaaBCaaBDaaBEaaBFaaBGaaBHaaBIaaBJaaBKaaBLaaBMaaBNaaBOaaBPaaBQaaBRaaBSaaBTaaBUaaBVaaBWaaBXaaBYaaBZaaCBaaCCaaCDaaCEaaCFaaCGaaCHaaCIaaCJaaCKaaCLaaCMaaCNaaCOaaCPaaCQaaCRaaCSaaCTaaCUaaCVaaCWaaCXaaCYaaCZaaDBaaDCaaDDaaDEaaDFaaDGaaDHaaDIaaDJaaDKaaDLaaDMaaDNaaDOaaDPaaDQaaDRaaDSaaDTaaDUaaDVaaDWaaDXaaDYaaDZaaEBaaECaaEDaaEEaaEFaaEGaaEHaaEIaaEJaaEKaaELaaEMaaENaaEOaaEPaaEQaaERaaESaaETaaEUaaEVaaEWaaEXaaEYaaE"



# Paths
## cargo
PATH=~/.cargo/bin:$PATH
## Idk I broke everything
PATH=/home/antone/.local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:~/.bin:~/scripts:home/antone/.local/bin:~/.local/lib/python3.8/site-packages/:/snap/bin/:/var/lib/snapd/snap/bin:$PATH
## java
PATH=~/.java/jdk-11.0.9+11/bin:$PATH:
## npm
PATH=/usr/local/lib/node_modules/:$PATH


# Tmux on startup.
if [[ -z "$TOOLBOX_PATH" && -z "$TMUX" ]]; then
    tmux
fi

# ESP development.
alias get_idf='. $HOME/Music/esp-idf/export.sh'

# Starship
eval "$(starship init bash)"

