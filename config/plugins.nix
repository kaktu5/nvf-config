{pkgs, ...}: {
  mini = {
    comment.enable = true;
    pairs.enable = true;
    splitjoin.enable = true;
    surround.enable = true;
    trailspace.enable = true;
  };
  visuals = {
    highlight-undo.enable = true;
    nvim-cursorline.enable = true;
    nvim-web-devicons.enable = true;
  };
  extraPlugins = with pkgs.vimPlugins; {
    image-nvim = {
      package = image-nvim;
      setup = /*lua*/ ''
        require("image").setup({
          max_height_window_percentage = 25,
          tmux_show_only_in_active_window = true
        })
      '';
    };
    undotree.package = undotree;
    vim-smoothie.package = vim-smoothie;
    vim-sort-motion.package = vim-sort-motion;
    vim-startuptime.package = vim-startuptime;
    vim-tmux-navigator.package = vim-tmux-navigator;
  };
  extraPackages = with pkgs; [imagemagick luajitPackages.magick];
  maps.normal."<leader>u" = {
    lua = true;
    action = "vim.cmd.UndotreeToggle";
  };
}
