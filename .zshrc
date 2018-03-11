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

autoload -Uz compinit && compinit

setopt prompt_subst
setopt inc_append_history
setopt share_history
setopt histignorespace

_git_status() {
  if [[ -d .git || $(git rev-parse --git-dir > /dev/null 2>&1) ]]; then
    git rev-parse --abbrev-ref HEAD > /dev/null 2>&1 && echo "%F{white}[git:$(git rev-parse --abbrev-ref HEAD)] $(git diff --no-ext-diff --quiet --exit-code && echo '%F{green}✔%f ' || echo '%F{red}✗%f ')%f"
  fi
}

_ssh_status() {
  [[ ! -z "${SSH_CONNECTION}" ]] &&echo "%F{red}⚠%f " || echo " ❯"
}

[[ -f ~/.gpg-agent-info ]] && source ~/.gpg-agent-info
[[ ! -S "${GPG_AGENT_INFO%%:*}" ]] && eval $(gpg-agent --daemon --quiet --enable-ssh-support ~/.gpg-agent-info > /dev/null 2>&1)

[[ "$(uname)" == "Darwin" ]] && alias ls='ls -G' || alias ls='ls --color=auto'
alias grep='grep --color=auto'

export GPG_AGENT_INFO
export SSH_AUTH_SOCK
export SSH_AGENT_PID
export GPG_TTY=$(tty)

export PROMPT='%B%F{white}%~%f%b $(_git_status)$(_ssh_status) '
export HISTSIZE=10000
export SAVEHIST=10000
export HISTFILE=~/.zsh_history
export CLICOLOR_FORCE=1

export TERM="$([[ $TMUX ]] && echo 'screen-256color' || echo 'xterm-256color')"
export EDITOR="vim"
export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"

export PATH="/usr/local/bin:/usr/local/sbin:$HOME/.rvm/bin:$(npm bin):$PATH"
