
# Only load if its Interactive
status is-interactive; and type -p starship; and begin
    starship init fish | source
end
