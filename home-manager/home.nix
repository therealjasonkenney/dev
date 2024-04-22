{ config, pkgs, ...}:

let
  nixvim = import (builtins.fetchGit {
    url = "https://github.com/nix-community/nixvim";
    rev = "9a24838aac6b55a865dd30f1b5885ac4f62c78e1";
  });
in {

  imports = [
    nixvim.homeManagerModules.nixvim
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
  programs.alacritty.enable = true;
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

  programs.home-manager.enable = true;
}
