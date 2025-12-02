#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Toggle Aerospace Gaps
# @raycast.mode inline

# Optional parameters:
# @raycast.icon 🖥️
# @raycast.packageName toggle-aerospace-gaps

# Documentation:
# @raycast.author aldous
# @raycast.authorURL https://raycast.com/aldous

CONFIG_DIR="$HOME/.config/aerospace"
ACTIVE_CONFIG="$CONFIG_DIR/aerospace.toml"
CONFIG_DEFAULT="$CONFIG_DIR/default.toml"
CONFIG_LARGE="$CONFIG_DIR/large.toml"

if cmp -s "$ACTIVE_CONFIG" "$CONFIG_DEFAULT"; then
  cp "$CONFIG_LARGE" "$ACTIVE_CONFIG"
  echo "Switched to large gaps config"
else
  cp "$CONFIG_DEFAULT" "$ACTIVE_CONFIG"
  echo "Switched to default gaps config"
fi

aerospace reload-config

