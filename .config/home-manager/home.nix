{ config, pkgs, username, ... }:
let
  commonPkgs = import ./pkgs/common.nix { inherit pkgs; };

  osPkgs = if pkgs.stdenv.isLinux then import ./pkgs/linux.nix { inherit pkgs; }
           else import ./pkgs/darwin.nix { inherit pkgs; };
in
{
  nixpkgs = {
    config.allowUnfree = true;
  };

  home = {
    stateVersion = "24.05";
    username = "${username}";
    homeDirectory = if pkgs.stdenv.isLinux then "/home/${username}" else "/Users/${username}";

    packages = commonPkgs ++ osPkgs;
  };

  programs = {
    # let home-manager install and manage itself
    home-manager.enable = true;

    bat = {
      enable = true;
      config = {
        theme = "Visual Studio Dark+";
      };
    };

    neovim = {
      enable = true;
      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;
    };
  };
}
