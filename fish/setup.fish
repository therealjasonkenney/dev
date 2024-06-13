# This file is used to setup fish universal env vars.

set -l REPO_LOC (realpath (dirname (status --current-filename))"/../")

# Setup ASDF and XDG
switch (uname) 
    case Darwin
      set --universal --export ASDF_DIR {$HOME}/Library/ASDF
      set --universal --export ASDF_DATA_DIR {$HOME}/Library/ASDF
      set --universal --export XDG_CACHE_HOME {$HOME}/Library/Cache
      set --universal --export XDG_CONFIG_HOME {$HOME}/Library/Preferences
      set --universal --export XDG_DATA_HOME {$HOME}/Library/Application\ Support
      set --universal --export XDG_STATE_HOME {$HOME}/Library/State
      set --universal --export XDG_DATA_DIRS /usr/local/share:/usr/share:(brew --prefix)/share
      set --universal --export XDG_CONFIG_DIRS /etc/xdg

    case '*'
      set --universal --export ASDF_DIR {$HOME}/.asdf
      set --universal --export XDG_CACHE_HOME {$HOME}/.cache
      set --universal --export XDG_CONFIG_HOME {$HOME}/.config
      set --universal --export XDG_DATA_HOME {$HOME}/.local/share
      set --universal --export XDG_STATE_HOME {$HOME}/.local/state
      set --universal --export XDG_DATA_DIRS /usr/local/share:/usr/share
      set --universal --export XDG_CONFIG_DIRS /etc/xdg
end

# Setup Default colors
set --universal fish_color_autosuggestion 555\x1ebrblack
set --universal fish_color_cancel \x2dr
set --universal fish_color_command blue
set --universal fish_color_comment red
set --universal fish_color_cwd green
set --universal fish_color_cwd_root red
set --universal fish_color_end green
set --universal fish_color_error brred
set --universal fish_color_escape brcyan
set --universal fish_color_history_current \x2d\x2dbold
set --universal fish_color_host normal
set --universal fish_color_host_remote yellow
set --universal fish_color_normal normal
set --universal fish_color_operator brcyan
set --universal fish_color_param cyan
set --universal fish_color_quote yellow
set --universal fish_color_redirection cyan\x1e\x2d\x2dbold
set --universal fish_color_search_match bryellow\x1e\x2d\x2dbackground\x3dbrblack
set --universal fish_color_selection white\x1e\x2d\x2dbold\x1e\x2d\x2dbackground\x3dbrblack
set --universal fish_color_status red
set --universal fish_color_user brgreen
set --universal fish_color_valid_path \x2d\x2dunderline
set --universal fish_key_bindings fish_default_key_bindings
set --universal fish_pager_color_completion normal
set --universal fish_pager_color_description B3A06D\x1eyellow\x1e\x2di
set --universal fish_pager_color_prefix normal\x1e\x2d\x2dbold\x1e\x2d\x2dunderline
set --universal fish_pager_color_progress brwhite\x1e\x2d\x2dbackground\x3dcyan
set --universal fish_pager_color_selected_background \x2dr

# Setup Editor
set --universal --export EDITOR (type -p nvim)

# Setup skim
set --universal --export SKIM_DEFAULT_COMMAND "fd --type f || git ls-tree -r --name-only HEAD || rg --files || find ."

# Setup Starship
set --universal --export STARSHIP_CONFIG {$XDG_CONFIG_HOME}/starship.toml
