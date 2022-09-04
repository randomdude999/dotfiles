#!/bin/zsh

export XDG_CONFIG_HOME=~/.config
export XDG_CACHE_HOME=~/.cache
export XDG_DATA_HOME=~/.local/share
export XDG_STATE_HOME=~/.local/state

# move various stuff out of ~
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc
export RLWRAP_HOME=$XDG_DATA_HOME/rlwrap
export DOT_SAGE=$XDG_CONFIG_HOME/sage
export TEXMFHOME=$XDG_DATA_HOME/texmf
export TEXMFVAR=$XDG_CACHE_HOME/texlive/texmf-var
export TEXMFCONFIG=$XDG_CONFIG_HOME/texlive/texmf-config
export WGETRC=$XDG_CONFIG_HOME/wgetrc
export CRAWL_DIR=$XDG_DATA_HOME/crawl/
export WINEPREFIX=$XDG_DATA_HOME/wine-default
export RUSTUP_HOME=$XDG_DATA_HOME/rustup
export CARGO_HOME=$XDG_DATA_HOME/cargo
export GRADLE_USER_HOME=$XDG_DATA_HOME/gradle

export PATH=~/.local/bin:$CARGO_HOME/bin:$PATH

export GTK_THEME=Adwaita:dark
export GTK2_RC_FILES=/usr/share/themes/Adwaita-dark/gtk-2.0/gtkrc

# make alacritty (and probably other rust-based gui things) use the same pixel size on all monitors
export WINIT_X11_SCALE_FACTOR=1  # TODO: how does this work on wayland
# make Qt-based things use the same pixel size on all monitors
export QT_AUTO_SCREEN_SCALE_FACTOR=0

# use wayland in firefox
export MOZ_ENABLE_WAYLAND=1
# literally what
export MOZ_DISABLE_RDD_SANDBOX=1

# qt5/6 dark theme
export QT_QPA_PLATFORMTHEME=qt5ct

# fix java gui apps (they don't know about sway)
export _JAVA_AWT_WM_NONREPARENTING=1

if [ -z "$WAYLAND_DISPLAY" ] && [ 1 -eq "$XDG_VTNR" ]; then
    exec sway
fi
