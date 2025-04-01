{pkgs, ...}: let
  inherit (pkgs.vimPlugins.nvim-treesitter) builtGrammars;
in {
  vim.treesitter.grammars = with builtGrammars; [
    asm
    ron
    toml
    yuck
  ];
}
