DEST := $(shell echo $${XDG_CONFIG_HOME:-$HOME/.config}/zellij)

.PHONY: clean install

clean:
	@rm -rf $(DEST)

install: ./config.kdl $(wildcard ./layouts/*.kdl)

$(DEST)/%.kdl: %.kdl
	mkdir -p $(@D)
	chmod 700 $(@D)
	cp -fv $^ $@
	chmod 600 $@
