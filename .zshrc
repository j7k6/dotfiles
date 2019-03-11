bindkey -v
bindkey "^P" up-history
bindkey "^N" down-history
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

zstyle ":completion:*" completer _complete _correct _approximate
zstyle ":completion:*" special-dirs true

autoload -Uz compinit && compinit

setopt prompt_subst
setopt inc_append_history
setopt share_history
setopt histignorespace

_git_status() {
  git rev-parse --is-inside-work-tree >/dev/null 2>&1 && echo "%F{white}[git:$(git rev-parse --abbrev-ref HEAD 2>/dev/null)] $(git diff --no-ext-diff --quiet --exit-code 2>/dev/null && echo '✔' || echo '✗')%f "
}

gpg-connect-agent --quiet /bye >/dev/null 2>&1
eval $(gpg-agent --daemon --quiet --enable-ssh-support >/dev/null 2>&1)
export SSH_AUTH_SOCK=0

export GPG_TTY="$(tty)"
export PROMPT='%B%F{white}%~%f%b $(_git_status)› '
export HISTSIZE=10000
export SAVEHIST=10000
export HISTFILE="$HOME/.zsh_history"
export CLICOLOR_FORCE=1
export KEYTIMEOUT=1
export TERM="$(test $TMUX && echo 'screen-256color' || echo 'xterm-256color')"
export EDITOR="vim"
export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"

export PATH="/usr/local/bin:/usr/local/sbin:$HOME/.rvm/bin:./node_modules/.bin:$PATH"

test "$(uname)" = "Darwin" && alias ls="ls -G" || alias ls="ls --color=auto"
alias grep="grep --color=auto"
