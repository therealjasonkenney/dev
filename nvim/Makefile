DEST := $(shell echo $${XDG_CONFIG_HOME:-$${HOME}/.config}/nvim)

SRC_FILES = $(wildcard ./lua/plugins/*.lua) \
						$(wildcard ./lua/plugins/*/*.lua) \
						./lua/keybinds.lua \
						./init.lua

TGT_FILES = $(patsubst ./%, $(DEST)/%, $(SRC_FILES))

.PHONY: clean install

clean:
	rm -rf $(DEST)

install: $(TGT_FILES)

$(DEST)/%.lua: %.lua
	mkdir -p $(@D)
	cp -f $^ $@
	chmod 700 $(@D)
	chmod 600 $@
