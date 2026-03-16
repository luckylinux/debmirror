#!/bin/bash

# Abort on Error
set -e

# Must use the patched Version of debmirror
$HOME/debmirror \
           --rsync-extra=none \
           --exclude='pool/teamviewer-host_15\.73.*_amd64.deb' \
           --exclude='pool/teamviewer-host_15\.72.*_amd64.deb' \
           --exclude='pool/teamviewer-host_15\.71.*_amd64.deb' \
           --exclude='pool/teamviewer-host_15\.70.*_amd64.deb' \
           --exclude='pool/teamviewer-host_15\.69.*_amd64.deb' \
           --exclude='pool/teamviewer-host_15\.67.*_amd64.deb' \
           --exclude='pool/teamviewer-host_15\.60.*_amd64.deb' \
           --exclude='pool/teamviewer-host_15\.50.*_amd64.deb' \
           --exclude='pool/teamviewer-host_15\.40.*_amd64.deb' \
           --exclude='pool/teamviewer-host_15\.30.*_amd64.deb' \
           --exclude='pool/teamviewer-host_15\.20.*_amd64.deb' \
           --exclude='pool/teamviewer-host_15\.10.*_amd64.deb' \
           --exclude='pool/teamviewer-host_14\..*_amd64.deb' \
           --exclude='pool/teamviewer-host_13\..*_amd64.deb' \
           --exclude='pool/teamviewer-host_12\..*_amd64.deb' \
           --exclude='pool/teamviewer-host_11\..*_amd64.deb' \
           --exclude='pool/teamviewer-host_10\..*_amd64.deb' \
           --exclude='pool/teamviewer_15\.73.*_amd64.deb' \
           --exclude='pool/teamviewer_15\.72.*_amd64.deb' \
           --exclude='pool/teamviewer_15\.71.*_amd64.deb' \
           --exclude='pool/teamviewer_15\.70.*_amd64.deb' \
           --exclude='pool/teamviewer_15\.69.*_amd64.deb' \
           --exclude='pool/teamviewer_15\.67.*_amd64.deb' \
           --exclude='pool/teamviewer_15\.60.*_amd64.deb' \
           --exclude='pool/teamviewer_15\.50.*_amd64.deb' \
           --exclude='pool/teamviewer_15\.40.*_amd64.deb' \
           --exclude='pool/teamviewer_15\.30.*_amd64.deb' \
           --exclude='pool/teamviewer_15\.20.*_amd64.deb' \
           --exclude='pool/teamviewer_15\.10.*_amd64.deb' \
           --exclude='pool/teamviewer_14\..*_amd64.deb' \
           --exclude='pool/teamviewer_13\..*_amd64.deb' \
           --exclude='pool/teamviewer_12\..*_amd64.deb' \
           --exclude='pool/teamviewer_11\..*_amd64.deb' \
           --exclude='pool/teamviewer_10\..*_amd64.deb' \
           --host="linux.teamviewer.com" \
           --root="deb" \
           --dist="stable" \
           --codename="stable" \
           --section="main" \
           --arch="amd64" \
           --getcontents \
           --nosource \
           --method=https \
           --cleanup \
           --keyring=$HOME/keyrings/teamviewer-keyring.gpg  \
           --omit-suite-symlinks \
           /data/debmirror/teamviewer \
           2>&1 | egrep -v '(Warning: --rsync-extra is not configured to mirror the trace files|This configuration is not recommended)'
