#
# ENV
#

export TERM="xterm-256color"
export TERMINAL="wezterm"
export EDITOR="nvim"
export LANG=pt_PT.UTF-8
export LC_MESSAGES=en_US.UTF-8

# go's workspace
export GOPATH="$HOME/.local/share/go"
export GOBIN="$GOPATH/bin"

# Nix
if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
  . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
fi
# End Nix


#
# PATH
#

function pathadd() {
  if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
    PATH="${PATH:+"$PATH:"}$1"
  fi
}

pathadd "/opt/homebrew/bin"
pathadd "/opt/homebrew/sbin"
pathadd "$HOME/.local/bin"
pathadd "$HOME/.scripts"
pathadd "/usr/local/go/bin"
pathadd "$GOPATH"
pathadd "$GOBIN"
pathadd "$HOME/.cargo/bin"
pathadd "$(npm prefix -g)/bin"

# pyenv
pathadd "$HOME/.pyenv"
command -v pyenv >/dev/null && eval "$(pyenv init -)"

# fzf key bindings
command -v fzf >/dev/null && source <(fzf --zsh)


#
# settings
#

# prompt
function parse_git_branch() {
  branch=$(git branch 2> /dev/null | sed -n -e 's/^\* \(.*\)/\1/p')
  [ $branch ] && echo " :: %F{green}$branch%f"
}

precmd() {
  print ""
}

setopt PROMPT_SUBST
PROMPT=$'[%F{8}%~%f$(parse_git_branch)]\n$ '

# history
HISTSIZE=10000
SAVEHIST=10000
HISTFILE="$HOME/.cache/zsh/history"
export FZF_CTRL_R_OPTS="--reverse"

# vi mode
bindkey -v
export KEYTIMEOUT=1
bindkey "^?" backward-delete-char

# autocomplete
autoload -U compinit && compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# shell utils
setopt ignoreeof

# ls colors
if [[ $(uname -s) == "Linux" ]]; then
  export LS_COLORS="di=1;36:ln=1;31:so=35:pi=33:ex=1;32:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=34;43"
else
  export CLICOLOR=1
  export LSCOLORS=GxBxfxdxCxegedabagaced
fi


#
# aliases
#

# sane defaults
alias \
  ..="cd ../" \
  ls="ls -v --color" \
  cp="cp -iv" \
  rm="rm -i" \
  mv="mv -i" \
  mkdir="mkdir -p" \
  grep="grep --color=auto"

# other
alias cat="bat -pp"
alias vim="nvim"
alias hms="home-manager switch"
alias lf="ls --color=never | fzf"


#
# functions
#

function ppath() {
  echo $PATH | tr -s ':' '\n'
}

function mkcd() {
  mkdir -p $@
  cd $@
}

function mktar() {
  tar -cvzf "$1.tar.gz" "$1";
}

function untar() {
  tar -xvzf "$1";
}

function mkzip() {
  zip -r "$1.zip" "$1";
}

function unzipto() {
  local output="${1%.zip}"
  mkdir -p "$output" && unzip "$1" -d "$output"
}

function fcheckout() {
  if [ -n "$(git status 2> /dev/null)" ]; then
    branch=$(git branch | grep -v "^\*" | tr -d ' ' | fzf --reverse --border=bold --height=50% --color=hl:9,hl+:1)
    [ -n "$branch" ] && git checkout $branch
  else
    echo 'Current directory is not a git repository.'
  fi
}
