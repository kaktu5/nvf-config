{
  lib,
  pkgs,
  ...
}: let
  inherit (lib.kkts) importAll;
in {
  imports = importAll ./.;
  vim = {
    mini = {
      comment.enable = true;
      splitjoin.enable = true;
      surround.enable = true;
      trailspace.enable = true;
    };
    utility.surround = {
      enable = true;
      useVendoredKeybindings = false;
    };
    visuals = {
      highlight-undo.enable = true;
      nvim-web-devicons.enable = true;
    };
    extraPlugins = with pkgs.vimPlugins; {
      undotree.package = undotree;
      vim-smoothie.package = vim-smoothie;
      vim-sort-motion.package = vim-sort-motion;
      vim-startuptime.package = vim-startuptime;
      vim-tmux-navigator.package = vim-tmux-navigator;
    };
    maps.normal."<leader>u" = {
      lua = true;
      action = "vim.cmd.UndotreeToggle";
    };
  };
}
