{ pkgs }:
with pkgs; [
  # base
  fd
  fzf
  go
  jq
  just
  macchina
  nodejs_23
  pyenv
  ripgrep
  tabiew
  tmux
  tree
  typst
  wget

  # language tools
  gopls
  lua-language-server
  pyright
  ruff
  terraform-ls

  # fonts
  nerd-fonts.iosevka-term
]
