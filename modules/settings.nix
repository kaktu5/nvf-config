_: {
  enableLuaLoader = true;
  options = {
    tabstop = 2;
    softtabstop = 2;
    shiftwidth = 2;
    expandtab = true;
    smartindent = true;
    wrap = false;
    list = true;
    scrolloff = 8;
    incsearch = true;
    hlsearch = false;
    swapfile = false;
    backup = false;
    undofile = true;
    termguicolors = true;
    updatetime = 50;
  };
  luaConfigPost =
    # lua
    ''vim.opt.undodir = os.getenv("HOME") .. "/.local/share/nvf/undodir"'';
}
