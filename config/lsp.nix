{pkgs, ...}: {
  lsp = {
    formatOnSave = true;
    lsplines.enable = true;
  };
  autocomplete.blink-cmp = {
    enable = true;
    setupOpts.completion.menu.auto_show = false;
    mappings = {
      complete = null;
      close = "<C-e>";
      confirm = "<C-y>";
      next = "<C-n>";
      previous = "<C-p>";
      scrollDocsDown = "<C-f>";
      scrollDocsUp = "<C-d>";
    };
  };
  visuals.fidget-nvim = {
    enable = true;
    setupOpts.notification.window.winblend = 0;
  };
  languages = {
    enableLSP = true;
    enableFormat = true;
    enableTreesitter = true;
    enableExtraDiagnostics = true;
    bash.enable = true;
    clang.enable = true;
    css.enable = true;
    haskell.enable = true;
    html.enable = true;
    lua = {enable = true;} // {lsp.lazydev.enable = true;};
    markdown.enable = true;
    nix = {enable = true;} // {lsp.server = "nixd";};
    nu.enable = true;
    ocaml.enable = true;
    rust = {enable = true;} // {crates.enable = true;};
    sql.enable = true;
    ts.enable = true;
    wgsl.enable = true;
    zig.enable = true;
  };
  treesitter.grammars = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
    asm
    hyprlang
    ron
    toml
    yuck
  ];
}
