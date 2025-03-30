{theme, ...}: let
  inherit (theme) fg0 fg3 purple;
in {
  telescope = {
    enable = true;
    mappings = {
      buffers = "<leader>pb";
      findFiles = "<leader>pf";
      liveGrep = "<leader>pg";
      open = "<leader>pt";
    };
    setupOpts.defaults = {
      borderchars = ["─" "│" "─" "│" "┌" "┐" "┘" "└"];
      file_ignore_patterns = [
        ".git/"
        ".lock"
        "_build/"
        "result/"
        "target/"
      ];
      prompt_prefix = " ";
      selection_caret = "██";
    };
  };
  highlight = {
    TelescopeTitle.fg = fg0;
    TelescopeBorder.fg = fg3;
    TelescopeNormal.fg = fg0;
    TelescopeMatching = {fg = purple;} // {bold = true;};
    TelescopeMultiIcon.fg = purple;
    TelescopeSelection = {bold = true;} // {reverse = true;};
    TelescopePreviewDate = {bold = true;} // {reverse = true;};
    TelescopePreviewLine = {bold = true;} // {reverse = true;};
    TelescopePreviewLink = {bold = true;} // {reverse = true;};
    TelescopePreviewPipe = {bold = true;} // {reverse = true;};
    TelescopePreviewRead = {bold = true;} // {reverse = true;};
    TelescopePreviewSize = {bold = true;} // {reverse = true;};
    TelescopePreviewUser = {bold = true;} // {reverse = true;};
    TelescopePromptTitle.fg = fg0;
    TelescopePreviewBlock.fg = fg0;
    TelescopePreviewGroup.fg = fg0;
    TelescopePreviewMatch.fg = fg0;
    TelescopePreviewTitle.fg = fg0;
    TelescopePreviewWrite.fg = fg0;
    TelescopePromptBorder.fg = fg3;
    TelescopePromptNormal.fg = fg0;
    TelescopePromptPrefix.fg = purple;
    TelescopePreviewBorder.fg = fg3;
    TelescopePreviewHyphen.fg = fg0;
    TelescopePreviewNormal.fg = fg0;
    TelescopePreviewSocket.fg = fg0;
    TelescopePreviewSticky.fg = fg0;
    TelescopePromptCounter.fg = fg0;
    TelescopeMultiSelection.fg = fg0;
    TelescopePreviewCharDev.fg = fg0;
    TelescopePreviewExecute.fg = fg0;
    TelescopePreviewMessage.fg = fg0;
    TelescopeSelectionCaret.fg = fg0;
    TelescopePreviewDirectory.fg = fg0;
    TelescopePreviewMessageFillchar.fg = fg0;
  };
}
