# For systems that lack utf8 support.

{ config, pkgs, ...}: {
  home.sessionVariables.LANGUAGE = "en_US.UTF-8";
  home.sessionVariables.LC_ALL = "en_US.UTF-8";
  home.sessioNVariables.LC_TYPE = "en_US.UTF-8";

  programs.glibLocales.enable = true;
};
  
