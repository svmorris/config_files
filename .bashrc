export EDITOR=nvim

# run function from autostart
function run {
  if ! pgrep $1 ;
  then
    $@ > /dev/null 2> /dev/null &
  fi
}

### ARCHIVE EXTRACTION
# usage: ex <file>
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

## bash insulter
##https://github.com/hkbakke/bash-insulter
#if [ -f /etc/bash.command-not-found ]; then
#    . /etc/bash.command-not-found
#fi
#
# managing paths 

cd "`cat /current &> /dev/null || cat ~/.config/PWD/current`"

alias t='echo $PWD > ~/.config/PWD/current'
alias tt='echo $PWD > /current'
alias t1='echo $PWD > ~/.config/PWD/c1'
alias t2='echo $PWD > ~/.config/PWD/c2'
alias t3='echo $PWD > ~/.config/PWD/c3'
alias t4='echo $PWD > ~/.config/PWD/c4'
alias t5='echo $PWD > ~/.config/PWD/c5'
alias t6='echo $PWD > ~/.config/PWD/c6'
alias t7='echo $PWD > ~/.config/PWD/c7'
alias t8='echo $PWD > ~/.config/PWD/c8'
alias t9='echo $PWD > ~/.config/PWD/c9'

alias cd0='cd `cat "/current" || cd `cat "~/.config/PWD/current"'
alias cd1='cd `cat ~/.config/PWD/c1`'
alias cd2='cd `cat ~/.config/PWD/c2`'
alias cd3='cd `cat ~/.config/PWD/c3`'
alias cd4='cd `cat ~/.config/PWD/c4`'
alias cd5='cd `cat ~/.config/PWD/c5`'
alias cd6='cd `cat ~/.config/PWD/c6`'
alias cd7='cd `cat ~/.config/PWD/c7`'
alias cd8='cd `cat ~/.config/PWD/c8`'
alias cd9='cd `cat ~/.config/PWD/c9`'


#cd
alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../..'
alias .3='cd ../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../../'
alias cdc="cd ~/Videos/ctf/"
alias cda="cd ~/.config/awesome/"
alias icd="source cdir.sh"
#grep
alias grep='grep --colour=auto'
alias rgrep='grep -r --colour=auto'
#ls
alias ls='exa -l --color=always --group-directories-first'
alias ll='exa -laHhg --color=always --group-directories-first'
alias la='exa --color=always --group-directories-first'
alias l='ll'
#python
alias python='python3'
alias python2='python2'
#nc
alias nc='nc -v'
alias ncs='nc'
alias lnc='nc -l -p'
#vim
alias v='/bin/vim'
alias nv='nvim'
alias vim='nvim'
alias notes="nvim notes.md"
#files
alias cp='cp -i'
alias mv='mv -i'
alias rmrf="rm -rf"
alias rmr="rm -r"
#sl
alias L='sl'
alias LS='sl'
alias LL='sl'
alias lll='sl'
alias LA='sl'
#git
alias addall='git add .'
alias branch='git branch'
alias checkout='git checkout'
alias commit='git commit -m'
alias pull='git pull origin'
alias push='git push origin'
alias status='git status'
alias gitfiles='git diff --name-only'
alias gitlog="git log --all --graph --decorate"
#mc
alias mc='mc -b'
#terminal
alias sps1="export PS1=' \[\033[01;36m\]>>> \kdeconnect-cli -d bce44a5c5101c27b -k j[\033[00m\]'" # shortens the ps1 incase there isnt much space
# youtube-dl
alias yta-aac="youtube-dl --extract-audio --audio-format aac "
alias yta-best="youtube-dl --extract-audio --audio-format best "
alias yta-flac="youtube-dl --extract-audio --audio-format flac "
alias yta-m4a="youtube-dl --extract-audio --audio-format m4a "
alias yta-mp3="youtube-dl --extract-audio --audio-format mp3 "
alias yta-opus="youtube-dl --extract-audio --audio-format opus "
alias yta-vorbis="youtube-dl --extract-audio --audio-format vorbis "
alias yta-wav="youtube-dl --extract-audio --audio-format wav "
alias ytv-best="youtube-dl -f bestvideo+bestaudio "
alias ytv-mp="youtube-dl -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/mp4'"
#tmux
alias mtr='tmux new-session -s'
alias rts='tmux rename-session'
alias trw='tmux rename-window'
alias bye='tmux kill-session'
alias connect='tmux attach -t'
#shutdown
alias goodnight='backup;sleep 5;shutdown now'
#objdump
alias objdump='objdump -M intel'
#distro box
alias d='distrobox-enter'
alias dm='distrobox-manager'
alias dmc='distrobox-manager -c'
alias starship_install="curl -sS https://starship.rs/install.sh | sh"
#other
alias asztal='cd ~/.config/asztal/; python3 asztal.py'
alias pulserestart='pulseaudio --kill && pulseaudio --start'
#azure
alias az='podman run -it mcr.microsoft.com/azure-cli'

##############################
# Delete with rubbish bin
del() { mv "$@" /tmp; }

##############################
#quick webserver
alias webUpd='sudo docker run -v $PWD:/usr/local/apache2/htdocs -p 80:80 -p 443:443 httpd'
alias webUp='php -S 0.0.0.0:1337'

############################
# extend laptop
alias extendLaptop='ssh -YC antone@10.42.0.1 x2x -west -to :1'

############################
# spanish
alias span='trans :es'

############################
#parrot docker image
alias labEnviroment='sudo docker run --rm -ti --network host -v $PWD:/work ctf_parrot'

############################
# I re-created Silverblue
alias update="sudo timeshift --create --comments `date` --tags D && sudo pacman -Syu"

