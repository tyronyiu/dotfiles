#ZSHRC SETUP{{{
#-------------------------------------
ZSH=$HOME/.oh-my-zsh


#Browser-Sync setup{{{
#-------------------------------------
export LOCAL_IP=`ipconfig getifaddr en0`
#}}}

#}}}

#set to use the color range{{{
#-------------------------------------
export TERM="xterm-256color"
#}}}

#THEMING{{{
#-------------------------------------
ZSH_THEME="TY"
#}}}

# ALIASES{{{
#--------------------------------------
alias N="nnn"
alias v="vim"
alias V="vim"
alias serve="browser-sync start -s -f . --no-notify --host $LOCAL_IP --port 9000"
alias r='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'
#}}}

# DIRECTORY shortcuts{{{
#-------------------------------------
alias n="cd ~/Documents/la_bibliotheque/notes"
alias d="cd ~/Documents"
alias u="cd ~/repos/jekyll/Cognitiones/_posts"
alias dow="cd ~/Downloads"
alias h="cd ~/"
alias c="cd ~/code"
alias py="cd ~/code/python"
alias ba="cd ~/code/bash"
alias bi="cd ~/bin"
alias sn="cd ~/code/snippets"
#setopt auto_cd cdpath=$HOME
unset LSCOLORS
export CLICOLOR=1
export CLICOLOR_FORCE=1
# }}}

# EDIT shortcuts{{{
#-------------------------------------
alias evrc="vim ~/.vimrc"
alias errc="vim ~/.config/ranger/rc.conf"
alias ezrc="vim ~/.zshrc"
#}}}

# PLUGINS{{{
#-------------------------------------

plugins=(
  git
  zsh-autosuggestions
)
# }}}

# OTHER CONFIGS{{{
#-------------------------------------

chpwd() {
  ls 
}

source $ZSH/oh-my-zsh.sh
export ZSH="/Users/tyyiu/.oh-my-zsh"
export EDITOR=vim
PATH=~/bin:$PATH
PIP_REQUIRE_VIRTUALENV=false
#}}}

# NNN SETUP{{{
#-------------------------------------
export NNN_USE_EDITOR=1
NNN_BMS="r:~/Documents/;u:~/Uni/"

# }}}
