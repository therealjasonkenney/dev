{ config, pkgs, ... }:

{
  home.packages = with pkgs.nodePackages; [
    prettier
  ];

  programs.helix.languages.language = [
     {
      name = "javascript";
      auto-format = true;
      formatter.command = "prettier";
      formatter.args = ["--prettier" "javascript"];
    }
    {
      name = "jsx";
      auto-format = true;
      formatter.command = "prettier";
      formatter.args = ["--prettier" "javascript"];
    }
    {
      name = "typescript";
      auto-format = true;
      formatter.command = "prettier";
      formatter.args = ["--prettier" "typescript"];
    }
    {
      name = "tsx";
      auto-format = true;
      formatter.command = "prettier";
      formatter.args = ["--prettier" "typescript"];
    }
    {
      name = "json";
      formatter.command = "prettier";
      formatter.args = ["--parser" "json"];
    }
    {
      name = "css";
      formatter.command = "prettier";
      formatter.args = ["--parser" "css"];
    }
    {
      name = "html";
      auto-format = true;
      formatter.command = "prettier";
      formatter.args = ["--parser" "html"];
    }
  ];
}

