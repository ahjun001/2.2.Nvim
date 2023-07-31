#!/usr/bin/env bash

set -euo pipefail

# shellcheck source=/dev/null
. ~/Documents/Github/2.1.Linux/1.Install/01_set_env_variables.sh

$DBG $'\n'"${BASH_SOURCE[0]#/home/perubu/Documents/Github/}" 

# Exit if APP is already installed
APP=nvim
if ! command -v "$APP" >/dev/null; then
    $DBG $'\t'"$APP" is already uninstalled
    [[ "$0" == "${BASH_SOURCE[0]}" ]] && exit 0 || return 0
fi

case $ID in
fedora)
    $DBG -e "\n$APP not implemented in $ID\n"
    ;;
linuxmint | ubuntu)
    sudo rm -rf /opt/nvim-linux64
    sudo rm -f /usr/local/sbin/nvim
    ;;
*)
    echo "Distribution $ID not recognized, exiting ..."
    exit 1
    ;;
esac
