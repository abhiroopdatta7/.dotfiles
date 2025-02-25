#.zenv - A7d

export PATH=${PATH}:/usr/local/go/bin:${HOME}/go/bin
export GOPATH='/Users/omerxx/go'

# Shell plugins
export FZF_DEFAULT_OPTS_FILE=${HOME}/.fzfrc
export STARSHIP_CONFIG=~/.starship.toml
export ATUIN_CONFIG_DIR=~/.atuin
## 
export ZSH_AUTOSUGGEST_STRATEGY=(history completion)
export ZSH_AUTOSUGGEST_USE_ASYNC=true
# bindkey '^ ' autosuggest-accept

# Aliases
alias cat='bat'
alias top='htop'
alias fd='fd-find'
alias df='df -h'
alias ls='lsd'

## eza
alias l=' eza --oneline --icons --group-directories-first'
alias ll='eza -l -a --icons --group-directories-first'
alias tree='eza --tree --icons'

# 
typeset -A SECRETS=()

# Functions

## change dir with fzf
function fcd() {
    local dir
    dir=$(fd --type directory | fzf) && cd "$dir"
}

## open file in code with fzf
function fcode() {
    local file
    file=$(fd --type file | fzf --preview 'bat --style=numbers --color=always --line-range :500 {}') && code "$file"
}


# Archives
function extract {
  if [ -z "$1" ]; then
    echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
  else
    if [ -f $1 ]; then
      case $1 in
        *.tar.bz2)   tar xvjf $1    ;;
        *.tar.gz)    tar xvzf $1    ;;
        *.tar.xz)    tar xvJf $1    ;;
        *.lzma)      unlzma $1      ;;
        *.bz2)       bunzip2 $1     ;;
        *.rar)       unrar x -ad $1 ;;
        *.gz)        gunzip $1      ;;
        *.tar)       tar xvf $1     ;;
        *.tbz2)      tar xvjf $1    ;;
        *.tgz)       tar xvzf $1    ;;
        *.zip)       unzip $1       ;;
        *.Z)         uncompress $1  ;;
        *.7z)        7z x $1        ;;
        *.xz)        unxz $1        ;;
        *.exe)       cabextract $1  ;;
        *)           echo "extract: '$1' - unknown archive method" ;;
      esac
    else
      echo "$1 - file does not exist"
    fi
  fi
}

## secrets
function _lock {
  local secret_dir=$(eval echo ~$USER)/.dotfiles/secrets
  typeset -x PASS=""
  echo -n "Enter a Password: "
  read -s PASS
  echo ""
  ccencrypt -E PASS $secret_dir/*
  unset PASS
}

function _unlock {
  local secret_dir=$(eval echo ~$USER)/.dotfiles/secrets
  typeset -x PASS=""
  echo -n "Enter a Password: "
  read -s PASS
  echo ""
  ccdecrypt -E PASS $secret_dir/*
  unset PASS
}

function _ls {
  for key in "${(@k)SECRETS}"; do
    echo "SECRETS[$key]"
  done
}

function _lsa {
  for key in "${(@k)SECRETS}"; do
    echo "SECRETS[$key]=$SECRETS[$key]"
  done
}

function _load {
  local secret_dir=$(eval echo ~$USER)/.dotfiles/secrets
  typeset -x PASS=""
  echo -n "Enter a Password: "
  read -s PASS
  echo ""
  ccdecrypt -E PASS $secret_dir/*
  for file in $secret_dir/*; do
    if [ -f "$file" ]; then
      source "$file"
    fi
  done
  ccencrypt -E PASS $secret_dir/*
  unset PASS
}

function _unload {
  for key in "${(@k)SECRETS}"; do
    unset $SECRETS[$key]
  done
}

# _add() {
#   local secret_dir=$(eval echo ~$USER)/.dotfiles/secrets
#   local key=$1
#   local val=$2
#   echo "Adding secret $key: $val"
#   typeset -x PASS=""
#   echo -n "Enter a Password: "
#   read -s PASS
#   echo ""
#   ccdecrypt -E PASS $secret_dir/*
#   # add
#   touch $secret_dir/local
#   echo "SECRETS[$key]=$val" >> $secret_dir/local
#   # source
#   for file in $secret_dir/*; do
#     if [ -f "$file" ]; then
#       source "$file"
#     fi
#   done
#   ccencrypt -E PASS $secret_dir/*
#   unset PASS
# }
