{ config, pkgs, ... }:

let 
  repo = builtins.fetchGit {
    url = "https://gitlab.com/kimurae/dev.git";
    ref = "refs/tags/1.0";
    name = "kimurae-dev";
  };
in {

  home.username = "lain";
  home.homeDirectory = "/Users/lain";
 
  home.stateVersion = "23.11"; # Please read the comment before changing.

  imports = [
    "${repo}/home-manager/biome.nix"
    "${repo}/home-manager/starship.nix"
    "${repo}/home-manager/home.nix"
  ];
  
  programs.zellij.settings.copy_command = "pbcopy";

  home.file.".config/zellij/layouts/default.kdl".source = "${repo}/zellij/default_layout.kdl";
}
