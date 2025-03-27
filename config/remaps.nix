_: {
  maps = {
    normal = {
      "Q".action = "<nop>";
      "<leader>pv" = {action = "vim.cmd.Ex";} // {lua = true;};
      "J".action = "mzJ`z";
      "y".action = "\"+y";
      "Y".action = "\"+Y";
      "<leader>r" = {action = ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>";} // {silent = false;};
      "<leader>x".action = ":!chmod +x %<CR>";
      "<leader>cd".action = ":cd %:p:h<CR>";
    };
    visual = {
      "J".action = ":m '>+1<CR>gv=gv";
      "K".action = ":m '<-2<CR>gv=gv";
      "y".action = "\"+y";
    };
    visualOnly."<leader>p".action = "\"_dP";
  };
}
