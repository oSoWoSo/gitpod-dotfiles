#!/usr/bin/env bash
# dotbins - Add platform-specific binaries to PATH
_os=$(uname -s | tr '[:upper:]' '[:lower:]')
[[ "$_os" == "darwin" ]] && _os="macos"

_arch=$(uname -m)
[[ "$_arch" == "x86_64" ]] && _arch="amd64"
[[ "$_arch" == "aarch64" || "$_arch" == "arm64" ]] && _arch="arm64"

export PATH="$HOME/projekty/gitpod-dotfiles/$_os/$_arch/bin:$PATH"

# Tool-specific configurations
# Configuration for fzf
if command -v fzf >/dev/null 2>&1; then
    eval "$(fzf --bash)"
fi

# Configuration for lazygit
if command -v lazygit >/dev/null 2>&1; then
    alias lg="lazygit"
fi

# Configuration for starship
if command -v starship >/dev/null 2>&1; then
    eval "$(starship init bash)"
fi

