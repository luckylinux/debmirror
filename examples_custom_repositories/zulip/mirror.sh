#!/bin/bash

# Abort on Error
set -e

# Must use the patched Version of debmirror
$HOME/debmirror \
           --rsync-extra=none \
           --getcontents \
           --host="download.zulip.com" \
           --root="desktop/apt" \
           --dist="stable" \
           --codename="stable" \
           --section="main" \
           --nosource \
           --method=https \
           --cleanup \
           --keyring=$HOME/keyrings/zulip-desktop.gpg  \
           --omit-suite-symlinks \
           /data/debmirror/zulip \
           2>&1 | egrep -v '(Warning: --rsync-extra is not configured to mirror the trace files|This configuration is not recommended)'
