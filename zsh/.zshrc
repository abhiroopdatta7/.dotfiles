#.zshrc - A7d

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

zinit light chrissicool/zsh-256color

# Two regular plugins loaded without investigating.
zinit light zdharma-continuum/fast-syntax-highlighting

# Starship
zinit ice as"command" from"gh-r" \
          atclone"./starship init zsh > init.zsh; ./starship completions zsh > _starship" \
          atpull"%atclone" src"init.zsh"
zinit light starship/starship

zinit light marlonrichert/zsh-autocomplete
bindkey              '^I' menu-select
bindkey "$terminfo[kcbt]" menu-select
bindkey -M menuselect              '^I'         menu-complete
bindkey -M menuselect "$terminfo[kcbt]" reverse-menu-complete
bindkey -M menuselect  '^[[D' .backward-char  '^[OD' .backward-char
bindkey -M menuselect  '^[[C'  .forward-char  '^[OC'  .forward-char
zstyle ':autocomplete:*complete*:*' insert-unambiguous yes # all Tab widgets
zstyle ':autocomplete:*history*:*' insert-unambiguous yes # all history widgets
zstyle ':autocomplete:menu-search:*' insert-unambiguous yes # ^S
zstyle ':autocomplete:*' add-space \
    executables aliases functions builtins reserved-words commands

# Atuin
zinit ice as"command" from"gh-r" bpick"atuin-*.tar.gz" mv"atuin*/atuin -> atuin" \
    atclone"./atuin init zsh > init.zsh; ./atuin gen-completions --shell zsh > _atuin" \
    atpull"%atclone" src"init.zsh"
zinit light atuinsh/atuin

# zoxide
export _ZO_ECHO=1
eval "$(zoxide init --cmd cd --hook pwd zsh)"

# zinit light zsh-users/zsh-autosuggestions
# export ZSH_AUTOSUGGEST_STRATEGY=(history completion)
# export ZSH_AUTOSUGGEST_USE_ASYNC=true
# # bindkey '^ ' autosuggest-accept