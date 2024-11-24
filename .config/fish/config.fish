if status is-interactive
    # Commands to run in interactive sessions can go here
end

alias ls="eza"
alias l="eza -l"
alias cat="bat"
alias dc="docker compose"

fish_add_path "~/.cargo/bin/"

starship init fish | source
atuin init fish | source
zoxide init fish --cmd cd | source
