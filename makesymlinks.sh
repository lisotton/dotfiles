#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles e.g.: ~/dotfiles
############################


########## Variables
dir=$(pwd)                    # dotfiles directory
olddir=~/.dotfiles-bak        # old dotfiles backup directory
files="bashrc zshrc"          # list of files/folders to symlink in homedir
##########

# verify if backup directory exist
if [ ! -d "$olddir" ]; then
  echo "Creating $olddir for backup of any existing dotfiles in ~"
  mkdir -p $olddir
fi

# create symlink to files
for file in $files; do
  echo "Moving any existing dotfiles from ~ to $olddir"
  mv -r ~/.$file $olddir

  echo "Creating symlink to $file in home directory."
  ln -s $dir/.$file ~/.$file
done

echo "Creating symlink to Sublime user settings."
mv -r ~/.config/sublime-text-3/Packages/User/Preferences.sublime-settings $olddir
ln -s $dir/Preferences.sublime-settings ~/.config/sublime-text-3/Packages/User/Preferences.sublime-settings

echo "Creating symlink to custom oh-my-zsh plugins and themes."
mv -r ~/.oh-my-zsh/custom $olddir
ln -s $dir/custom ~/.oh-my-zsh/custom