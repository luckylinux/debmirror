#!/bin/bash

# Abort on Error
set -e

function sync_mozilla_ppa() {
    # Input Arguments
    local ltype="$1"
    local ldist="$2"
    local larch=${3-"amd64,arm64"}

    # Options
    local lopts=()
    #lopts+=("--verbose")
    #lopts+=("--debug")
    lopts+=("--rsync-extra=none")
    lopts+=("--host=ppa.launchpadcontent.net")
    lopts+=("--root=mozillateam/ppa/ubuntu")
    lopts+=("--dist=${ldist}")
    lopts+=("--section=main")
    lopts+=("--arch=${larch}")
    lopts+=("--getcontents")
    lopts+=("--nosource")
    lopts+=("--method=https")
    lopts+=("--cleanup")
    lopts+=("--keyring=$HOME/keyrings/mozilla-ppa-archive-keyring.gpg")
    lopts+=("--omit-suite-symlinks")

    # Must use the patched Version of debmirror
    $HOME/debmirror \
           ${lopts[*]} \
           /data/debmirror/mozilla/ppa/${ltype}/${ldist} \
           2>&1 | egrep -v '(Warning: --rsync-extra is not configured to mirror the trace files|This configuration is not recommended)'
}

# Run Synchronizations
sync_mozilla_ppa "ubuntu" "noble" "amd64"
