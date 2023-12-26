{ config, pkgs, ...}:

{

  programs.bash.initExtra = ''
    eval "$(starship init bash)"
  '';

  programs.ion.initExtra = ''
    eval $(starship init ion)
  '';

  programs.fish.interactiveShellInit  = ''
    starship init fish | source
  '';

  programs.zsh.initExtra = ''
    eval "$(starship init zsh)"
  '';

  # Prompt
  programs.starship = {
    enable = true;
    settings = {
      format = "\\[$username$hostname|$time|$git_branch$git_commit$git_status\\] $directory\n$character";
      directory.style = "'fg:#e3e5e5 bg:#769ff0'";
      directory.format = "[$path]($style)";
      directory.truncation_length = 3;
      directory.truncation_symbol = "…/";
      git_branch.symbol = "";
      git_branch.format = "$symbol$branch";
      git_commit.format = "\\($hash$tag\\)";
      git_commit.only_detached = false;
      git_commit.tag_symbol = " tag ";
      git_status.style = "bg:#394260";
      git_status.format = "[[($all_status$ahead_behind)](fg:#769ff0 bg:#394260)]($style)";
      git_status.ahead = ">";
      git_status.behind = "<";
      git_status.diverged = "<>";
      git_status.renamed = "r";
      git_status.deleted = "x";
      hostname.format = "@$hostname";
      time.disabled = false;
      time.format = "[$time]($style)";
      time.style = "fg:#e3e5e5 bg:#769ff0";
      username.format = "[$user]($style)";
      username.show_always = true;
    };
  };
}
