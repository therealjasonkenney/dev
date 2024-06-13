if test -e {$ASDF_DIR}/asdf.fish
  source {$ASDF_DIR}/asdf.fish
else
  function asdf
    read -l -n 1 -P "asdf is not installed, would you like to install it? [y/n]> " install_asdf

    # If asdf is not installed AND the user wants to install it, we can just install it.
    if test $install_asdf = "y"
      set --universal --export ASDF_CONFIG_FILE "{$XDG_CONFIG_HOME}/asdf/asdfrc"

      git clone https://github.com/asdf-vm/asdf.git $ASDF_DIR --branch v0.14.0
      and mkdir -p {$XDG_CONFIG_HOME}/fish/completions
      and ln -s {$ASDF_DIR}/completions/asdf.fish {$XDG_CONFIG_HOME}/fish/completions
      and source {$ASDF_DIR}/asdf.fish
    end
  end
end
