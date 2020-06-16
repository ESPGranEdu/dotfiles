# Check the AUR wrapper installed in the system
if which pakku &>/dev/null; then
    export aur_wrapper="pakku"
elif which trizen &>/dev/null; then
    export aur_wrapper="trizen"
else # If no AUR wrapper found, use yaourt as fallback
    echo -e "\e[1;36mNo AUR Wrapper found!!!, using \"yaourt\"\e[0m"
    export aur_wrapper="yaourt"
fi

alias rsync='rsync -a --progress'                                   	#ARCHLINUX-OPENBOX
[ "$aur_wrapper" ] && alias $aur_wrapper="$aur_wrapper --noconfirm" 	#ARCHLINUX-OPENBOX
alias ls='ls --color=auto'                                          	#ARCHLINUX-OPENBOX
alias l='ls'								                            #ARCHLINUX-OPENBOX
alias ll='ls -l --color=auto'                                       	#ARCHLINUX-OPENBOX
alias grep='grep --color=auto'                                      	#ARCHLINUX-OPENBOX
alias egrep='grep -E'							                        #ARCHLINUX-OPENBOX
alias rgrep='grep -r'							                        #ARCHLINUX-OPENBOX
alias ip='ip -c'                                                    	#ARCHLINUX-OPENBOX
alias bconf='vim ~/.bashrc'                                         	#ARCHLINUX-OPENBOX
alias vconf='vim ~/.config/nvim/init.vim'                               #ARCHLINUX-OPENBOX
alias update-grub='sudo grub-mkconfig -o /boot/grub/grub.cfg'       	#ARCHLINUX-OPENBOX
alias update="$aur_wrapper -Syu && clean_orphans"			            #ARCHLINUX-OPENBOX
#alias pr='update && reboot'						                    #ARCHLINUX-OPENBOX
alias pf='update && shutdown now'					                    #ARCHLINUX-OPENBOX
alias sl='sl -a | lolcat'						                        #ARCHLINUX-OPENBOX
