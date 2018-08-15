#-------------------------------------
#ZSHRC CONFIG
#-------------------------------------
ZSH=$HOME/.oh-my-zsh
#-------------------------------------
#Browser-Sync setup
#-------------------------------------

export LOCAL_IP=`ipconfig getifaddr en0`


#-------------------------------------
#Theming
#-------------------------------------

ZSH_THEME=powerlevel9k/powerlevel9k

#-------------------------------------
#set to use the color range
#-------------------------------------

export TERM="xterm-256color"

#-------------------------------------
#load the nerd fonts
#-------------------------------------

POWERLEVEL9K_MODE='nerdfont-complete'

#-------------------------------------
#add a new line after every prompt
#-------------------------------------

POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR=''
POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR=''

#-------------------------------------
#Background theming
#-------------------------------------

POWERLEVEL9K_CUSTOM_BATT_BACKGROUND='clear'
POWERLEVEL9K_RAM_BACKGROUND='clear'
POWERLEVEL9K_TIME_BACKGROUND='clear'
POWERLEVEL9K_DIR_HOME_BACKGROUND='clear'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='clear'
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='clear'

#-------------------------------------
#foreground theming
#-------------------------------------

POWERLEVEL9K_CUSTOM_BATT_FOREGROUND='magenta'
POWERLEVEL9K_RAM_FOREGROUND='blue'
POWERLEVEL9K_TIME_FOREGROUND='blue'
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND='magenta'
POWERLEVEL9K_DIR_HOME_FOREGROUND='magent'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND='magenta'
POWERLEVEL9K_DIR_HIGHLIGHT_FOREGROUND='magenta'_

#-------------------------------------
# Output time, date, and a symbol from the "Awesome Powerline Font" set
#-------------------------------------

POWERLEVEL9K_TIME_FORMAT="\UF43A %D{%H:%M:%S \UF133  %m.%d.%y}"

#-------------------------------------
#left&right items
#-------------------------------------

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(ram_joined vcs dir)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(time custom_batt)

#-------------------------------------
#writes effectively below powerline
#-------------------------------------

POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="%F{blue}\u256D\u2500%F{white}"
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%F{blue}\u2570\uf460%F{white} "

milliamps(){
amps="$(ioreg -rc AppleSmartBattery | grep CurrentCapacity | awk '{printf "%s mAh\n", $3}')"
echo -e "$amps $\uf240"
}

POWERLEVEL9K_CUSTOM_BATT="milliamps"
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"


#-------------------------------------
# ALIASES
#--------------------------------------

alias serve="browser-sync start -s -f . --no-notify --host $LOCAL_IP --port 9000"
alias lc="colorls -1 --sd --gs"
alias ranger='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'
alias r='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'

chpwd() {
  lc
}

#-------------------------------------
# DIRECTORY shortcuts
#-------------------------------------

alias n="cd ~/Documents/la_bibliotheque/notes"
alias d="cd ~/Documents"
alias dow="cd ~/Downloads"
alias h="cd ~/"
alias c="cd ~/code"
alias md="cd ~/Documents/la_bibliotheque/MD"
alias py="cd ~/code/python"
alias ba="cd ~/code/bash"
alias bn="cd /usr/local/bin"
alias sn="cd ~/code/snippets"
#-------------------------------------
# EDIT shortcuts
#-------------------------------------
alias evrc="vim ~/.vimrc"
alias errc="vim ~/.config/ranger/rc.conf"
alias ezrc="vim ~/.zshrc"
#-------------------------------------
# PLUGINS
#-------------------------------------

plugins=(
  git
)
#-------------------------------------
# OTHER CONFIGS
#-------------------------------------

source $ZSH/oh-my-zsh.sh
export ZSH="/Users/tyyiu/.oh-my-zsh"
EDITOR=vim
