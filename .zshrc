#ZSHRC SETUP{{{
#-------------------------------------
export PATH=/bin:/usr/bin:/usr/local/bin:$PATH
#export PATH=$HOME/bin:$PATH

#Browser-Sync setup{{{
#-------------------------------------
export LOCAL_IP=`ipconfig getifaddr en0`
#}}}

#}}}

#set to use the color range{{{
#-------------------------------------
#export TERM="xterm-256color"
#}}}

#THEMING{{{
#-------------------------------------
ZSH_THEME="TY"
# Import colorscheme from 'wal' asynchronously
# &   # Run the process in the background.
# ( ) # Hide shell job control messages.
(cat ~/.cache/wal/sequences &)
#(wal -i ~/Downloads/ryan-tang-ANJHXftvvJ8-unsplash.jpg)
# Alternative (blocks terminal for 0-3ms)
#cat ~/.cache/wal/sequences

# To add support for TTYs this line can be optionally added.
#source ~/.cache/wal/colors-tty.sh
#}}}

# ALIASES{{{
#--------------------------------------
alias vim="/usr/local/bin/vim"
alias vi="/usr/local/bin/vim"
alias v="/usr/local/bin/vim"
alias mpv=" open -na /usr/local/Cellar/mpv/0.29.1_3/mpv.app"
alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'
set -o vi
chpwd() ls

#alias mpv="open -na /Applications/mpv.app"
#alias menu="cd ~/bin && . ./menu"
#alias serve="browser-sync start -s -f . --no-notify --host $LOCAL_IP --port 9000"
#alias r='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'
#}}}

# DIRECTORY shortcuts{{{
#-------------------------------------
unset LSCOLORS
export CLICOLOR=1
export CLICOLOR_FORCE=1

# }}}

# EDIT shortcuts{{{
#-------------------------------------
alias evrc="vim ~/.vimrc"
alias ezrc="vim ~/.zshrc"
#}}}

# PLUGINS{{{
#-------------------------------------

export FZF_BASE=/usr/local/bin/fzf

plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting  
  fzf
  fzf-marks
)
# }}}

# OTHER CONFIGS{{{
#-------------------------------------
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export ZSH=$HOME/.oh-my-zsh
source $ZSH/oh-my-zsh.sh
#export ZSH="/Users/tyyiu/.oh-my-zsh"
export PATH=$PATH:$HOME/bin
export EDITOR="vim"
export EDITOR=vim
export VISUAL=vim
#PATH=~/
PIP_REQUIRE_VIRTUALENV=false
#}}}

# Introduction Message {{{
#-------------------------------------
echo "
|| NAME: Ty Yiu
|| DATE: $(date)
||
|| $(fortune)
"
#}}}

# FZF Command-Line Fuzzy Finder {{{
#-------------------------------------
#export FZF_DEFAULT_OPTS="-l 20% --no-height --reverse"
export FZF_DEFAULT_COMMAND='find .'
export FZF_TMUX=1
#export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"
#export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"
export FZF_COMPLETION_TRIGGER=''
bindkey '^T' fzf-completion
bindkey '^I' $fzf_default_completion
fzf-history-widget-accept() {
  fzf-history-widget
  zle accept-line
}
zle     -N     fzf-history-widget-accept
bindkey '^X^R' fzf-history-widget-accept
#}}}
