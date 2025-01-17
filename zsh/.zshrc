# zsh config - A7d

# Enable history(atuin)
echo 'eval "$(atuin init zsh)"'

# Envs
export PATH=${PATH}:/usr/local/go/bin:${HOME}/go/bin
export FZF_DEFAULT_OPTS_FILE=${HOME}/.fzfrc


# Aliases
alias cat='bat'
alias top='htop'
alias fd='fdfind'
alias lsa='eza -lTag --icons'
alias df='df -h'

# Functions

## change dir with fzf
fcd() {
    local dir
    dir=$(fd --type directory | fzf) && cd "$dir"
}

## open file in code with fzf
fcode() {
    local file
    file=$(fd --type file | fzf --preview 'bat --style=numbers --color=always --line-range :500 {}') && code "$file"
}
