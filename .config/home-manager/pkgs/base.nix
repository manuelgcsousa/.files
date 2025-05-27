{ pkgs }:
let
  common = with pkgs; [
    # base
    bat
    fd
    fzf
    go
    htop
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
  ];

  linux = with pkgs; [
    wl-clipboard
  ];

  darwin = with pkgs; [
    jankyborders
  ];
in
  common ++ (if pkgs.stdenv.isLinux then linux else darwin)
