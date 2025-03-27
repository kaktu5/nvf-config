{
  theme,
  lib,
  ...
}: let
  inherit (theme) fg0 lightPurple purple;
  inherit (lib.kkts) mkLuaExpr;
  starter = ''require("mini.starter")'';
in {
  mini.starter = {
    enable = true;
    setupOpts = {
      items =
        mkLuaExpr
        # lua
        ''
          {function()
            return function()
              local items = {}

              -- Obsidian actions
              -- local section = "Obsidian action"
              -- table.insert(items, {
              --
              -- })

              local section = "Builtin actions"
              table.insert(items, {
                { name = "Edit new buffer", action = "enew", section = section },
                { name = "Quit Neovim", action = "qall", section = section },
              })

              return items
            end
          end}
        '';
      footer = "";
      content_hooks =
        mkLuaExpr
        # lua
        ''
          {
            ${starter}.gen_hook.adding_bullet("│ "),
            ${starter}.gen_hook.aligning("center", "center")
          }
        '';
    };
  };
  highlight = {
    MiniStarterCurrent.fg = fg0;
    MiniStarterFooter.fg = purple;
    MiniStarterHeader.fg = purple;
    MiniStarterInactive.fg = fg0;
    MiniStarterItem.fg = fg0;
    MiniStarterItemBullet.fg = purple;
    MiniStarterItemPrefix.fg = purple;
    MiniStarterSection.fg = purple;
    MiniStarterQuery.fg = lightPurple;
  };
}
