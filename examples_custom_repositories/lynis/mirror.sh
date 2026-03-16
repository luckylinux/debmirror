#!/bin/bash

# Abort on Error
set -e

# Must use the patched Version of debmirror
$HOME/debmirror \
           --rsync-extra=none \
           --host="packages.cisofy.com" \
           --root="community/lynis/deb" \
           --dist="stable" \
           --arch="amd64,aarch64,arm64,i386,all" \
           --codename="stable" \
           --section="main" \
           --nosource \
           --getcontents \
           --method=https \
           --keyring=$HOME/keyrings/cisofy-archive-keyring.gpg \
           --ignore-small-errors \
           --allow-dist-rename \
           /data/debmirror/lynis \
           2>&1 | egrep -v '(Warning: --rsync-extra is not configured to mirror the trace files|This configuration is not recommended)'

# Must use the patched Version of debmirror
$HOME/debmirror \
           --rsync-extra=none \
           --host="packages.cisofy.com" \
           --root="community/lynis/deb" \
           --dist="stable" \
           --arch="all" \
           --codename="stable" \
           --section="main" \
           --nosource \
           --getcontents \
           --method=https \
           --keyring=$HOME/keyrings/cisofy-archive-keyring.gpg \
           --ignore-small-errors \
           --allow-dist-rename \
           /data/debmirror/lynis \
           2>&1 | egrep -v '(Warning: --rsync-extra is not configured to mirror the trace files|This configuration is not recommended)'
