_: {
  vim.maps = {
    normal = {
      "Q".action = "<nop>";
      "J".action = "mzJ`z";
      "<leader>r" = {action = ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>";} // {silent = false;};
      "<leader>x".action = ":!chmod +x %<CR>";
      "<leader>cd".action = ":cd %:p:h<CR>";
      "\\".action = ":noh<CR>";
    };
    visual = {
      "J".action = ":m '>+1<CR>gv=gv";
      "K".action = ":m '<-2<CR>gv=gv";
      "y".action = "\"+y";
    };
    visualOnly."<leader>p".action = "\"_dP";
  };
}
