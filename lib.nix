{
  kkts = {
    mkHl = bg: fg: blend: {inherit bg fg blend;};
    mkLuaExpr = expr: {_type = "lua-inline";} // {inherit expr;};
  };
}
