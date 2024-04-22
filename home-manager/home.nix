{ config, pkgs, ...}:

{

  home.stateVersion = "23.11";

  imports = [
    ./alacritty.nix
    ./starship.nix
  ];

  # Git
  programs.git.enable = true;
  programs.git.userName = "Kimuræ";
  programs.git.userEmail = "4012309-kimurae@users.noreply.gitlab.com";

  # Cat w/ syntax highlighting
  programs.bat.enable = true;

  # Search Tools
  programs.ripgrep.enable = true;
  programs.skim.enable = true;

  # Shell 
  programs.fish.enable = true;
  programs.fish.functions.lk = "rg --files $argv | sk --preview=\"bat {} --color always\"";

  # Editors
  programs.nixvim = {
    enable = true;
    plugins.lualine.enable = true;
    plugins.rustaceanvim.enable = true;
    colorschemes.gruvbox.enable = true;
  };
 
  home.sessionVariables.EDITOR = "nvim";
 
  # Multi-plexer
  programs.zellij.enable = true;
  programs.zellij.settings.default_shell = "fish";
  home.file.".config/zellij/layouts/default.kdl".source = ../zellij/default_layout.kdl;

  programs.home-manager.enable = true;
}
