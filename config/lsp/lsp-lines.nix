{lib, ...}: let
  inherit (lib.nvim.dag) entryAfter;
in {
  vim = {
    lsp.lsplines.enable = true;
    pluginRC.lsplines = entryAfter ["lspconfig"] ''
      require("lsp_lines").setup({
        virtual_lines = {
          only_current_line = true,
          highlight_whole_line = false,
        },
      })
    '';
    maps.normal."<leader>ltl" = {action = ''require("lsp_lines").toggle'';} // {lua = true;};
  };
}
