_: {
  vim = {
    enableLuaLoader = true;
    clipboard = {
      providers.wl-copy.enable = true;
      registers = "unnamedplus";
    };
    options = {
      tabstop = 2;
      softtabstop = 2;
      shiftwidth = 2;
      expandtab = true;
      smartindent = true;
      wrap = false;
      list = true;
      scrolloff = 8;
      sidescrolloff = 8;
      incsearch = true;
      swapfile = false;
      backup = false;
      undofile = true;
      termguicolors = true;
      updatetime = 50;
      shm = "I";
    };
  };
}
