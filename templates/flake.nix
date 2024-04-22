{
  description = "Home Manager configuration of Kimurae";

  inputs = {
    kimurae-dev = {
      url = "git@gitlab.com:kimurae/dev.git";
      ref = "main";
      rev = "c58997e41b9dacb6ce6cf7e79daf5fde0bfbb734";
      name = "kimurae-dev";
    }
  };

  outputs = { kimurae-dev, ... } @inputs: { inherit kimurae-dev; };
}
