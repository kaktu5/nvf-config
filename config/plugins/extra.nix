{
  lib,
  pkgs,
  ...
}: let
  inherit (lib.kkts) setup;
in {
  vim.extraPlugins = with pkgs; {
    compile-mode.package = kkts.compile-mode;
    indent-blankline-nvim = {
      package = vimPlugins.indent-blankline-nvim;
      setup = setup "ibl" {scope.enabled = false;};
    };
    vim-easy-align.package = vimPlugins.vim-easy-align;
  };
}
