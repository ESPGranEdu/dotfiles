#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#================Shell options===================================
shopt -s extglob        # Enable extended Bash regex and expansions
export PS1="\[$(tput bold)\][\[$(tput sgr0)\]\[\033[38;5;82m\]\u\[$(tput sgr0)\]\[\033[38;5;21m\]@\[$(tput sgr0)\]\[\033[38;5;44m\]\h\[$(tput sgr0)\] > \[$(tput sgr0)\]\[\033[38;5;33m\]\W\[$(tput sgr0)\]\[$(tput bold)\]]\[$(tput sgr0)\]\n\[$(tput sgr0)\]\[\033[38;5;11m\]\\$\[$(tput sgr0)\] \[$(tput sgr0)\]"

#================Environment Variables===========================
export EDITOR=vim
export TERM="xterm-256color"
{ [[ "$XDG_DISPLAY_TYPE" == "wayland" ]] &&
        export TERMINAL="terminator"; } ||
        export TERMINAL="alacritty"

#===============Extended behaviour===============================
# Use fzf for completion and reverse search
command -v fzf &>/dev/null && {
        source /usr/share/fzf/completion.bash
        source /usr/share/fzf/key-bindings.bash
}

#================Custom Paths=====================================
[[ -d $HOME/bin ]] && PATH=$PATH:$HOME/bin              # Personal scripts
[[ -d $HOME/.cargo ]] && PATH=$PATH:$HOME/.cargo/bin    # Rust binaries (cargo)


#================Functions=======================================
if grep -qi "arch" /etc/os-release; then
        clean_orphans() {
                orphans=($(pacman -Qqdt 2>/dev/null))

                (( ${#orphans[@]} == 0 )) && return 0
                sudo pacman -Rncs --noconfirm ${orphans[@]}
        }


        update_mirrors() {
                sudo reflector --verbose --score 100 --fastest 50 --sort rate --save /etc/pacman.d/mirrorlist
                sudo pacman -Syy
        }
fi

reload_config() {
        clear && source "$HOME/.bashrc"
}

#================Bash aliases====================================
[[ -f ~/.bash_aliases ]] && source ~/.bash_aliases
