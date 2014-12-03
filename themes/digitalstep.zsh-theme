# get the name of the branch we are on
function my_git_prompt_info() {
  ref=$(command git symbolic-ref HEAD 2> /dev/null) || \
  ref=$(command git rev-parse --short HEAD 2> /dev/null) || return
  echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}$ZSH_THEME_GIT_PROMPT_SUFFIX"
}

function smiley() {
  echo "%(?,%{$fg_bold[cyan]%}☺%{$reset_color%},%{$fg_bold[red]%}☹%{$reset_color%})"
}

PROMPT='%{$fg[cyan]%}`whoami`@`hostname` $(smiley) %{$reset_color%}'
RPROMPT='%{$fg_bold[blue]%}$(parse_git_dirty) $(my_git_prompt_info) %{$fg_bold[blue]%}% %{$fg[cyan]%}%~%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[blue]%}[%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg[blue]%}]%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[yellow]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""
