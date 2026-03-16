#!/bin/bash

# Abort on Error
set -e

function sync_kicad() {
    # Input Arguments
    local lversion="$1"
    local ldist="$2"

    # Options
    local lopts=()
    # lopts+=("--verbose")
    # lopts+=("--debug")
    lopts+=("--rsync-extra=none")
    lopts+=("--host=ppa.launchpadcontent.net")
    lopts+=("--root=kicad/kicad-${lversion}-releases/ubuntu")
    lopts+=("--dist=${ldist}")
    lopts+=("--section=main")
    lopts+=("--arch=amd64")
    lopts+=("--getcontents")
    lopts+=("--nosource")
    lopts+=("--method=https")
    lopts+=("--cleanup")
    lopts+=("--keyring=$HOME/keyrings/kicad-archive-keyring.gpg")
    lopts+=("--omit-suite-symlinks")

    # Must use the patched Version of debmirror
    $HOME/debmirror \
           ${lopts[*]} \
           /data/debmirror/kicad/${lversion}/${ldist} \
           2>&1 | egrep -v '(Warning: --rsync-extra is not configured to mirror the trace files|This configuration is not recommended)'
}

# Run Synchronizations
sync_kicad "9.0" "noble"
sync_kicad "9.0" "resolute"

sync_kicad "10.0" "noble"
sync_kicad "10.0" "resolute"
