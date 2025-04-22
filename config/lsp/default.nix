{lib, ...}: let
  inherit (lib.kkts) importAll;
in {
  imports = importAll ./.;
  vim = {
    lsp.formatOnSave = true;
    languages = {
      enableLSP = true;
      enableFormat = true;
      enableTreesitter = true;
      enableExtraDiagnostics = true;
    };
  };
}
