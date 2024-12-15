{ pkgs }:
with pkgs; [
  # base
  fd
  fzf
  jq
  just
  macchina
  ripgrep
  stow
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
