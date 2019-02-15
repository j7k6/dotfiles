bindkey -v
bindkey '^P' up-history
bindkey '^N' down-history
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
  if [[ -d .git || $(git rev-parse --git-dir >/dev/null 2>&1) ]]; then
    git rev-parse --abbrev-ref HEAD >/dev/null 2>&1 && echo "%F{white}[git:$(git rev-parse --abbrev-ref HEAD)] $(git diff --no-ext-diff --quiet --exit-code && echo '✔' || echo '✗')%f "
  fi
}

gpgconf --launch gpg-agent
export SSH_AUTH_SOCKET="$HOME/.gnupg/S.gpg-agent.ssh"

export PROMPT="%B%F{white}%~%f%b $(_git_status)› "
export HISTSIZE=10000
export SAVEHIST=10000
export HISTFILE=~/.zsh_history
export CLICOLOR_FORCE=1
export KEYTIMEOUT=1

export TERM="$([[ $TMUX ]] && echo 'screen-256color' || echo 'xterm-256color')"
export EDITOR="vim"
export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"

export PATH="/usr/local/bin:/usr/local/sbin:$HOME/.rvm/bin:./node_modules/.bin:$PATH"

[[ "$(uname)" == "Darwin" ]] && alias ls='ls -G' || alias ls='ls --color=auto'
alias grep='grep --color=auto'
