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
      enableDAP = true;
      enableExtraDiagnostics = true;
      enableFormat = true;
      enableTreesitter = true;
    };
  };
}
