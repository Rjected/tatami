#!/bin/sh
# Stop tatami, put every window back on screen and remove the login agent.
set -eu
cd "$(dirname "$0")/.."
./scripts/uninstall.sh
