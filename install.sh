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
for file $(ls -d .[!.]* * | grep -Ev ".git|README.md|install.sh") ; do
        if [[ -d "$file" ]]; then
            cp -r "$file" "$HOME/.config"
        else
            cp "$file" "$HOME/.$file"
        fi
done

# Create NeoVim symlink
ln -sf $(which nvim) /usr/bin/vim

echo -e "\nDotfiles installed !!!"
echo  "Execute \"source $HOME/.bashrc\" to reload the actual config"

