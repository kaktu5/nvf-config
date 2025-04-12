{lib, ...}: let
  inherit (lib.kkts) mkLuaExpr;
  border = ["┌" "─" "┐" "│" "┘" "─" "└" "│"];
in {
  vim = {
    utility.oil-nvim = {
      enable = true;
      setupOpts = {
        columns = mkLuaExpr ''
          {
            "permissions",
            "size",
            "mtime",
            { "icon", add_padding = false },
          }
        '';
        skip_confirm_for_simple_edits = true;
        constrain_cursor = "name";
        watch_for_changes = true;
        use_default_keymaps = false;
        keymaps = mkLuaExpr ''
          {
            ["<CR>"] = "actions.select",
            ["<C-p>"] = "actions.preview",
            ["<C-c>"] = { "actions.close", mode = "n" },
            ["-"] = { "actions.parent", mode = "n" },
            ["_"] = { "actions.open_cwd", mode = "n" },
            ["gs"] = { "actions.change_sort", mode = "n" },
            ["gx"] = "actions.open_external",
            ["g."] = { "actions.toggle_hidden", mode = "n" },
          }
        '';
        view_options = {
          show_hidden = true;
          case_insensitive = true;
        };
        confirmation = {inherit border;};
        progress = {inherit border;};
        ssh = {inherit border;};
      };
    };
    maps.normal."<leader>pv".action = ":Oil<CR>";
  };
}
