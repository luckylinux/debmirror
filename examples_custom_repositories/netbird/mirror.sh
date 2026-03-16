#!/bin/bash

# Abort on Error
set -e

# Must use the patched Version of debmirror
$HOME/debmirror \
            --rsync-extra=none \
            --host="pkgs.netbird.io" \
            --root="debian" \
            --dist="stable" \
            --section="main" \
            --arch="amd64,aarch64,arm64,all" \
            --nosource \
            --method=https \
            --cleanup \
            --keyring=$HOME/keyrings/netbird-archive-keyring.gpg \
            --omit-suite-symlinks \
            /data/debmirror/netbird \
            2>&1 | egrep -v '(Warning: --rsync-extra is not configured to mirror the trace files|This configuration is not recommended)'
