# .akarsh

Personal dotfiles and shell utilities for macOS.

## Installation

```sh
git clone git@github.com:AkarshSatija/.akarsh.git ~/.akarsh
cd ~/.akarsh
./install.sh
```

The installer will:
- Install Homebrew (if missing)
- Install brew dependencies (`fzf`, `oath-toolkit`, `chrome-cli`)
- Add `~/.akarsh/bin` to your `PATH` in `~/.zshrc`
- Source all `include/*.sh` files from `~/.zshrc`
- Create `~/.gitclrc` with your preferred clone base path
- Set up fzf shell integration

Then reload your shell:

```sh
source ~/.zshrc
```

## Contents

### `bin/` — Standalone tools

Add `~/.akarsh/bin` to your `PATH` to use these directly:

```sh
export PATH="$HOME/.akarsh/bin:$PATH"
```

#### `gitcl` — Smart git clone

Clones repos organized by URL path (e.g. `~/code/github.com/user/repo`) and automatically `cd`s into the cloned directory.

```sh
gitcl https://github.com/user/repo
gitcl git@github.com:user/repo.git ~/code
```

**Configuration** (priority order):
1. Pass base path as argument: `gitcl <url> /path/to/base`
2. Environment variable: `export GITCL_BASE_PATH=~/code`
3. Config file: `~/.gitclrc` containing `GITCL_BASE_PATH=~/code`

> The shell wrapper in `include/3.gitcl.sh` enables the auto-`cd` behavior. Without it, `gitcl` runs as a subprocess and can't change your shell's directory.

#### `chrome-dedup-tabs` — Deduplicate Chrome tabs

Scans Chrome tabs for duplicates and lets you interactively select which to close, keeping the first occurrence of each URL.

**Dependencies:**
```sh
brew install chrome-cli fzf
```

```sh
chrome-dedup-tabs              # scan all windows
chrome-dedup-tabs -w <id>      # target a specific window/profile
chrome-dedup-tabs -v           # verbose/debug output
```

**Interactive controls (fzf):**
- `TAB` — toggle selection
- `CTRL-A` — select all duplicates
- `CTRL-D` — deselect all
- `ENTER` — close selected tabs
- `ESC` — abort

#### `lazy-connect` — Fuzzy VPN connector

Fuzzy-search macOS IPSec VPNs by name and connect automatically using TOTP.

**Dependencies:**
```sh
brew install oath-toolkit fzf
```

**Setup (first time):**
```sh
lazy-connect -i    # store your TOTP secret in macOS Keychain and fetch VPN list
```

```sh
v                  # alias for lazy-connect (defined in aliases)
lazy-connect -r    # refresh VPN list
lazy-connect -n    # connect but copy password to clipboard instead of auto-filling
```

---

### `include/` — Shell includes

Sourced into your shell session in numeric order:

| File | Purpose |
|------|---------|
| `0.prezto.sh` | Load [Prezto](https://github.com/sorin-ionescu/prezto) |
| `000.source.sh` | Load RVM |
| `1.aliases.sh` | General aliases (`k`, `kx`, `t`, `v`, `reload`, etc.) |
| `1.itermtab.sh` | iTerm2 tab helper (`newTab`) |
| `1.ssh.sh` | SSH aliases and helpers (`sshme`, `s3h`, `getIP`) |
| `2.helpers.sh` | Shell helper functions |
| `2.terraform.aliases.sh` | Terraform aliases (`tinit`) |
| `3.gitcl.sh` | Shell wrapper for `gitcl` enabling auto-`cd` |
| `98.prompt.sh` | Prompt configuration |
| `99.path.sh` | PATH exports (Go, AWS, Android, asdf, fzf) |

---

### `inventory/` — Machine inventory

Hostname/IP mappings used by SSH helpers.

### `iterm/` — iTerm2 configuration

See [`iterm/readme.md`](iterm/readme.md).
