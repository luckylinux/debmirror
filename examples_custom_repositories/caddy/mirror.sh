#!/bin/bash

# Abort on Error
set -e

# Must use the patched Version of debmirror
$HOME/debmirror \
            --rsync-extra=none \
            --host=dl.cloudsmith.io \
            --root=public/caddy/stable/deb/debian \
            --dist=any-version \
            --section=main \
            --arch=amd64,aarch64 \
            --nosource \
            --method=https \
            --cleanup \
            --keyring=$HOME/keyrings/caddy-stable-archive-keyring.gpg \
            --omit-suite-symlinks \
            /data/debmirror/caddy \
            2>&1 | egrep -v '(Warning: --rsync-extra is not configured to mirror the trace files|This configuration is not recommended)'
