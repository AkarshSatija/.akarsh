#!/usr/bin/env bash
# install.sh — Bootstrap ~/.akarsh dotfiles on a new macOS machine

set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ZSHRC="$HOME/.zshrc"

# Colors
RED=$'\033[0;31m'
GREEN=$'\033[0;32m'
BLUE=$'\033[0;34m'
YELLOW=$'\033[0;33m'
NC=$'\033[0m'

info()    { echo "${BLUE}==>${NC} $*"; }
success() { echo "${GREEN}✓${NC} $*"; }
warn()    { echo "${YELLOW}!${NC} $*"; }
error()   { echo "${RED}✗${NC} $*" >&2; }

# ── Homebrew ──────────────────────────────────────────────────────────────────

install_homebrew() {
    if command -v brew &>/dev/null; then
        success "Homebrew already installed"
        return
    fi
    info "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    success "Homebrew installed"
}

# ── Brew packages ─────────────────────────────────────────────────────────────

install_brew_packages() {
    info "Installing brew dependencies..."

    local packages=(
        fzf           # fuzzy finder — used by lazy-connect and chrome-dedup-tabs
        oath-toolkit  # oathtool for TOTP — used by lazy-connect
        chrome-cli    # Chrome tab control — used by chrome-dedup-tabs
    )

    for pkg in "${packages[@]}"; do
        if brew list "$pkg" &>/dev/null; then
            success "$pkg already installed"
        else
            info "Installing $pkg..."
            brew install "$pkg"
            success "$pkg installed"
        fi
    done
}

# ── PATH & bin ────────────────────────────────────────────────────────────────

setup_bin() {
    local bin_line="export PATH=\"\$HOME/.akarsh/bin:\$PATH\""
    if grep -qF '.akarsh/bin' "$ZSHRC" 2>/dev/null; then
        success "bin PATH already in $ZSHRC"
    else
        info "Adding ~/.akarsh/bin to PATH in $ZSHRC..."
        echo "" >> "$ZSHRC"
        echo "# .akarsh bin" >> "$ZSHRC"
        echo "$bin_line" >> "$ZSHRC"
        success "bin PATH added"
    fi

    chmod +x "$DOTFILES_DIR"/bin/*
    success "bin scripts marked executable"
}

# ── Shell includes ────────────────────────────────────────────────────────────

setup_includes() {
    local source_block='# .akarsh includes
for f in ~/.akarsh/include/*.sh; do source "$f"; done'

    if grep -qF '.akarsh/include' "$ZSHRC" 2>/dev/null; then
        success "includes already sourced in $ZSHRC"
    else
        info "Adding include sources to $ZSHRC..."
        echo "" >> "$ZSHRC"
        echo "$source_block" >> "$ZSHRC"
        success "includes added to $ZSHRC"
    fi
}

# ── gitcl config ──────────────────────────────────────────────────────────────

setup_gitcl() {
    local gitclrc="$HOME/.gitclrc"
    if [[ -f "$gitclrc" ]]; then
        success ".gitclrc already exists"
        return
    fi

    local default_base="$HOME/code"
    info "Setting up gitcl base path..."
    echo -n "  Enter base path for git clones [${default_base}]: "
    read -r input_path
    local base_path="${input_path:-$default_base}"
    base_path="${base_path/#\~/$HOME}"

    mkdir -p "$base_path"
    echo "GITCL_BASE_PATH=${base_path}" > "$gitclrc"
    success "gitclrc written: GITCL_BASE_PATH=${base_path}"
}

# ── lazy-connect ──────────────────────────────────────────────────────────────

setup_lazy_connect() {
    local config_dir="$HOME/.config/lazy-connect"
    mkdir -p "$config_dir"

    if [[ -f "$config_dir/vpns" ]]; then
        success "lazy-connect already configured"
        return
    fi

    warn "lazy-connect not initialized. Run 'lazy-connect -i' after install to set up your TOTP secret and VPN list."
}

# ── fzf shell integration ─────────────────────────────────────────────────────

setup_fzf() {
    if [[ -f "$HOME/.fzf.zsh" ]]; then
        success "fzf shell integration already installed"
        return
    fi
    info "Installing fzf shell integration..."
    "$(brew --prefix fzf)/install" --key-bindings --completion --no-update-rc
    success "fzf shell integration installed"
}

# ── Main ──────────────────────────────────────────────────────────────────────

main() {
    echo ""
    echo "${BLUE}.akarsh dotfiles installer${NC}"
    echo "────────────────────────────"
    echo ""

    install_homebrew
    install_brew_packages
    setup_fzf
    setup_bin
    setup_includes
    setup_gitcl
    setup_lazy_connect

    echo ""
    echo "${GREEN}Done!${NC} Reload your shell to apply changes:"
    echo ""
    echo "  source ~/.zshrc"
    echo ""
    echo "Next steps:"
    echo "  • Run 'lazy-connect -i' to configure VPN + TOTP"
    echo "  • Set GITCL_BASE_PATH in ~/.gitclrc if you skipped the prompt"
    echo ""
}

main "$@"
