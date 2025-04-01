{lib}: let
  inherit (builtins) readDir;
  inherit (lib) attrNames filter hasPrefix map pipe;
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
    mkLuaExpr = expr: {_type = "lua-inline";} // {inherit expr;};
  };
}
