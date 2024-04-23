{ config, pkgs, ...}:

{
  programs.alacritty.enable = true;

  programs.alacritty.settings = {
    font.size = 32.0;
    window.option_as_alt = "Both";
    window.startup_mode = "Fullscreen";
    selection.save_to_clipboard = true;
  };
}
 
