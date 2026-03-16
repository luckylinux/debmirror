#!/bin/bash

# Abort on Error
set -e

# Must use the patched Version of debmirror
$HOME/debmirror \
           --rsync-extra=none \
           --user-agent="Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36" \
           --host="labs.picotech.com" \
           --root="rc/picoscope7/debian/" \
           --dist="picoscope" \
           --codename="picoscope" \
           --section="main" \
           --nosource \
           --method=https \
           --cleanup \
           --keyring=$HOME/keyrings/picotech-archive-keyring.gpg  \
           --omit-suite-symlinks \
           /data/debmirror/picoscope/7 \
           2>&1 | egrep -v '(Warning: --rsync-extra is not configured to mirror the trace files|This configuration is not recommended)'
