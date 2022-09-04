PROMPT=$'[%{$fg[yellow]%}%D{%H:%M:%S}%{$reset_color%}] [%(#.%{$fg_bold[red]%}.%{$fg[cyan]%})%n%{$reset_color$fg[cyan]%}@%m%{$reset_color%}] (%{$fg_bold[green]%}%~%{$reset_color%})$(git_prompt_info)%(?.. %{$fg_bold[red]%}(%?%))%{$reset_color%}
%#%{$reset_color%} '

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[white]%}<%{$fg[blue]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color$fg[white]%}>%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_bold[red]%}*"
ZSH_THEME_GIT_PROMPT_CLEAN=""

# vim: ft=zsh
