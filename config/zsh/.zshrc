#
# env
#

# 256 colors term
export TERM="xterm-256color"

# defaults
export TERMINAL="kitty"
export EDITOR="nvim"
export LANG=pt_PT.UTF-8

# go
export GOPATH="$HOME/.local/share/go"

# docker on arm?
[[ $(uname -m) == "arm64" ]] && export DOCKER_DEFAULT_PLATFORM=linux/arm64

# fzf key bindings and fuzzy completion
source <(fzf --zsh)


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
pathadd "$HOME/.cargo/bin"
pathadd "/opt/gradle/gradle-8.5/bin"
pathadd "$HOME/.bun/bin"

# pyenv within PATH
eval "$(pyenv init -)"


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
alias tf="terraform"
alias icat="kitten icat"
alias hms="home-manager switch"


#
# functions
#

function ppath() {
  echo $PATH | tr -s ':' '\n'
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

function fcheckout() {
  if [ -n "$(git status 2> /dev/null)" ]; then
    branch=$(git branch | grep -v "^\*" | tr -d ' ' | fzf --reverse --border=bold --height=50% --color=hl:9,hl+:1)
    [ -n "$branch" ] && git checkout $branch
  else
    echo 'Current directory is not a git repository.'
  fi
}


# direnv
eval "$(direnv hook zsh)"
