{lib, ...}: let
  inherit (lib.nvim.lua) toLuaObject;
in {
  vim.languages = {
    clang.enable = true;
    css = {
      enable = true;
      format.type = "biome";
    };
    # haskell.enable = true;
    html.enable = true;
    lua = {
      enable = true;
      lsp.lazydev.enable = true;
    };
    markdown = {
      enable = true;
      format.type = "prettierd";
    };
    nix = {
      enable = true;
      lsp.server = "nixd";
      extraDiagnostics.enable = false;
    };
    nu.enable = true;
    ocaml.enable = true;
    rust = {
      enable = true;
      crates.enable = true;
      /*
      lsp.opts = toLuaObject {
        rust-analyzer = {
          diagnostics.disabled = ["proc-macro-disabled"];
          procMacro.ignored.bevy_simple_subsecond_system_macros = ["hot"];
        };
      };
      */
    };
    typst = {
      enable = true;
      format.type = "typstyle";
    };
    wgsl.enable = true;
  };
}