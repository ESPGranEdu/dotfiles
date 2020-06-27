#!/bin/bash

#======================================================
# NAME: install.sh
# DESCRIPTION: Install dotfiles
#======================================================
# Set some shell options
shopt -s extglob

# Create necessary folders
[[ ! -d "$HOME/.config" ]] && mkdir "$HOME/.config"

# Copy files

for files in $(ls -d .[!.]* * | grep -Ev ".git|README.md|install.sh") ; do
        if [[ -d "$files" ]]; then
                cp -r "$files" "$HOME/.config"
        else
                cp "$files" "$HOME"
        fi
done

# Symlink vim to nvim and install plugins
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
grep -Eq "ubuntu|debian" || ln -svf /usr/bin/nvim /usr/bin/vim

vim -c "PlugInstall | q | q"
vim -c "CocInstall coc-json coc-python coc-prettier coc-tsserver coc-vimlsp | q | q"

echo -e "\nDotfiles installed !!!"
echo  "Execute \"source $HOME/.bashrc\" to reload the actual config"


