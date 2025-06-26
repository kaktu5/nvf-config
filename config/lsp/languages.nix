_: {
  vim.languages = {
    clang.enable = true;
    css.enable = true;
    html.enable = true;
    lua = {enable = true;} // {lsp.lazydev.enable = true;};
    markdown.enable = true;
    nix = {enable = true;} // {lsp.server = "nixd";};
    nu.enable = true;
    ocaml.enable = true;
    rust = {
      enable = true;
      crates.enable = true;
      lsp.opts = ''
        ["rust-analyzer"] = {
          procMacro = {
            ignored = {
              bevy_simple_subsecond_system_macros = { "hot" },
            },
          },
          diagnostics = {
            disabled = { "proc-macro-disabled" },
          },
        },
      '';
    };
    typst = {enable = true;} // {format.type = "typstyle";};
    wgsl.enable = true;
    zig.enable = true;
  };
}
