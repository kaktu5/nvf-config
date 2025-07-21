{lib}: let
  inherit (builtins) readDir;
  inherit (lib) attrNames filter hasPrefix map;
  inherit (lib.nvim.lua) toLuaObject;
in {
  kkts = {
    importAll = path:
      readDir path
      |> attrNames
      |> filter (file:
        !(hasPrefix "." file)
        && file != "default.nix")
      |> map (file: /${path}/${file});

    setup = name: expr: ''require("${name}").setup(${toLuaObject expr})'';
  };
}
