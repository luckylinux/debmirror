#!/bin/bash

# Abort on Error
set -e

function sync_teams() {
    # Input Arguments
    # local lversion="$1"
    # local ldist="$2"

    # Options
    local lopts=()
    # lopts+=("--verbose")
    # lopts+=("--debug")
    # lopts+=("--user-agent=\"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36\"")
    lopts+=("--rsync-extra=none")
    lopts+=("--host=repo.teamsforlinux.de")
    lopts+=("--root=debian")
    lopts+=("--dist=stable")
    lopts+=("--codename=stable")
    lopts+=("--section=main")
    lopts+=("--arch=amd64")
    lopts+=("--getcontents")
    lopts+=("--nosource")
    lopts+=("--method=https")
    lopts+=("--cleanup")
    lopts+=("--keyring=$HOME/keyrings/teams-archive-keyring.gpg")
    lopts+=("--omit-suite-symlinks")

    # Must use the patched Version of debmirror
    $HOME/debmirror \
           ${lopts[@]} \
           --user-agent="Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36" \
           /data/debmirror/teams \
           2>&1 | egrep -v '(Warning: --rsync-extra is not configured to mirror the trace files|This configuration is not recommended)'
}

# Run Synchronizations
sync_teams
