DEST := $(shell echo $${XDG_CONFIG_HOME:-$${HOME}/.config}/alacritty)

.PHONY: clean config_mac install

clean:
	@rm -rf $(DEST)

install: $(DEST)/alacritty.toml config_mac

$(DEST)/alacritty.toml: ./alacritty.toml
	@mkdir -p $(@D)
	@chmod 700 $(@D)
	@cp -f $^ $@
	@chmod 600 $@

# On MacOS, Alacritty needs the XDG_CONFIG_HOME set
# via launchctl so its available to it.
config_mac:
	@command -v launchctl > /dev/null && \
		launchctl setenv XDG_CONFIG_HOME $$XDG_CONFIG_HOME
