{
  inputs = {
    nixexprs.url = "github:kaktu5/nixexprs";
    nvf.url = "github:notashelf/nvf";
  };
  outputs = {
    self,
    nixexprs,
    nvf,
  }: let
    inherit (nvf.inputs) nixpkgs;
    lib = nixpkgs.lib.fix (self: nixpkgs.lib // nvf.lib // import ./lib.nix {lib = self;});
    forEachSystem = systems: f: let
      systemOutputs = lib.genAttrs systems f;
      outputNames = lib.attrValues systemOutputs |> lib.head |> lib.attrNames;
    in
      lib.genAttrs outputNames (outputName:
        lib.mapAttrs (_: attrs: attrs.${outputName}) systemOutputs);
  in
    forEachSystem [
      "aarch64-darwin"
      "aarch64-linux"
      "x86_64-darwin"
      "x86_64-linux"
    ] (system: let
      pkgs = import nixpkgs {
        inherit system;
        overlays = [nixexprs.overlays.default];
      };
    in {
      packages = {
        default = self.packages.${system}.neovim;
        inherit
          (lib.neovimConfiguration {
            inherit pkgs;
            extraSpecialArgs = {
              inherit lib;
              colors = import ./colors.nix;
            };
            modules = [./config];
          })
          neovim
          ;
      };
      formatter = pkgs.alejandra;
    });
}
