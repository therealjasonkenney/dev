{ config, pkgs, ...}:

{
  # Cat w/ syntax highlighting
  programs.bat.enable = true;

  # System Monitor
  programs.bottom.enable = true;

  # Search Tools
  programs.ripgrep.enable = true;

  # Nerd Fonts
  programs.nerdfonts.enable = true;

  # Editors
  programs.helix.enable = true;
  programs.helix.settings.editor.whitespace.render.tab = "all";
  programs.helix.settings.editor.soft-wrap.enable = true;

  # Multi-plexer
  programs.zellij.enable = true;
};
