[[ $- != *i* ]] && return # exit if non-interactive
[ -r /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion
[[ $DISPLAY ]] && shopt -s checkwinsize

export HISTCONTROL=ignoreboth:erasedups
export EDITOR=nano

# show dotfiles first with ls
export LC_COLLATE="C"

alias ls='ls --color=auto -lAh --group-directories-first'
alias l='ls -Gg --time-style=+'

PS1=' '
case $(tty) in /dev/tty[0-9]*)
	PS1='► ' ;;
esac

prompt_cmd()
{
	# color based on user
	local clr=3 # orange
	(( $EUID == 0 )) && clr=1 # redish
	# current wording directory
	local cwd=" $(dirs +0)" # to get ~ for home path
	tput setaf 0 # blackish
	tput setab $clr
	printf "$cwd"
	tput sgr0
	# padding boxes till end of line
	local pad=$(($COLUMNS-${#cwd}))
	tput setaf $clr
	eval printf "%.0s█" {1..$pad}
	tput sgr0
	printf "\n"
}
PROMPT_COMMAND=prompt_cmd
