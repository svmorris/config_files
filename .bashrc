export EDITOR=nvim

# run function from autostart
function run {
  echo "this thign"
  if ! pgrep $1 ;
  then
    $@&
  fi
}

### ARCHIVE EXTRACTION
# usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   unzstd $1    ;;      
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

cd `cat ~/.config/PWD/current`

alias t='echo $PWD > ~/.config/PWD/current'
alias t1='echo $PWD > ~/.config/PWD/c1'
alias t2='echo $PWD > ~/.config/PWD/c2'
alias t3='echo $PWD > ~/.config/PWD/c3'
alias t4='echo $PWD > ~/.config/PWD/c4'
alias t5='echo $PWD > ~/.config/PWD/c5'
alias t6='echo $PWD > ~/.config/PWD/c6'
alias t7='echo $PWD > ~/.config/PWD/c7'
alias t8='echo $PWD > ~/.config/PWD/c8'
alias t9='echo $PWD > ~/.config/PWD/c9'

alias cd0='cd `cat ~/.config/PWD/current`'
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
alias v='vim'
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
alias bye='exit'
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
#shutdown
alias goodnight='cowsay "running backup";sleep 1;bacc;sleep 5;shutdown now'
#objdump
alias objdump='objdump -M intel'
#other
alias asztal='cd ~/.config/asztal/; python3 asztal.py'
alias pulserestart='pulseaudio --kill && pulseaudio --start'


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


#====================================== computer specific stuff =================================
if [ `cat /etc/hostname` == "life" ]; then
    # aliases
    alias picom='compton'
    alias termite='alacritty'
    #gcc
    alias gcc='gcc-10'
    alias g++='g++-10'
    #atp
    alias atp='apt'
    alias atp-get='apt-get'

    ##############################
    #make tmux work
    LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$HOME/hgsc/boost_libs/lib:/stornext/snfs1/next-gen/drio-scratch/tmux/local/lib
fi
if [ `cat /etc/hostname` == "laptop04" ]; then

    ##############################
    #loopback screen as webcam
    alias webcamloop='~/.config/v4l2loopback/run.sh'
fi
#====================================== !computer specific stuff =================================

##############################
## paths
#cargo
PATH=~/.cargo/bin:$PATH
#idk i broke everything
PATH=/home/antone/.local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:~/.bin:~/scripts:home/antone/.local/bin:~/.local/lib/python3.8/site-packages/:/snap/bin/:$PATH
#java
PATH=~/.java/jdk-11.0.9+11/bin:$PATH:
#ruby
PATH="$PATH:$(ruby -e 'puts Gem.user_dir')/bin"



################################
#cd functions
c() { cd "$@" && ls; }
mcd() { mkdir "$@" && cd "$@"; }

###############################
# the fuck
eval "$(thefuck --alias)"

###############################
#commands run on startup
ls

###############################
# starship terminal
eval "$(starship init bash)"
