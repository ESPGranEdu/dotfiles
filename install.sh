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

for files in $(ls -d .[!.]* *) ; do
        if [[ -d "$files" ]]; then
                echo "$files -> $HOME/.config"
                #cp -r "$files" "$HOME/.config"
        else
                echo "$files -> $HOME"
                #cp "$files" "$HOME"
        fi
done

echo -e "\nDotfiles installed !!!"
echo  "Execute \"source $HOME/.bashrc\" to reload the actual config"


