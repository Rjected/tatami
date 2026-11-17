#!/bin/sh
# Switch Dan's Mac to tatami: stop AeroSpace if it runs, build, install to ~/.local/bin and
# load the launchd agent that starts tatami at login. Undo with dan/disable.sh.
set -eu
cd "$(dirname "$0")/.."
pkill -x AeroSpace 2>/dev/null || true
launchctl bootout "gui/$(id -u)/org.nix-community.home.aerospace" 2>/dev/null || true
mkdir -p "$HOME/.config/tatami"
ln -sf "$PWD/dan/tatami.conf" "$HOME/.config/tatami/tatami.conf"
./scripts/install.sh
echo "Now allow tatami in System Settings > Privacy & Security > Accessibility."
echo "It starts by itself a few seconds later. Log: ~/Library/Logs/tatami.log"
