_: {
  vim.languages = {
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
    typst = {enable = true;} // {format.type = "typstyle";};
    wgsl.enable = true;
    zig.enable = true;
  };
}
