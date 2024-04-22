{
  description = "Dev toolbox setup.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixpkgs-unstable";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    utils.url = "github:numtide/flake-utils";

    nixvim.url = "github:nix-community/nixvim";
    nixvim.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs @ { home-manager, nixpkgs, nixvim, utils, ...}: 
  let
    pkgsForSystem = system: import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };

    mkHomeConfig = {system, homeDirectory, username ? "lain"}: home-manager.lib.homeManagerConfiguration( rec {
      modules = [
        {
          home = {
            username = username;
            homeDirectory = homeDirectory;
          };
        }
        nixvim.homeManagerModules.nixvim
        (import ./home-manager/home.nix)
      ];
      pkgs = pkgsForSystem system;
    });
        

  in utils.lib.eachSystem [ "x86_64-darwin" "aarch64-darwin" ] (system: rec {
    legacyPackages = pkgsForSystem system;
  }) // {
    templates.default = {
      path = "./templates";
      description = "Dev toolbox setup";
      welcomeText = ''
        Make sure to copy this file to $HOME/.config/home-manager/flake.nix
      '';
    };

    homeConfigurations."lain@catbox" = mkHomeConfig { system = "x86_64-darwin"; homeDirectory = "/Volumes/Navi/Users/lain"; };
    homeConfigurations."lain@air" = mkHomeConfig { system = "aarch64-darwin"; homeDirectory = "/Users/lain"; }; 

    inherit home-manager;
    inherit (home-manager) packages;
  }; 
}
