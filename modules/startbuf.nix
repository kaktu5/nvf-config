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
            -- Recent files
            local action = function(path)
              return function()
                if type(path) ~= "string" then return end
                local buf_id = vim.fn.bufadd(vim.fn.fnamemodify(path, ":."))
                pcall(vim.api.nvim_win_set_buf, 0, buf_id)
                vim.bo[buf_id].buflisted = true
                return buf_id
              end
            end

            local show_path = function(path)
              return string.format(" (%s)", vim.fn.fnamemodify(path, ":~:."))
            end

            local truncate_path = function(path)
              if #path <= 40 then return path end
              local parts = {}
              for part in path:gmatch("([^/]+)") do
                table.insert(parts, part)
              end
              if #parts == 1 then return path:sub(1, 40) end
              return parts[#parts - 1] .. '/' .. parts[#parts]
            end

            return function()
              local section = string.format("Recent files (current directory)")

              local files = vim.tbl_filter(
                function(f)
                  return vim.fn.filereadable(f) == 1 and f:find(
                    "^" .. vim.pesc(vim.fn.getcwd()) .. "/"
                  ) ~= nil
                end,
                vim.v.oldfiles or {}
              )

              if #files == 0 then
                return {{
                  name = "There are no recent files in current directory",
                  action = "",
                  section = section
                }}
              end

              local items = {}
              for _, file in ipairs(vim.list_slice(files, 1, 8)) do
                local name = string.format(
                  "%s (%s)",
                  vim.fn.fnamemodify(file, ":t"),
                  truncate_path(vim.fn.fnamemodify(file, ":~:."))
                )
                table.insert(items, {
                  name = name,
                  section = section,
                  action = action(file)
                })
              end

              -- Obsidian actions
              -- local section = "Obsidian action"
              -- table.insert(items, {
              --
              -- })

              -- Builtin actions
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
    MiniStarterCurrent.fg = "#${fg0}";
    MiniStarterFooter.fg = "#${purple}";
    MiniStarterHeader.fg = "#${purple}";
    MiniStarterInactive.fg = "#${fg0}";
    MiniStarterItem.fg = "#${fg0}";
    MiniStarterItemBullet.fg = "#${purple}";
    MiniStarterItemPrefix.fg = "#${purple}";
    MiniStarterSection.fg = "#${purple}";
    MiniStarterQuery.fg = "#${lightPurple}";
  };
}
