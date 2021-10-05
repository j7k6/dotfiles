bindkey -v
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

zstyle ":vcs_info:*" enable git
zstyle ":vcs_info:*" get-revision true
zstyle ":vcs_info:*" check-for-changes true
zstyle ":vcs_info:*" unstagedstr "*"
zstyle ":vcs_info:*" stagedstr "+"
zstyle ":vcs_info:git:*" formats "%F{white}[%s:%b/%8.8i%u%c]%f "
zstyle ":completion:*" completer _complete _correct _approximate
zstyle ":completion:*" menu select
zstyle ":completion:*" special-dirs true
zstyle ":completion:*" insert-tab false
zstyle ":completion:*:ssh:*" tag-order "!users"
zstyle -e ":completion:*:ssh:*" hosts "reply=()"

autoload -Uz compinit && compinit
autoload -Uz vcs_info

setopt prompt_subst extended_history inc_append_history share_history histignorespace correct magic_equal_subst extended_glob

gpg-agent --daemon --quiet --enable-ssh-support >/dev/null 2>&1
gpg-connect-agent --quiet /bye >/dev/null 2>&1

precmd() { 
  vcs_info
  export PROMPT="%B%F{white}%~%f%b ${vcs_info_msg_0_}› "
}

export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
export GPG_TTY="$(tty)"
export HISTSIZE=10000
export SAVEHIST=10000
export CLICOLOR_FORCE=1
export KEYTIMEOUT=1
export TERM="$(test $TMUX && echo 'screen-256color' || echo 'xterm-256color')"
export EDITOR="vim"
export LANG="en_US.UTF-8"
export LC_ALL="$LANG"
export PATH="/usr/local/bin:/usr/local/sbin:$HOME/.rvm/bin:./node_modules/.bin:$PATH"

alias ls="ls -G"
alias grep="grep --color=auto"
