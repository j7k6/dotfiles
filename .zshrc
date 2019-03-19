bindkey -v
bindkey "^N" down-history
bindkey "^P" up-history
bindkey "^R" history-incremental-search-backward
bindkey "^[[1;3C" forward-word
bindkey "^[[1;3D" backward-word
bindkey "^[[1~" beginning-of-line
bindkey "^[[3~" delete-char
bindkey "^[[4~" end-of-line
bindkey "^[[7~" beginning-of-line
bindkey "^[[8~" end-of-line
bindkey "^[[A" up-line-or-search                                                
bindkey "^[[B" down-line-or-search
bindkey "^[[F" end-of-line
bindkey "^[[H" beginning-of-line

zstyle ":completion:*" completer _complete _correct _approximate
zstyle ":completion:*" menu select
zstyle ":completion:*" special-dirs true
zstyle ":completion:*" insert-tab false
zstyle ":completion:*:ssh:*" tag-order "!users"
zstyle -e ":completion:*:ssh:*" hosts "reply=()"

zle_highlight+=(paste:none)

autoload -Uz compinit && compinit

setopt prompt_subst extended_history inc_append_history share_history histignorespace correct magic_equal_subst extended_glob

_git_status() {
  git rev-parse --is-inside-work-tree >/dev/null 2>&1 && echo "%F{white}[git:$(git rev-parse --abbrev-ref HEAD 2>/dev/null)] $(git diff --no-ext-diff --quiet --exit-code 2>/dev/null && echo '✔' || echo '✗')%f "
}

gpg-agent --daemon --quiet --enable-ssh-support >/dev/null 2>&1
gpg-connect-agent --quiet /bye >/dev/null 2>&1

export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
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
