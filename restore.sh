#!/bin/bash

printf "\e[0;33mInstalling apt packages...\e[0m\n"
sudo apt-get install $(cat apt-pkgs)

echo "\e[0;33mInstalling pip packages...\e[0m\n"
sudo -H pip install -r pip-pkgs

echo "\e[0;33mCopying dotfiles...\e[0m\n"
cp -Tv vimrc ~/.vimrc
cp -Tv gitconfig ~/.gitconfig
mkdir -pv ~/.newsbeuter
mkdir -pv ~/.config
cp -Tv newsbeuter_urls ~/.newsbeuter/urls
cp -Tv fish ~/.config/fish
cp -Tv roxterm ~/.config/roxterm.sourceforge.net

echo "\e[0;33mInstalling fish plugins...\e[0m\n"
curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisherman
cp -Tv fisherman_plugins ~/.config/fish/fishfile
fish -c fisher
