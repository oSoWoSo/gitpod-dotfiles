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
source shell/bash.sh
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
