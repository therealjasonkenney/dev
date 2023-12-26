{ config, pkgs, ...}:

{
  # Git
  programs.git.enable = true;
  programs.git.userName = "Kimuræ";
  programs.git.userEmail = "4012309-kimurae@users.noreply.gitlab.com";

  # Cat w/ syntax highlighting
  programs.bat.enable = true;

  # System Monitor
  programs.bottom.enable = true;

  # Search Tools
  programs.ripgrep.enable = true;
  programs.skim.enable = true;

  # Shell 
  programs.fish.enable = true;
  programs.fish.functions.lk = "rg --files $argv | sk --preview=\"bat {} --color always\"";
  
  # Editors
  programs.helix.enable = true;
  programs.helix.settings.editor.whitespace.render.tab = "all";
  programs.helix.settings.editor.soft-wrap.enable = true;
  home.sessionVariables.EDITOR = "hx";

  # Multi-plexer
  programs.zellij.enable = true;
  programs.zellij.settings.default_shell = "fish";

  programs.home-manager.enable = true;
}
