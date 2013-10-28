
########################################
#
# A better git leads to a better world !
#
# Thx to oh-my-zsh project for these great aliases
# https://github.com/robbyrussell/oh-my-zsh/blob/master/plugins/git/git.plugin.zsh
#
########################################

# exit if not bash
[ -n "$BASH_VERSION" ] && return

# let's use autocompletion for git
[ -f /etc/bash_completion.d/git ] && source /etc/bash_completion.d/git

# and a bunch of aliases
alias g='git'
alias gst='git status'
complete -F _git_status gst
alias gl='git pull'
complete -F _git_pull gl
alias gup='git pull --rebase'
complete -F _git_pull gup
alias gp='git push'
complete -F _git_push gp
alias gc='git commit -v'
complete -F _git_commit gc
alias gco='git checkout'
complete -F _git_checkout gco
alias gb='git branch'
complete -F _git_branch gb
alias glg='git log --stat --max-count=5'
complete -F _git_log glg
alias ga='git add'
complete -F _git_add ga
alias gm='git merge'
complete -F _git_merge gm
alias grh='git reset HEAD'
complete -F _git_reset grh
alias grhh='git reset HEAD --hard'
complete -F _git_reset grhh

#
# Will return the current branch name
# Usage example: git pull origin $(current_branch)
#
function current_branch() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || \
  ref=$(git rev-parse --short HEAD 2> /dev/null) || return
  echo ${ref#refs/heads/}
}

function current_repository() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || \
  ref=$(git rev-parse --short HEAD 2> /dev/null) || return
  echo $(git remote -v | cut -d':' -f 2)
}

# these aliases take advantage of the previous function
alias ggpull='git pull origin $(current_branch)'
alias ggpush='git push origin $(current_branch)'
alias ggpnp='git pull origin $(current_branch) && git push origin $(current_branch)'
