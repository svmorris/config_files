#
## ~/.bashrc: executed by bash(1) for non-login shells.
## see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
## for examples
#
## If not running interactively, don't do anything
#case $- in
#    *i*) ;;
#      *) return;;
#esac
#
## don't put duplicate lines or lines starting with space in the history.
## See bash(1) for more options
#HISTCONTROL=ignoreboth
#
## append to the history file, don't overwrite it
#shopt -s histappend
#
## for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
#HISTSIZE=1000
#HISTFILESIZE=2000
#
## check the window size after each command and, if necessary,
## update the values of LINES and COLUMNS.
#shopt -s checkwinsize
#
## If set, the pattern "**" used in a pathname expansion context will
## match all files and zero or more directories and subdirectories.
##shopt -s globstar
#
## make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"
#
## set variable identifying the chroot you work in (used in the prompt below)
#if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
#    debian_chroot=$(cat /etc/debian_chroot)
#fi
#
#
#TERM=xterm-256color
## uncomment for a colored prompt, if the terminal has the capability; turned
## off by default to not distract the user: the focus in a terminal window
## should be on the output of commands, not on the prompt
##force_color_prompt=yes
#
#if [ -n "$force_color_prompt" ]; then
#    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
#	# We have color support; assume it's compliant with Ecma-48
#	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
#	# a case would tend to support setf rather than setaf.)
#	color_prompt=yes
#    else
#	color_prompt=
#    fi
#fi
#
##if [ "$color_prompt" = yes ]; then
#if [ true ]; then
#    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;35m\]\[\033[00m\]\[\033[01;31m\]\w\[\033[00m\] \[\033[01;36m\]>>> \[\033[00m\]'
#    #PS1='${debian_chroot:+($debian_chroot)}\[\033[01;35m\]\u@\h\[\033[00m\]:\[\033[01;35m\]\w\[\033[00m\]\$ '
#else
#    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
#fi
#unset color_prompt force_color_prompt
#
## If this is an xterm set the title to user@host:dir
#case "$TERM" in
#xterm*|rxvt*)
#    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
#    ;;
#*)
#    ;;
#esac
#
## enable color support of ls and also add handy aliases
#if [ -x /usr/bin/dircolors ]; then
#    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
#    alias ls='ls --color=auto'
#    #alias dir='dir --color=auto'
#    #alias vdir='vdir --color=auto'
#
#    alias fgrep='fgrep --color=auto'
#    alias egrep='egrep --color=auto'
#fi
#
## colored GCC warnings and errors
##export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
#
## some more ls aliases
##alias ll='ls -alF'
##alias la='ls -A'
##alias l='ls -CF'
#
## Add an "alert" alias for long running commands.  Use like so:
##   sleep 10; alert
#alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
#
## Alias definitions.
## You may want to put all your additions into a separate file like
## ~/.bash_aliases, instead of adding them here directly.
## See /usr/share/doc/bash-doc/examples in the bash-doc package.
#
#if [ -f ~/.bash_aliases ]; then
#    . ~/.bash_aliases
#fi
#
## enable programmable completion features (you don't need to enable
## this, if it's already enabled in /etc/bash.bashrc and /etc/profile
## sources /etc/bash.bashrc).
#if ! shopt -oq posix; then
#  if [ -f /usr/share/bash-completion/bash_completion ]; then
#    . /usr/share/bash-completion/bash_completion
#  elif [ -f /etc/bash_completion ]; then
#    . /etc/bash_completion
#  fi
#fi
#
#from here on its all me and i actuall know whats happening lol
export EDITOR=nvim

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
alias sps1="export PS1=' \[\033[01;36m\]>>> \[\033[00m\]'" # shortens the ps1 incase there isnt much space
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

#tmux
alias mtr='tmux new-session -s'
alias rts='tmux rename-session'
alias trw='tmux rename-window'

#other
alias asztal='cd ~/.config/asztal/; python3 asztal.py'

##############################
#quick webserver
alias webUpd='sudo docker run -v $PWD:/usr/local/apache2/htdocs -p 80:80 -p 443:443 httpd'
alias webUp='php -S 0.0.0.0:1337'

#############################
# pico ctf temp
alias sshpico='sshpass -p uRB7SZCtJu67kHS ssh tThErMoNuClEaRbOmB@2019shell1.picoctf.com'

############################
# extend laptop
alias extendLaptop='ssh -YC antone@10.42.0.1 x2x -west -to :1'

############################
# spanish
alias span='trans :es'

############################
#parrot docker image
alias labEnviroment='sudo docker run --rm -ti --network host -v $PWD:/work ctf_parrot'

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

###############################
# the fuck
eval "$(thefuck --alias)"

#====================================== computer specific stuff =================================
if [ `hostname -s` == "life" ]; then
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
if [ `hostname -s` == "laptop04" ]; then

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



#functions
c() { cd "$@" && ls; }
mcd() { mkdir "$@" && cd "$@"; }

#commands run on startup
ls

# starship terminal
eval "$(starship init bash)"
