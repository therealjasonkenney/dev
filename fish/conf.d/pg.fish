
# MacOS Postgres.app - fish_add_path ignores directories that do 
# not exist.
# Needed so pg_config is in our $PATH for gem installs/etc.
fish_add_path --path /Applications/Postgres.app/Contents/Versions/latest/bin 
