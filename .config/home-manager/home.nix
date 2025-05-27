{ config, pkgs, username, ... }:
let
  base = import ./pkgs/base.nix { inherit pkgs; };
  extra = import ./pkgs/extra.nix { inherit pkgs; };
in
{
  nixpkgs = {
    config.allowUnfree = true;
  };

  home = {
    stateVersion = "24.05";
    username = "${username}";
    homeDirectory = if pkgs.stdenv.isLinux then "/home/${username}" else "/Users/${username}";

    packages = base ++ extra;
  };

  programs = {
    # let home-manager install and manage itself
    home-manager.enable = true;

    neovim = {
      enable = true;
      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;
    };
  };
}
