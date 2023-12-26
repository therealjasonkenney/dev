{ config, pkgs, ... }:

{
  home.packages = [
    nodePackages.emmet-ls
    nodePackages.prettier
    nodePackages.typescript-language-server
    nodePackages.vscode-langservers-extracted
  ];

  let
    pretty = {p}: {
      command = "prettier"; args = ["--parser" p];
    };
    lsps = [ "typescript-language-server", "eslint", "emmet-ls" ];
  in {
    programs.helix.languages.language = [
      { name = "jsx"; language-servers = lsps; auto-format = true; formatter = pretty("javascript"); }
      { name = "tsx"; language-servers = lsps; auto-format = true; formatter = pretty("typescript"); }
      { name = "javascript"; language-servers = lsps; auto-format = true; formatter = pretty("javascript");  }
      { name = "typescript"; language-servers = lsps; auto-format = true; formatter = pretty("typescript"); }
      { name = "json"; auto-format = true; formatter = pretty("json"); }
      {
        name = "css";
         language-servers = ["vscode-css-language-server" "emmet-ls"];
         auto-format = true;
         formatter = pretty("css");
      }
      {
        name = "html";
        language-servers = ["vscode-html-language-server", "emmet-ls"];
        auto-format = true;
        formatter = pretty("html");
      }
    ];
  };

  programs.helix.languages.language-server = {
    emmet-ls = { 
      command = "emmet-ls";
      args = ["--stdio"];
    };

    eslint = {
      command = "vscode-eslint-language-server";
      args = ["--stdio"];
      config = {
        codeActionsOnSave = { mode = "all"; source.fixall.eslint = true };
        format = { enable = true; };
        nodePath = "";
        quiet = false;
        rulesCustomizations = [];
        run = "onType";
        validate = "on";
        experimental = {};
        problems = { shortenToSingleLine = false };
        
        codeAction = {
          disableRuleComment = { enable = true; location = "seperateline"; };
          showDocumentation = { enable = false; };
        };
      };
    };
    vscode-json-language-server.config = {
      json = {
        validate = { enable = true; format = { enable = true; }};
      };

      providerFormatter = true;
    };
  };
};

