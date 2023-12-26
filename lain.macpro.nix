{ config, pkgs, ... }:

let
   repo = builtins.fetchGit {
      url = "git@gitlab.com:kimurae/dev.git";
      ref = "main";
      rev = "c58997e41b9dacb6ce6cf7e79daf5fde0bfbb734";
      name = "kimurae-dev";
    };
in {
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "lain";
  home.homeDirectory = "/Volumes/Navi/Users/lain";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.

  # Most of the settings are in these imports
  # which solve for common complex setups.
  imports = [
    "${repo}/home-manager/home.nix"
    "${repo}/home-manager/starship.nix"
    "${repo}/home-manager/biome.nix"
  ];

  # This could probably go under a 'mac'.nix
  programs.zellij.settings.copy_command = "pbcopy";

  home.file.".config/zellij/layouts/default.kdl".source = "${repo}/zellij/default_layout.kdl";
}
