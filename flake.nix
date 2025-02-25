{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils = {
      url = "github:numtide/flake-utils";
      inputs.systems.follows = "systems";
    };
    flint = {
      url = "github:notashelf/flint";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nvf = {
      url = "github:notashelf/nvf";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        flake-utils.follows = "flake-utils";
        systems.follows = "systems";
      };
    };
    systems.url = "github:nix-systems/default";
    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = {self, ...} @ inputs:
    inputs.flake-utils.lib.eachDefaultSystem (system: let
      lib =
        inputs.nixpkgs.lib
        // inputs.nvf.lib
        // import ./lib;
      pkgs = import inputs.nixpkgs {inherit system;};
      treefmt =
        (inputs.treefmt-nix.lib.evalModule pkgs {
          programs = {
            alejandra.enable = true;
            deadnix.enable = true;
            statix.enable = true;
          };
        })
        .config
        .build;
    in {
      packages = {
        default = self.packages.${system}.neovim;
        inherit
          (lib.neovimConfiguration {
            inherit pkgs;
            extraSpecialArgs = {
              inherit (inputs) colors;
              inherit inputs lib;
            };
            modules = [./modules];
          })
          neovim
          ;
      };
      formatter = treefmt.wrapper;
      checks = {
        formatting = treefmt.check self;
        lockfile =
          pkgs.runCommandLocal "lockfile-check" {
            src = ./.;
            nativeBuildInputs = [inputs.flint.packages.${system}.default];
          } ''
            find "$src" -type f -name 'flake.lock' \
              | xargs flint --fail-if-multiple-versions --lockfile
            touch "$out"
          '';
      };
    });
}
