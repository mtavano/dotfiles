# Yay! High voltage and arrows!



# RVM settings
if [[ -s ~/.rvm/scripts/rvm ]] ; then
  RPS1="%{$fg[yellow]%}rvm:%{$reset_color%}%{$fg[red]%}\$(~/.rvm/bin/rvm-prompt)%{$reset_color%} $EPS1"
else
  if which rbenv &> /dev/null; then
    RPS1="%{$fg[yellow]%}rbenv:%{$reset_color%}%{$fg[red]%}\$(rbenv version | sed -e 's/ (set.*$//')%{$reset_color%} $EPS1"
  fi
fi



ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[blue]%} [%{$fg[cyan]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg[blue]%}] %{$reset_color%}"

ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%} ✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%} ●%{$reset_color%}"

function get_pwd() {
  echo "${PWD/$HOME/~}"
}

function put_spacing() {

}
local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ %s)"
PROMPT='$fg[blue]%m $fg[white] in  $fg[yellow]$(get_pwd)$(put_spacing)$(git_prompt_info)%{$reset_color%}%B%b
〉'

