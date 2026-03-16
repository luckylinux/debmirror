#!/bin/bash

# Abort on Error
set -e

# Must use the patched Version of debmirror
$HOME/debmirror \
            --rsync-extra=none \
            --host="packages.element.io" \
            --root="debian" \
            --dist="default" \
            --section="main" \
            --arch="amd64" \
            --nosource \
            --method=https \
            --cleanup \
            --keyring=$HOME/keyrings/element-io-archive-keyring.gpg \
            --omit-suite-symlinks \
            /data/debmirror/element \
            2>&1 | egrep -v '(Warning: --rsync-extra is not configured to mirror the trace files|This configuration is not recommended)'
