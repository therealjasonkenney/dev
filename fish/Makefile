DEST := $(shell echo $${XDG_CONFIG_HOME:-$HOME/.config}/fish)

SRC_FILES = $(wildcard ./*/*.fish) \
						./config.fish

TGT_FILES = $(patsubst ./%, $(DEST)/%, $(SRC_FILES))

.PHONY: clean install

clean:
	rm -rf $(DEST)

install: $(TGT_FILES)
	fish ./setup.fish

$(DEST)/%.fish: %.fish
	mkdir -p $(@D)
	cp -f $^ $@
	chmod 700 $(@D)
	chmod 600 $@
