{pkgs, ...}: {
  vim.extraPlugins = with pkgs; {
    compile-mode.package = kkts.compile-mode;
    vim-easy-align.package = vimPlugins.vim-easy-align;
  };
}