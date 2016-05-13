#!/bin/bash
comm -23 <(apt-mark showmanual | sort -u) <(gzip -dc /var/log/installer/initial-status.gz | sed -n 's/^Package: //p' | sort -u) > ./apt-pkgs

pip freeze > ./pip-pkgs

cp ~/.config/fish/fishfile ./fisherman_plugins

cp ~/.vimrc ./vimrc
cp ~/.newsbeuter/urls ./newsbeuter_urls
cp ~/.gitconfig ./gitconfig
cp ~/.config/fish ./fish
cp ~/.config/roxterm.sourceforge.net ./roxterm
