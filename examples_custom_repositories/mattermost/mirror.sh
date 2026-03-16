#!/bin/bash

# Abort on Error
set -e

# Must use the patched Version of debmirror
$HOME/debmirror \
           --rsync-extra=none \
           --getcontents \
           --host="deb.packages.mattermost.com" \
           --dist="stable" \
           --codename="stable" \
           --section="main" \
           --nosource \
           --method=https \
           --cleanup \
           --keyring=$HOME/keyrings/mattermost.gpg  \
           --omit-suite-symlinks \
           /data/debmirror/mattermost \
           2>&1 | egrep -v '(Warning: --rsync-extra is not configured to mirror the trace files|This configuration is not recommended)'
