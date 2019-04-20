MODE_INDICATOR="%{$fg_bold[red]%}[N]"

function vi_mode_prompt_info() {
  echo "%{$fg_bold[green]%}${${VI_KEYMAP/vicmd/$MODE_INDICATOR}/(main|viins)/[I]}"
}

VI_KEYMAP=main

glyph='φ'
local ret_status="%(?:%{$fg[green]%}${glyph} :%{$fg[red]%}${glyph} )"
PROMPT='${ret_status} %{$fg_bold[cyan]%}%c%{$reset_color%} $(git_prompt_info)$(vi_mode_prompt_info)%{$reset_color%} | '
RPROMPT=''
RPS1=''

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
