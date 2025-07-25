{
  colors,
  lib,
  ...
}: let
  inherit (lib.nvim.dag) entryBefore;
  inherit (lib.nvim.lua) toLuaObject;
in {
  vim = {
    luaConfigRC.colorcolumn = ''vim.o.colorcolumn = "120"'';
    visuals.indent-blankline = {
      enable = true;
      setupOpts = {
        indent.highlight = "IndentBlankline";
        scope.enabled = false;
      };
    };
    highlight.ColorColumn.bg = colors.bg1;
    luaConfigRC.IndentBlankline = entryBefore ["indent-blankline"] ''
      vim.api.nvim_set_hl(0, "IndentBlankline", ${toLuaObject {fg = colors.bg1;}})
    '';
  };
}