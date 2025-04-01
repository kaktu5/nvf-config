{
  lib,
  theme,
  ...
}: let
  inherit (lib.kkts) mkLuaExpr;
  inherit (theme) bg0 blue fg0 lightBlue orange purple red;
in {
  vim = {
    mini.statusline = {
      enable = true;
      setupOpts.content.active = mkLuaExpr ''
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
      MiniStatuslineModeNormal = {fg = bg0;} // {bg = purple;};
      MiniStatuslineModeInsert = {fg = bg0;} // {bg = blue;};
      MiniStatuslineModeVisual = {fg = bg0;} // {bg = lightBlue;};
      MiniStatuslineModeReplace = {fg = bg0;} // {bg = red;};
      MiniStatuslineModeCommand = {fg = bg0;} // {bg = orange;};
      MiniStatuslineModeOther = {fg = bg0;} // {bg = orange;};
      MiniStatuslineInactive = {fg = fg0;} // {bg = bg0;};
      MiniStatuslineInfo = {fg = fg0;} // {bg = bg0;};
    };
  };
}
