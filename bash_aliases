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
    fi

    alias $aur_wrapper="$aur_wrapper --noconfirm"
    alias update="$aur_wrapper -Syu && clean_orphans"
    alias pf='update && shutdown now'
fi

#================Aliases=====================================================
alias rsync='rsync -a --progress'
alias ls='ls --color=auto'
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
