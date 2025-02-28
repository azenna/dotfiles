if status is-interactive
    # Commands to run in interactive sessions can go here
end

set fish_greeting

alias ls="eza"
alias l="eza -l"
alias cat="bat"
alias dc="docker compose"

bind \cy forward-char

fish_add_path "~/.cargo/bin/"
fish_add_path "/opt/roc"
fish_add_path "/opt/vim-tidal/bin/"
fish_add_path "/opt/deno/bin/"
fish_add_path "/opt/fly/bin/"

starship init fish | source
atuin init fish | source
zoxide init fish --cmd cd | source


set -Ux PYENV_ROOT $HOME/.pyenv
set -U fish_user_paths $PYENV_ROOT/bin $fish_user_paths

pyenv init - fish | source

set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME ; set -gx PATH $HOME/.cabal/bin $PATH /home/zenna/.ghcup/bin # ghcup-env
