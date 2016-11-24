#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

color_reset='\[\033[0m\]'
separator=''
readonly FG_BASE03="\[$(tput setaf 8)\]"
readonly FG_BASE02="\[$(tput setaf 0)\]"
readonly FG_BASE01="\[$(tput setaf 10)\]"
readonly FG_BASE00="\[$(tput setaf 11)\]"
readonly FG_BASE0="\[$(tput setaf 12)\]"
readonly FG_BASE1="\[$(tput setaf 14)\]"
readonly FG_BASE2="\[$(tput setaf 7)\]"
readonly FG_BASE3="\[$(tput setaf 15)\]"

readonly BG_BASE03="\[$(tput setab 8)\]"
readonly BG_BASE02="\[$(tput setab 0)\]"
readonly BG_BASE01="\[$(tput setab 10)\]"
readonly BG_BASE00="\[$(tput setab 11)\]"
readonly BG_BASE0="\[$(tput setab 12)\]"
readonly BG_BASE1="\[$(tput setab 14)\]"
readonly BG_BASE2="\[$(tput setab 7)\]"
readonly BG_BASE3="\[$(tput setab 15)\]"

readonly FG_YELLOW="\[$(tput setaf 3)\]"
readonly FG_ORANGE="\[$(tput setaf 9)\]"
readonly FG_RED="\[$(tput setaf 1)\]"
readonly FG_MAGENTA="\[$(tput setaf 5)\]"
readonly FG_VIOLET="\[$(tput setaf 13)\]"
readonly FG_BLUE="\[$(tput setaf 4)\]"
readonly FG_CYAN="\[$(tput setaf 6)\]"
readonly FG_GREEN="\[$(tput setaf 2)\]"

readonly BG_YELLOW="\[$(tput setab 3)\]"
readonly BG_ORANGE="\[$(tput setab 9)\]"
readonly BG_RED="\[$(tput setab 1)\]"
readonly BG_MAGENTA="\[$(tput setab 5)\]"
readonly BG_VIOLET="\[$(tput setab 13)\]"
readonly BG_BLUE="\[$(tput setab 4)\]"
readonly BG_CYAN="\[$(tput setab 6)\]"
readonly BG_GREEN="\[$(tput setab 2)\]"

readonly DIM="\[$(tput dim)\]"
readonly REVERSE="\[$(tput rev)\]"
readonly RESET="\[$(tput sgr0)\]"
readonly BOLD="\[$(tput bold)\]"

alias ls='ls --color'
alias :q='exit'

if [ "$TERM" = "linux" ]; then
	echo -en "\e]P01D1F21" #black
	echo -en "\e]P8C5C8C6" #darkgrey
	echo -en "\e]P1A54242" #darkred
	echo -en "\e]P9CC6666" #red
	echo -en "\e]P28C9440" #darkgreen
	echo -en "\e]PAB5BD68" #green
	echo -en "\e]P3DE935F" #brown
	echo -en "\e]PBF0C674" #yellow
	echo -en "\e]P45F819D" #darkblue
	echo -en "\e]PC81A2BE" #blue
	echo -en "\e]P585678F" #darkmagenta
	echo -en "\e]PDB294BB" #magenta
	echo -en "\e]P65E8D87" #darkcyan
	echo -en "\e]PE8ABEB7" #cyan
	echo -en "\e]P7707880" #lightgrey
	echo -en "\e]PFC5C8C6" #white
	clear #for background artifacting
	PS1='[\u@\h \W]\$ '
fi
if [ "$TERM" != "linux" ]; then
	PS1="$BG_BASE03$FG_BASE3 \u $BG_BASE02$FG_BASE03$separator$FG_BASE3 \h $BG_CYAN$FG_BASE02$separator$FG_BASE3 \w $RESET$FG_CYAN$separator$RESET "
fi
if [ -f /usr/bin/screenfetch ]; then screenfetch; fi
export EDITOR="vim"
export VISUAL="vim"
PATH=$PATH:$HOME/scripts
export PATH
alias ssh='TERM=xterm-256color ssh'
