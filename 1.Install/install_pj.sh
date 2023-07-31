#!/usr/bin/env bash

set -euo pipefail

# shellcheck source=/dev/null
. ~/Documents/Github/2.1.Linux/1.Install/01_set_env_variables.sh

$DBG $'\n'"${BASH_SOURCE[0]#/home/perubu/Documents/Github/}"

# Exit if APP is already installed
APP=nvim
if command -v "$APP" >/dev/null; then
    $DBG $'\t'"$APP" is already installed
    [[ "$0" == "${BASH_SOURCE[0]}" ]] && exit 0 || return 0
fi

case $ID in
fedora)
    dnf install neovim
    ;;
linuxmint | ubuntu)
    # Download latest binary tarball
    [[ -f /tmp/nvim-linux64.tar.gz ]] ||
        sudo wget https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.tar.gz -P /tmp

    # Extract binary
    [[ -f /tmp/nvim-linux64.tar.gz ]] && sudo tar xzf /tmp/nvim-linux64.tar.gz -C /opt/

    # link in a directory already in $PATH
    sudo ln -fs /opt/nvim-linux64/bin/nvim /usr/local/sbin
    ;;
*)
    echo "Distribution $ID not recognized, exiting ..."
    exit 1
    ;;
esac

LINKS="${0#/*}"/links_pj.sh
[[ -f $LINKS ]] && $LINKS

$RUN "$APP"
