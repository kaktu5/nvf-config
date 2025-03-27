{theme, ...}: let
  inherit (theme) fg0 fg3 purple;
in {
  telescope = {
    enable = true;
    mappings = {
      open = "<leader>pt";
      findFiles = "<leader>pf";
      liveGrep = "<leader>pg";
    };
    setupOpts.defaults = {
      borderchars = ["─" "│" "─" "│" "┌" "┐" "┘" "└"];
      file_ignore_patterns = [
        ".git/"
        ".lock"
        "build/"
        "dist/"
        "node_modules"
        "result/"
        "target/"
      ];
      prompt_prefix = " ";
      selection_caret = "▌ ";
    };
  };
  highlight = {
    TelescopeTitle.fg = fg0;
    TelescopeBorder.fg = fg3;
    TelescopeNormal.fg = fg0;
    TelescopeMatching.fg = purple;
    TelescopeMultiIcon.fg = purple;
    TelescopeSelection.fg = purple;
    TelescopePreviewDate.fg = fg0;
    TelescopePreviewLine.fg = fg0;
    TelescopePreviewLink.fg = fg0;
    TelescopePreviewPipe.fg = fg0;
    TelescopePreviewRead.fg = fg0;
    TelescopePreviewSize.fg = fg0;
    TelescopePreviewUser.fg = fg0;
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
    TelescopeSelectionCaret.fg = purple;
    TelescopePreviewDirectory.fg = fg0;
    TelescopePreviewMessageFillchar.fg = fg0;
  };
}
