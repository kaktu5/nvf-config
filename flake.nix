{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils = {
      url = "github:numtide/flake-utils";
      inputs.systems.follows = "systems";
    };
    nvf = {
      url = "github:notashelf/nvf";
      inputs = {
        flake-utils.follows = "flake-utils";
        nixpkgs.follows = "nixpkgs";
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
        // import ./lib.nix {inherit (inputs.nixpkgs) lib;};
      pkgs = inputs.nixpkgs.legacyPackages.${system};
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
