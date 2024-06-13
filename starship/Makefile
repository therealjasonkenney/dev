DEST := $(shell echo $${XDG_CONFIG_HOME:-$${HOME}/.config})

.PHONY: clean install

clean:
	rm -f $(DEST)/starship.toml

install: $(DEST)/starship.toml

$(DEST)/starship.toml: ./starship.toml
	mkdir -p $(@D)
	chmod 700 $(@D)
	cp -f $^ $@
	chmod 600 $@
