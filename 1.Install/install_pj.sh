#!/usr/bin/env bash

set -euo pipefail

# shellcheck source=/dev/null
. ~/Documents/Github/2.1.Linux/1.Install/01_set_env_variables.sh

$DBG now in "${BASH_SOURCE[0]}" 

# Exit if program is already installed
PROGRAM="{PROGRAM:?}"
if command -v "$PROGRAM" >/dev/null; then
    $DBG "$0" "$PROGRAM" is already installed
    [[ "$0" == "${BASH_SOURCE[0]}" ]] && exit 0 || return 0
fi

case $ID in
fedora)
    $DBG -e "\n$PROGRAM not implemented in $ID\n"
    ;;
linuxmint | ubuntu)
    $DBG -e "\n$PROGRAM not implemented in $ID\n"
    ;;
*)
    echo "Distribution $ID not recognized, exiting ..."
    exit 1
    ;;
esac

LINKS="${0#/*}"/links_pj.sh
[[ -f $LINKS ]] && $LINKS

$RUN "$PROGRAM"
