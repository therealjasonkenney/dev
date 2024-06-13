.PHONY: clean install

OS_DIR := os/

ifeq ($(OS),Windows_NT)
	OS_DIR += Windows
else
	OS_DIR = os/$(shell uname -s)
endif

bootstrap:
	@make -C $(OS_DIR) bootstrap

clean:
	@make -C ./alacritty clean
	@make -C ./fish clean
	@make -C ./nvim clean
	@make -C ./starship clean
	@make -C ./zellij clean

install:
	@make -C $(OS_DIR) install
	@make -C ./alacritty install
	@make -C ./fish install
	@make -C ./nvim install
	@make -C ./starship install
	@make -C ./zellij install
	@printf "| %-30s | --------- |\n" "------------------------------"
	@printf "| %-30s | Installed |\n" "Alacritty Configuration"
	@printf "| %-30s | Installed |\n" "Fish Configuration"
	@printf "| %-30s | Installed |\n" "Neovim Configuration"
	@printf "| %-30s | Installed |\n" "POSIX XDG Setup"
	@printf "| %-30s | Installed |\n" "Starship Configuration"
	@printf "| %-30s | Installed |\n" "Zellij Configuration"
