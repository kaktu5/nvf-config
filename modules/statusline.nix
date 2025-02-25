{
  lib,
  theme,
  ...
}: let
  inherit (lib.kkts) mkHl mkLuaExpr;
  inherit (theme) bg0 blue fg0 lightBlue orange purple red;
in {
  mini.statusline = {
    enable = true;
    setupOpts.content.active =
      mkLuaExpr
      # lua
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
    MiniStatuslineModeNormal = mkHl "#${purple}" "#${bg0}" 0;
    MiniStatuslineModeInsert = mkHl "#${blue}" "#${bg0}" 0;
    MiniStatuslineModeVisual = mkHl "#${lightBlue}" "#${bg0}" 0;
    MiniStatuslineModeReplace = mkHl "#${red}" "#${bg0}" 0;
    MiniStatuslineModeCommand = mkHl "#${orange}" "#${bg0}" 0;
    MiniStatuslineModeOther = mkHl "#${orange}" "#${bg0}" 0;
    MiniStatuslineInactive = mkHl "#${bg0}" "#${fg0}" 0;
    MiniStatuslineInfo = mkHl "#${bg0}" "#${fg0}" 0;
  };
}
