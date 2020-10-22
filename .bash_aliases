# Check the AUR wrapper installed in the system
if which pakku &>/dev/null; then
    export aur_wrapper="pakku"
elif which trizen &>/dev/null; then
    export aur_wrapper="trizen"
else # If no AUR wrapper found, use yaourt as fallback
    echo -e "\e[1;36mNo AUR Wrapper found!!!, using \"yaourt\"\e[0m"
    export aur_wrapper="yaourt"
fi

alias rsync='rsync -a --progress'
[[ "$aur_wrapper" ]] && alias $aur_wrapper="$aur_wrapper --noconfirm"
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
alias update="$aur_wrapper -Syu && clean_orphans"
alias pf='update && shutdown now'
alias sl='sl -a | lolcat'
