{
  lib,
  theme,
  ...
}: let
  inherit (lib.kkts) mkLuaExpr;
  inherit (theme) bg0 blue fg0 lightBlue orange purple red;
in {
  mini.statusline = {
    enable = true;
    setupOpts.content.active =
      mkLuaExpr
      /*lua*/
      ''
        function()
          local statusline = require("mini.statusline")

          local mode, mode_hl = statusline.section_mode({ trunc_width = 120 })
          local git = statusline.section_git({ trunc_width = 40 })
          local diff = statusline.section_diff({ trunc_width = 60 })
          local diagnostics = statusline.section_diagnostics({ trunc_width = 75 })
          local filename = statusline.section_filename({ trunc_width = 140 })
          local location = function()
            return "%l:%v"
          end
          local search = statusline.section_searchcount({ trunc_width = 75 })

          return statusline.combine_groups({
            { hl = mode_hl, strings = { mode } },
            '%<',
            { hl = 'MiniStatuslineInfo', strings = { filename, git, diff } },
            '%=',
            { hl = 'MiniStatuslineInfo', strings = { diagnostics } },
            { hl = mode_hl, strings = { search, location() } },
          })
        end
      '';
  };
  highlight = {
    MiniStatuslineModeNormal = {bg = purple;} // {fg = bg0;};
    MiniStatuslineModeInsert = {bg = blue;} // {fg = bg0;};
    MiniStatuslineModeVisual = {bg = lightBlue;} // {fg = bg0;};
    MiniStatuslineModeReplace = {bg = red;} // {fg = bg0;};
    MiniStatuslineModeCommand = {bg = orange;} // {fg = bg0;};
    MiniStatuslineModeOther = {bg = orange;} // {fg = bg0;};
    MiniStatuslineInactive = {bg = bg0;} // {fg = fg0;};
    MiniStatuslineInfo = {bg = bg0;} // {fg = fg0;};
  };
}
