{ config, pkgs, ... } : {

  let
    cfgFor = {n}: {
      name = n;
      formatter = { command = "dprint"; args = ["fmt" "--stdin" n] };
      auto-format = "true";
    };
  in
  {
    programs.helix.languages = [
      (cfgFor "javascript")
      (cfgFor "json")
      (cfgFor "jsx")
      (cfgFor "typescript")
      (cfgFor "tsx")
    ]; 
  };

  home.packages = [
    pkgs.dprint
  ];
};
