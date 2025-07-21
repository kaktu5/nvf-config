{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (config.vim) highlight;
  inherit (lib) concatLines concatStringsSep mapAttrsToList mkForce;
  inherit (lib.kkts) setup;
  inherit (lib.nvim.dag) entryAfter;
  inherit (lib.nvim.lua) toLuaObject;
in {
  vim = {
    extraPlugins.vague-nvim = {
      package = pkgs.kkts.vague-nvim;
      setup = concatStringsSep "\n" [
        (setup "vague" {
          transparent = true;
          bold = false;
          style = {
            boolean = "italic";
            keywords = "italic";
          };
        })
        ''vim.cmd.colorscheme "vague"''
      ];
    };
    luaConfigRC.highlight = mkForce (let
      highlights =
        mapAttrsToList (
          name: value: ''vim.api.nvim_set_hl(0, ${toLuaObject name}, ${toLuaObject value})''
        )
        highlight;
    in
      entryAfter ["vague-nvim"] (concatLines highlights));
  };
}
