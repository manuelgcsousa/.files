{ pkgs }:
with pkgs; [
  # base
  fd
  fzf
  jq
  just
  macchina
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
