{ config, pkgs, ... }:


{
  home.packages = with pkgs; [
    biome
  ];

  programs.helix.languages.language = [
    {
      name = "javascript";
      auto-format = true;
      language-servers = ["biome"];
      formatter.command = "biome";
      formatter.args = ["format" "--stdin-file-path" "test.js"];
    }

    {
      name = "typescript";
      auto-format = true;
      language-servers = ["biome"];
      formatter.command = "biome";
      formatter.args = ["format" "--stdin-file-path" "test.ts"];
    }

    {
      name = "jsx";
      auto-format = true;
      language-servers = ["biome"];
      formatter.command = "biome";
      formatter.args = ["format" "--stdin-file-path" "test.jsx"];
    }

    {
      name = "tsx";
      auto-format = true;
      language-servers = ["biome"];
      formatter.command = "biome";
      formatter.args = ["format" "--stdin-file-path" "test.tsx"];
    }

    {
      name = "json";
      auto-format = true;
      formatter.command = "biome";
      formatter.args = ["format" "--stdin-file-path" "test.json"];
    }
  ];
    
  programs.helix.languages.language-server.biome = { command = "biome"; args = ["lsp-proxy"]; };
}

