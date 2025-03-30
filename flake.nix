{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    alejandra = {
      url = "github:kaktu5/alejandra";
      inputs.nixpkgs.follows = "nixpkgs";
    };
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
      lib = inputs.nixpkgs.lib // inputs.nvf.lib // import ./lib.nix;
      # pkgs = inputs.nixpkgs.legacyPackages.${system};
      pkgs = import inputs.nixpkgs {
        inherit system;
        overlays = lib.singleton (_: _: {
          alejandra = inputs.alejandra.packages.${system}.default.overrideAttrs (_: {
            doCheck = false;
          });
        });
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
            extraSpecialArgs = {inherit lib;};
            modules = [./config];
          })
          neovim
          ;
      };
      formatter = treefmt.wrapper;
      checks.formatting = treefmt.check self;
    });
}
