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
path+="/home/zenna/.cargo/bin"
export PATH

source $ZSH/oh-my-zsh.sh

plugins=(
  git
  zsh-autosuggestions
)

bindkey -v
bindkey "^y" autosuggest-accept

eval "$(starship init zsh)"
eval "$(atuin init zsh --disable-up-arrow)"
eval "$(zoxide init zsh --cmd cd)"
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
