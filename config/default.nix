{lib, ...}: let
  inherit (lib.kkts) importAll;
in {
  imports = importAll ./.;
}
