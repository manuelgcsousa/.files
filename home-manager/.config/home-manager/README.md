# home-manager

## Requirements

- Nixpkgs: https://nixos.org/download/

## Setup

- Adapt "username" and "system" within the [flake.nix](./flake.nix) file.
- Run `nix-shell -p home-manager` to create a nix shell with home-manager.
- Run `home-manager switch` to build and activate configuration.
