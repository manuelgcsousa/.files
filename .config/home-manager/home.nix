{ config, pkgs, username, ... }:
let
  _base = import ./pkgs/_base.nix { inherit pkgs; };
  _tmp  = import ./pkgs/_tmp.nix  { inherit pkgs; };

  sway = import ./pkgs/sway.nix { inherit pkgs; };
in
{
  nixpkgs = {
    config.allowUnfree = true;
  };

  home = {
    stateVersion = "24.05";
    username = "${username}";
    homeDirectory = if pkgs.stdenv.isLinux then "/home/${username}" else "/Users/${username}";

    packages = _base ++ _tmp ++ sway;
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
