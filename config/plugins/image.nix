{pkgs, ...}: {
  vim = {
    extraPlugins.image-nvim = {
      package = pkgs.vimPlugins.image-nvim;
      setup = ''
        require("image").setup({
          max_height_window_percentage = 25,
          tmux_show_only_in_active_window = true
        })
      '';
    };
    extraPackages = with pkgs; [imagemagick luajitPackages.magick];
  };
}
