{
  lib,
  pkgs,
  ...
}: let
  inherit (lib) concatStringsSep;
  inherit (lib.kkts) setup;
in {
  vim.extraPlugins.vague-nvim = {
    package = pkgs.kkts.vague-nvim;
    setup = concatStringsSep "\n" [
      (setup "vague" {transparent = true;})
      "vim.cmd.colorscheme \"vague\""
    ];
  };
}
