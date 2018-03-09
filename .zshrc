bindkey "^R" history-incremental-search-backward
bindkey "^[[3~" delete-char
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line
bindkey "^[[1" beginning-of-line
bindkey "^[[4" end-of-line
bindkey "^[[1~" beginning-of-line
bindkey "^[[4~" end-of-line
bindkey "^[[7~" beginning-of-line
bindkey "^[[8~" end-of-line

zstyle ':completion:*' completer _complete _correct _approximate
zstyle ':completion:*' special-dirs true

autoload -Uz compinit
compinit

setopt prompt_subst
setopt inc_append_history
setopt share_history
setopt histignorespace

_git_status() {
  if [[ -d .git || $(git rev-parse --git-dir > /dev/null 2>&1) ]]; then
    git rev-parse --abbrev-ref HEAD > /dev/null 2>&1
    [[ $? == 0 ]] && echo "%F{white}[git:$(git rev-parse --abbrev-ref HEAD)] $(git diff --no-ext-diff --quiet --exit-code && echo '✔' || echo '✗')%f "
  fi
}

if [[ ! $(gpg-connect-agent --quiet /bye > /dev/null 2> /dev/null) ]]; then
  source "$HOME/.gpg-agent-info" 2>/dev/null
  eval $(gpg-agent --quiet --daemon --use-standard-socket --enable-ssh-support --write-env-file "$HOME/.gpg-agent-info" 2>/dev/null)
  chmod 0600 "$HOME/.gpg-agent-info" 2>/dev/null
fi

source "$HOME/.gpg-agent-info" 2>/dev/null

export PROMPT='%B%F{white}%~%f%b $(_git_status)› '
export HISTSIZE=10000
export SAVEHIST=10000
export HISTFILE=~/.zsh_history
export CLICOLOR_FORCE=1

export GPG_AGENT_INFO
export SSH_AUTH_SOCK
export SSH_AGENT_PID
export GPG_TTY=$(tty)

export TERM="$([[ $TMUX ]] && echo 'screen-256color' || echo 'xterm-256color')"
export EDITOR="vim"
export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"

export PATH="/usr/local/bin:/usr/local/sbin:$HOME/.rvm/bin:$(npm bin):$PATH"
