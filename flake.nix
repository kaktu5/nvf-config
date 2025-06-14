{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixexprs = {
      url = "github:kaktu5/nixexprs";
      inputs = {
        flake-utils.follows = "flake-utils";
        nixpkgs.follows = "nixpkgs";
        treefmt-nix.follows = "treefmt-nix";
      };
    };
    flake-utils = {
      url = "github:numtide/flake-utils";
      inputs.systems.follows = "systems";
    };
    nvf = {
      url = "github:notashelf/nvf";
      inputs = {
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
        // import ./lib.nix {
          lib = inputs.nixpkgs.lib // inputs.nvf.lib;
        };
      pkgs = import inputs.nixpkgs {
        inherit system;
        overlays = [inputs.nixexprs.overlays.default];
      };
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
              inherit lib;
              theme = import ./theme.nix;
            };
            modules = [./config];
          })
          neovim
          ;
      };
      formatter = treefmt.wrapper;
      checks.formatting = treefmt.check self;
    });
}
