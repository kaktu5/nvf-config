{lib, ...}: let
  inherit (lib.kkts) importAll;
in {
  imports = importAll ./.;
  vim = {
    lsp = {
      enable = true;
      formatOnSave = true;
    };
    languages = {
      enableFormat = true;
      enableTreesitter = true;
      enableExtraDiagnostics = true;
    };
  };
}
