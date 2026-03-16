#!/bin/bash

# Abort on Error
set -e

# Must use the patched Version of debmirror
$HOME/debmirror \
           --rsync-extra=none \
           --host=apt.syncthing.net \
           --dist="syncthing" \
           --codename="syncthing" \
           --section="stable,stable-v2" \
           --arch=amd64,aarch64,arm64,armel,armhf,all \
           --nosource \
           --method=https \
           --cleanup \
           --keyring=$HOME/keyrings/syncthing-archive-keyring.gpg \
           --omit-suite-symlinks \
           /data/debmirror/syncthing \
           2>&1 | egrep -v '(Warning: --rsync-extra is not configured to mirror the trace files|This configuration is not recommended)'