############################
# Make pdf of all md files
alias mdpdf='find . -name *.md -exec markdown-pdf {} \;'

############################
#kdeconnect to my phone
alias fphone="kdeconnect-cli -l --id-only | xargs -I{} sh -c 'kdeconnect-cli --pair -d {}'"
function tp {
    ID=$(kdeconnect-cli -a --id-only)
    echo $ID
    while [ 1 ]
    do
        read -n1 char
        if [ "$char" != "" ]
        then
            kdeconnect-cli -d $ID -k $char
        else
            kdeconnect-cli -d $ID -k ' '
        fi
    done
}


### tmux
function tm {
    if [ "$1" == "" ]
    then
        tmux
    fi
    tmux attach -t $1
    if [ "$?" != "0" ]
    then
        tmux new-session -s $1
    fi
}


#############################
#cyclic for developing exploits
c64="aaaaaaaaBaaaaaaaCaaaaaaaDaaaaaaaEaaaaaaaFaaaaaaaGaaaaaaaHaaaaaaaIaaaaaaaJaaaaaaaKaaaaaaaLaaaaaaaMaaaaaaaNaaaaaaaOaaaaaaaPaaaaaaaQaaaaaaaRaaaaaaaSaaaaaaaTaaaaaaaUaaaaaaaVaaaaaaaWaaaaaaaXaaaaaaaYaaaaaaaZaaaaaaBBaaaaaaBCaaaaaaBDaaaaaaBEaaaaaaBFaaaaaaBGaaaaaaBHaaaaaaBIaaaaaaBJaaaaaaBKaaaaaaBLaaaaaaBMaaaaaaBNaaaaaaBOaaaaaaBPaaaaaaBQaaaaaaBRaaaaaaBSaaaaaaBTaaaaaaBUaaaaaaBVaaaaaaBWaaaaaaBXaaaaaaBYaaaaaaBZaaaaaaCBaaaaaaCCaaaaaaCDaaaaaaCEaaaaaaCFaaaaaaCGaaaaaaCHaaaaaaCIaaaaaaCJaaaaaaCKaaaaaaCLaaaaaaCMaaa"
c32="aaaaBaaaCaaaDaaaEaaaFaaaGaaaHaaaIaaaJaaaKaaaLaaaMaaaNaaaOaaaPaaaQaaaRaaaSaaaTaaaUaaaVaaaWaaaXaaaYaaaZaaBBaaBCaaBDaaBEaaBFaaBGaaBHaaBIaaBJaaBKaaBLaaBMaaBNaaBOaaBPaaBQaaBRaaBSaaBTaaBUaaBVaaBWaaBXaaBYaaBZaaCBaaCCaaCDaaCEaaCFaaCGaaCHaaCIaaCJaaCKaaCLaaCMaaCNaaCOaaCPaaCQaaCRaaCSaaCTaaCUaaCVaaCWaaCXaaCYaaCZaaDBaaDCaaDDaaDEaaDFaaDGaaDHaaDIaaDJaaDKaaDLaaDMaaDNaaDOaaDPaaDQaaDRaaDSaaDTaaDUaaDVaaDWaaDXaaDYaaDZaaEBaaECaaEDaaEEaaEFaaEGaaEHaaEIaaEJaaEKaaELaaEMaaENaaEOaaEPaaEQaaERaaESaaETaaEUaaEVaaEWaaEXaaEYaaE"

###############################
#alacrity
set ttymouse=sgr


###############################
# important
alias important='vim /home/$USER/.IMPORTANT'

alias copy='xclip -selection clipboard'



##############################
## paths
#cargo
PATH=~/.cargo/bin:$PATH
#idk i broke everything
PATH=/home/antone/.local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:~/.bin:~/scripts:home/antone/.local/bin:~/.local/lib/python3.8/site-packages/:/snap/bin/:/var/lib/snapd/snap/bin:$PATH
#java
PATH=~/.java/jdk-11.0.9+11/bin:$PATH:
#ruby
PATH="$PATH:$(ruby -e 'puts Gem.user_dir')/bin"
# npm
PATH=/usr/local/lib/node_modules/:$PATH



################################
#cd functions
c() { cd "$@" && ls; }
mcd() { mkdir "$@" && cd "$@"; }

###############################
# the fuck
# eval "$(thefuck --alias)"

###############################
#commands run on startup
# tmux 2> /dev/null
env | grep TMUX > /dev/null
if [ "$?" != "0" ]
then
    tmux
else
    env | grep 'NO_DISTROBOX' > /dev/null
    if [ "$?" != "0" ]
    then
        # if we are not in distrobox already
        env | grep 'DISTROBOX' > /dev/null
        if [ "$?" != "0" ]
        then
            # distrobox-manager
	    echo ""
        fi
    fi
    ls
fi


#############################
# esp-idf
alias get_idf='. $HOME/Music/esp-idf/export.sh'




# tabtab source for electron-forge package
# uninstall by removing these lines or running `tabtab uninstall electron-forge`
[ -f /home/antone/Music/teahouse-electron.git/main/node_modules/tabtab/.completions/electron-forge.bash ] && . /home/antone/Music/teahouse-electron.git/main/node_modules/tabtab/.completions/electron-forge.bash

# # BEGIN_KITTY_SHELL_INTEGRATION
# if test -n "$KITTY_INSTALLATION_DIR" -a -e "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; then source "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; fi
# # END_KITTY_SHELL_INTEGRATION
# . "$HOME/.cargo/env"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

###############################
# starship terminal
eval "$(starship init bash)"
export PATH="$HOME/.npm-packages/bin:$PATH"

PATH="/home/antone/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/antone/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/antone/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/antone/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/antone/perl5"; export PERL_MM_OPT;



