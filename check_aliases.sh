#!/bin/bash

allok=1
check() {
    if [ "$(realpath "$1")" != "$(realpath "$2")" ]; then
        echo ln -s $(realpath "$1") $2
        allok=0
    fi
}
checkc() {
    check $1 ~/.config/$1
}
cd "$(dirname "$0")"

check zprofile ~/.zprofile
check zshrc ~/.zshrc
check mine.zsh-theme ~/.config/oh-my-zsh/custom/themes/mine.zsh-theme
checkc nvim
checkc waybar
checkc sway/config
checkc swaylock/config
checkc mako/config
checkc alacritty.yml

if [ $allok = 1 ]; then echo all links ok; fi
