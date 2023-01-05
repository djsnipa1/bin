#!/usr/bin/env bash

declare -xr INSTALL_PREFIX="${INSTALL_PREFIX:-"$HOME/.local"}"

  [ ! -f "$LUNARVIM_CONFIG_DIR/config.lua" ] \
    && cp config.lua "$LUNARVIM_CONFIG_DIR/config.lua"

  echo "Preparing Packer setup"

  "$INSTALL_PREFIX/bin/lvim" --headless \
    -c 'autocmd User PackerComplete quitall' \
    -c 'PackerSync'

  echo "Custom setup complete"

