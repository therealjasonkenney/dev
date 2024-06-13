My dotfiles config and bootstraping.

## Setup
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/therealjasonkenney/dev/main/install.sh)"
```

## What it Does?
The focus is mostly on what tools I need for
Software Development, setup and configured so
I can then install database, language, etc and then
start coding.

**NOTE:** These tools are based on *my* preferences, they
might not work for other people.

### Installs and sets up these tools.

|          |        |                          |
| -------- | ------ | ------------------------ |
| **Editor** | neovim | [url](https://neovim.io) |
| **File finder**  | fd | [repo](https://github.com/sharkdp/fd) |
| **File viewer** | bat | [repo](https://github.com/sharkdp/bat) |
| **Fuzzy finder** | skim | [repo](https://github.com/lotabout/skim) |
| **Language Version Mngmt** | asdf | [url](https://asdf-vm.com) |
| **Package Mngmt** (Mac) | brew | [url](https://brew.sh) |
| **Screen Muxer** | zellij | [url](https://zellij.dev) |
| **Shell** | fish | [url](https://fishshell.com) |
| **Shell Prompt** | starship | [url](https://starship.rs) |
| **Terminal** | alacritty | [url](https://alacritty.org) |
| **Text search** | ripgrep | [repo](https://github.com/BurntSushi/ripgrep) |
| **Version Control** | git | [url](https://git-scm.com) |

## Updating
Just use `make`

`make install`

## Design considerations
- I used make after trying home-manager and chezmoi, `make` works
for me, especially since this project is for just *my* situation.
- Currently this works for my Mac computers, in case I plan to
use Linux I set it up so Mac specific config is in os/Darwin.
- To add Linux support add `os/Linux` to the repo.
- If we also need specific host considerations (such as work)
we could add a `host/*` directory and have that be used instead
of the `os/*` directory.
- It doesn't install specific languages, this instead installs
asdf and dependencies because for home my language use depends on
my projcts, and work will have its own setup.
