#!/bin/bash

# Abort on Error
set -e

# Must use the patched Version of debmirror
$HOME/debmirror \
           --rsync-extra=none \
           --host="debian.usebruno.com" \
           --dist="bruno" \
           --codename="bruno" \
           --section="stable" \
           --nosource \
           --method=http \
           --cleanup \
           --keyring=$HOME/keyrings/bruno.gpg  \
           --omit-suite-symlinks \
           /data/debmirror/bruno \
           2>&1 | egrep -v '(Warning: --rsync-extra is not configured to mirror the trace files|This configuration is not recommended)'
