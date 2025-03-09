{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (lib) foldl recursiveUpdate;
  config' = config.vim;
  theme = import ../theme.nix;
in {
  vim =
    foldl (acc: file:
      recursiveUpdate acc (import file {
        inherit config' lib pkgs theme;
      }))
    {} [
      ./git.nix
      ./lsp.nix
      ./plugins.nix
      ./remaps.nix
      ./settings.nix
      ./startbuf.nix
      ./statusline.nix
      ./telescope.nix
      ./theme.nix
    ];
}
