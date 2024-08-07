export ZSH=$HOME/.oh-my-zsh
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

setopt autocd

zstyle :compinstall filename '/home/zenna/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
#
path+="~/.cargo/bin"
path+="$HOME/.local/bin"
export PATH

source $ZSH/oh-my-zsh.sh

plugins=(
  git
  zsh-autosuggestions
)

bindkey -v
bindkey "^y" autosuggest-accept

alias ls="eza"
alias l="eza -l"
alias cat="bat"
alias dc="docker compose"

eval "$(starship init zsh)"
eval "$(atuin init zsh --disable-up-arrow)"
eval "$(zoxide init zsh --cmd cd)"


# linux
# source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# mac
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/bin/google-cloud-sdk/path.zsh.inc

[ -f "/Users/a327793/.ghcup/env" ] && . "/Users/a327793/.ghcup/env" # ghcup-env
