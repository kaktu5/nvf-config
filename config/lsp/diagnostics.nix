{lib, ...}: let
  inherit (lib.nvim.lua) toLuaObject;
in {
  vim = {
    diagnostics = {
      enable = true;
      config.signs.text = toLuaObject {
        "vim.diagnostic.severity.ERROR" = " ";
        "vim.diagnostic.severity.WARN" = " ";
        "vim.diagnostic.severity.INFO" = " ";
        "vim.diagnostic.severity.HINT" = " ";
      };
    };
    maps.normal."gK" = {
      action = ''
        function()
          local new_config = not vim.diagnostic.config().virtual_lines
          vim.diagnostic.config({ virtual_lines = new_config })
        end
      '';
      lua = true;
    };
  };
}
