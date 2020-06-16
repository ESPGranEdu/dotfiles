#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Enviriment Variables
export EDITOR=nvim
export BROWSER=brave
if [[ -f /usr/bin/tmux ]]; then
        export TERM=tmux-256color
else
        export TERM=xterm-256color
fi

# Use fzf for completion and reverse search
command -v fzf &>/dev/null && {
        source /usr/share/fzf/completion.bash
        source /usr/share/fzf/key-bindings.bash
}

# Shell options
shopt -s extglob

# Adding ~/bin for personal scripts or binaries
[ -d $HOME/bin ] && PATH=$HOME/bin:$PATH

# Colored PS1
export PS1="\[$(tput bold)\][\[$(tput sgr0)\]\[\033[38;5;82m\]\u\[$(tput sgr0)\]\[\033[38;5;21m\]@\[$(tput sgr0)\]\[\033[38;5;44m\]\h\[$(tput sgr0)\] > \[$(tput sgr0)\]\[\033[38;5;33m\]\W\[$(tput sgr0)\]\[$(tput bold)\]]\[$(tput sgr0)\]\n\[$(tput sgr0)\]\[\033[38;5;11m\]\\$\[$(tput sgr0)\] \[$(tput sgr0)\]"

# Functions
clean_orphans(){
	orphans=$(pacman -Qdt 2>/dev/null | awk '{print $1}')
	num_orphans=$(echo $orphans | tr " " "\n" | wc -l)
	echo -e "\e[1;34m:: \e[0m\e[1mLimpiando huerfanos...\e[0m"

	if (( num_orphans > 0 ));then
        echo -e "\e[1;96mNo hay huerfanos en el sistema :)\e[0m"
        return 0
	else
		sudo pacman -Rncs --noconfirm $orphans
	fi
}

reload_config(){
	clear
	source ~/.bashrc
}

update_mirrors() {
	# Fetch mirrors
	sudo reflector --verbose --score 200 --fastest 100 --sort rate --save /etc/pacman.d/mirrorlist

	# Update Repos
	sudo pacman -Syy
}

# Source bash aliases
[ -f ~/.bash_aliases ] && . ~/.bash_aliases
