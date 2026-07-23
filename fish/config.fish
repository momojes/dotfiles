set -g fish_greeting

fish_vi_key_bindings

set -gx EDITOR nvim
set -gx SUDO_EDITOR nvim
set -gx VISUAL nvim
set -gx PAGER less
set -gx LESS "-R"

if test -d "$HOME/.local/bin"
	fish_add_path "$HOME/.local/bin"
end

alias ll='ls -lah'
alias la='ls -A'
alias l='ls -CF'
alias rebuild='sudo nixos-rebuild switch'
alias nixconfig='nvim /etc/nixos/configuration.nix'
alias nixtest='sudo nixos-rebuild test'
alias i3config='nvim ~/.config/i3/config'
alias fishconfig='nvim ~/.config/fish/config.fish'
alias kittyconfig='nvim ~/.config/kitty/kitty.conf'
alias fetch='fastfetch'
alias nup='emacsclient -c -a "" ~/notes/org/updateIdeas.org'
alias emacs='emacsclient -c -a ""'
alias garbo='nix-collect-garbage'
alias update='sudo nixos-rebuild switch --upgrade'
if test "$TERM" = "xterm-256color" -o "$TERM" = "eterm-color"
  set -gx COLORTERM truecolor
end
