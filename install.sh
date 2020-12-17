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
            cp "$files" "$HOME/.$files"
        fi
done

# Copy .vimrc and download Vim Plug
ln -sf $HOME/.config/vim/init.vim $HOME/.vimrc
curl -fLo ~/.config/vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install VimPlug and CoC extensions
vim -c "PlugInstall --sync | qa!"
vim -c "CocInstall -sync coc-json coc-python coc-prettier coc-html coc-css coc-emmet coc-vetur coc-yaml coc-tsserver coc-vimlsp coc-sh | qa!"

echo -e "\nDotfiles installed !!!"
echo  "Execute \"source $HOME/.bashrc\" to reload the actual config"

