function githash
    git log | head -1 | cut -d' ' -f2
end
