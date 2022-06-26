#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#================Shell options===================================
shopt -s extglob        # Enable extended Bash regex and expansions
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"
eval "$(starship init bash)"

#================Environment Variables===========================
export EDITOR=vim
export TERM="xterm-256color"

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
        clean-orphans() {
                orphans=($(pacman -Qqdt 2>/dev/null))

                (( ${#orphans[@]} == 0 )) && return 0
                sudo pacman -Rncs --noconfirm ${orphans[@]}
        }


        update-mirrors() {
                sudo reflector --verbose --country Spain --country France\
                        --score 100 --fastest 50 \
                        --sort rate --save /etc/pacman.d/mirrorlist
                sudo pacman -Syy
        }
fi

reload-config() {
        clear && source "$HOME/.bashrc"
}

#================Bash aliases====================================
[[ -f ~/.bash_aliases ]] && source ~/.bash_aliases
