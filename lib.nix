{lib}: let
  inherit (builtins) readDir;
  inherit (lib) attrNames filter hasPrefix map pipe;
  inherit (lib.nvim.lua) toLuaObject;
in {
  kkts = {
    importAll = path: (pipe path [
      readDir
      attrNames
      (filter (file:
        !(hasPrefix "." file)
        && file != "default.nix"))
      (map (file: /${path}/${file}))
    ]);
    setup = name: expr: ''require("${name}").setup(${toLuaObject expr})'';
  };
}
