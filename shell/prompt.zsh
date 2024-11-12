# zsh terminal prompt:
# absolute directory / aws-vault session profile / app env to build : tenant to build / the usual oh-my-zsh git stuff

PROMPT="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"
PROMPT+=' %{$fg[cyan]%}%~%{$reset_color%} %{$fg_bold[magenta]%}AWS_VAULT:(%{$fg_bold[green]%}$(aws_vault_profile)%{$reset_color%}%{$fg_bold[magenta]%})%{$reset_color%} %{$fg[yellow]%}$(env_to_build)%{$reset_color%}:%{$fg[yellow]%}$(tenant_to_build)%{$reset_color%} $(git_prompt_info)'
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

aws_vault_profile() {
  # logic goes here
  echo ${AWS_VAULT}
}
# customize for current project
env_to_build() {
  # logic goes here
  active_env="${ENVIRONMENT_TO_BUILD:-NONE}"
  echo ${active_env}
}
# customize for current project
tenant_to_build() {
  # logic goes here
  active_env="${TENANT_TO_DEPLOY:-NONE}"
  echo ${active_env}
}
