#!/bin/bash

TMPDIR=$(mktemp -d)

CURRENT=$PWD

cd $TMPDIR

for script in ~/.dotfiles/scripts/*; do
  bash "$script"
done

cd $CURRENT

sudo bash <<'SCRIPT'
# Install dotbins
pip install dotbins

dotbins sync

# Install gitpod.zellij plugin
plugin_path="/usr/bin/gitpod_zellij"
curl -L "https://github.com/axonasif/gitpod.zellij/releases/latest/download/gitpod_zellij-x86_64-unknown-linux-musl.tar.gz" |
  tar -C /usr/bin -xzf - gitpod_zellij
SCRIPT

cat >>"$HOME/.bashrc" <<'SNIP'
_os=$(uname -s | tr '[:upper:]' '[:lower:]')
[[ "$_os" == "darwin" ]] && _os="macos"

_arch=$(uname -m)
[[ "$_arch" == "x86_64" ]] && _arch="amd64"
[[ "$_arch" == "aarch64" || "$_arch" == "arm64" ]] && _arch="arm64"

export PATH="$_os/$_arch/bin:$PATH"

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

SNIP

# Auto start zellij on SSH or xtermjs
cat >>"$HOME/.bashrc" <<'SNIP'
if ! test -v ZELLIJ && ! pgrep -f "$HOME/.vscode-server/bin" 1>/dev/null && (test -v SSH_CONNECTION || test "$PPID" == "$(pgrep -f '/ide/xterm/bin/node /ide/xterm/index.cjs' | head -n1)"); then {
  gitpod_zellij & disown
  if ! zellij has-sessions 2>/dev/null; then {
    exec zellij -s gitpod
  } fi
    exec zellij attach
} fi
SNIP

rm -rf $TMPDIR
