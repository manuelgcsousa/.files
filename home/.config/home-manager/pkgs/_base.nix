{ pkgs }:
let
  common = with pkgs; [
    # base
    bat
    fastfetch
    fd
    fzf
    go
    htop
    jq
    just
    nodejs_24
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
  ];

  linux = with pkgs; [ ];

  darwin = with pkgs; [
    jankyborders
  ];
in
  common ++ (if pkgs.stdenv.isLinux then linux else darwin)
