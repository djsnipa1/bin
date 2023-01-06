#!/usr/bin/env bash

declare -xr INSTALL_PREFIX="${INSTALL_PREFIX:-"$HOME/.local"}"
declare -xr XDG_DATA_HOME="${XDG_DATA_HOME:-"$HOME/.local/share"}"
declare -xr XDG_CACHE_HOME="${XDG_CACHE_HOME:-"$HOME/.cache"}"
declare -xr XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-"$HOME/.config"}"

declare -xr LUNARVIM_RUNTIME_DIR="${LUNARVIM_RUNTIME_DIR:-"$XDG_DATA_HOME/lunarvim"}"
declare -xr LUNARVIM_CONFIG_DIR="${LUNARVIM_CONFIG_DIR:-"$XDG_CONFIG_HOME/lvim"}"
declare -xr LUNARVIM_CACHE_DIR="${LUNARVIM_CACHE_DIR:-"$XDG_CACHE_HOME/lvim"}"
declare -xr LUNARVIM_BASE_DIR="${LUNARVIM_BASE_DIR:-"$LUNARVIM_RUNTIME_DIR/lvim"}"

declare -xr GITPOD_DIR="${GITPOD_DIR:-"$GITPOD_REPO_ROOT"}"

# [ ! -f "$LUNARVIM_CONFIG_DIR/config.lua" ] \
# && cp config.lua "$LUNARVIM_CONFIG_DIR/config.lua"
cp "$GITPOD_REPO_ROOT/config.lua" "$LUNARVIM_CONFIG_DIR/config.lua"

echo "Preparing Packer setup"

"$INSTALL_PREFIX/bin/lvim" --headless \
	-c 'autocmd User PackerComplete quitall' \
	-c 'PackerSync'

echo "lunarvim setup complete"

nix-env -i lazygit lf 
