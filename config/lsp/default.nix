{lib, ...}: let
  inherit (lib.kkts) importAll;
in {
  imports = importAll ./.;
  vim = {
    lsp = {
      formatOnSave = true;
      inlayHints.enable = true;
    };
    languages = {
      enableLSP = true;
      enableFormat = true;
      enableTreesitter = true;
      enableExtraDiagnostics = true;
      bash.enable = true;
      clang.enable = true;
      css.enable = true;
      haskell.enable = true;
      html.enable = true;
      lua = {enable = true;} // {lsp.lazydev.enable = true;};
      markdown.enable = true;
      nix = {enable = true;} // {lsp.server = "nixd";};
      nu.enable = true;
      ocaml.enable = true;
      rust = {enable = true;} // {crates.enable = true;};
      sql.enable = true;
      ts.enable = true;
      wgsl.enable = true;
      zig.enable = true;
    };
  };
}
