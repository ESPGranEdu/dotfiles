#
# ~/.bash_aliases
#

#================ArchLinux configurations====================================
if grep -qi "arch" /etc/os-release; then
    # Check the AUR wrapper installed in the system
    if command -v pakku &>/dev/null; then
        export aur_wrapper="pakku"
    elif command -v trizen &>/dev/null; then
        export aur_wrapper="trizen"
    elif command -v paru &>/dev/null; then
        export aur_wrapper="paru"
    fi

    if [[ "$aur_wrapper" ]]; then
        alias $aur_wrapper="$aur_wrapper --noconfirm"
        alias update="$aur_wrapper -Syu && clean_orphans"
        alias pf='update && clean_orphans && shutdown now'
    fi
fi

#================Aliases=====================================================
alias rsync='rsync -a --progress'
alias ls='ls --color=auto'
command -v bat &>/dev/null && alias cat='bat'
alias l='ls'
alias ll='ls -l --color=auto'
alias grep='grep --color=auto'
alias egrep='grep -E'
alias rgrep='grep -r'
alias ip='ip -c'
alias bconf='vim ~/.bashrc'
alias vconf='vim ~/.vimrc'
alias update-grub='sudo grub-mkconfig -o /boot/grub/grub.cfg'
alias gs='git status'
alias gp='git add . && git commit -a && git push'
alias sl='sl -a | lolcat'
command -v deno &>/dev/null &&
    alias mon2cam="deno run --unstable -A -r -q https://raw.githubusercontent.com/ShayBox/Mon2Cam/master/src/mod.ts"
