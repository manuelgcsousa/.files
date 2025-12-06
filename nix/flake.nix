{
  description = "Portable nixpkgs environment";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};

      enableSway = true;

      _base = import ./pkgs/_base.nix { inherit pkgs; };
      _tmp  = import ./pkgs/_tmp.nix  { inherit pkgs; };
      sway  = import ./pkgs/sway.nix  { inherit pkgs; };
    in
    {
      packages.${system}.default = pkgs.buildEnv {
        name = "my-env";

        paths = (_base ++ _tmp)
          ++ (if enableSway then sway else [])
        ;
      };
    };
}

