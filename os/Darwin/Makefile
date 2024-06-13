XDG_ENV_SCRIPT := $(HOME)/Library/Preferences/xdg.env.sh
HOMEBREW_URL := https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh

SOURCE_XDG := source "$(XDG_ENV_SCRIPT)"

BOOTSTRAP_DEPS = $(XDG_ENV_SCRIPT)

ifneq ($(shell grep xdg.env.sh $$HOME/.zshenv), $(SOURCE_XDG))
	BOOTSTRAP_DEPS += bootstrap_zshenv
endif

.PHONY: bootstrap install bootstrap_zshenv

bootstrap: $(BOOTSTRAP_DEPS)
	command -v brew || /bin/bash -c "$$(curl -fsSL $(HOMEBREW_URL))"

install: $(XDG_ENV_SCRIPT)
	brew bundle --file ./Brewfile

bootstrap_zshenv:
	echo '$(SOURCE_XDG)' >> $(HOME)/.zshenv

$(XDG_ENV_SCRIPT): xdg.env.sh
	mkdir -p $(@D)
	chmod 700 $(@D)
	cp -f $(^) $(@)
	chmod 600 $(@)
