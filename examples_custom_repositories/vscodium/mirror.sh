#!/bin/bash

# Abort on Error
set -e

# Must use the patched Version of debmirror
$HOME/debmirror \
           --rsync-extra=none \
           --host="download.vscodium.com" \
           --root="debs" \
           --dist="vscodium" \
           --codename="vscodium" \
           --section="main" \
           --arch=amd64 \
           --nosource \
           --method=https \
           --cleanup \
           --keyring=$HOME/keyrings/vscodium-archive-keyring.gpg \
           --omit-suite-symlinks \
           /data/debmirror/vscodium \
           2>&1 | egrep -v '(Warning: --rsync-extra is not configured to mirror the trace files|This configuration is not recommended)'
