_: {
  vim = {
    git = {
      gitsigns.enable = true;
      vim-fugitive.enable = true;
    };
    maps.normal = {
      "<leader>ga".action = ":Git add %<CR>";
      "<leader>gc".action = ":Git commit<CR>";
      "<leader>gs".action = ":Git<CR>";
    };
  };
}
