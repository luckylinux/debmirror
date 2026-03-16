#!/bin/bash

# Abort on Error
set -e

# Must use the patched Version of debmirror
$HOME/debmirror \
           --rsync-extra=none \
           --exclude='pool/main/b/brave-browser/brave-browser_1.85.*_amd64.deb' \
           --exclude='pool/main/b/brave-browser/brave-browser_1.84.*_amd64.deb' \
           --exclude='pool/main/b/brave-browser/brave-browser_1.83.*_amd64.deb' \
           --exclude='pool/main/b/brave-browser/brave-browser_1.82.*_amd64.deb' \
           --exclude='pool/main/b/brave-browser/brave-browser_1.81.*_amd64.deb' \
           --exclude='pool/main/b/brave-browser/brave-browser_1.7.*_amd64.deb' \
           --exclude='pool/main/b/brave-browser/brave-browser_1.6.*_amd64.deb' \
           --exclude='pool/main/b/brave-browser/brave-browser_1.5.*_amd64.deb' \
           --exclude='pool/main/b/brave-browser/brave-browser_1.4.*_amd64.deb' \
           --exclude='pool/main/b/brave-browser/brave-browser_1.3.*_amd64.deb' \
           --exclude='pool/main/b/brave-browser/brave-browser_1.2.*_amd64.deb' \
           --exclude='pool/main/b/brave-browser/brave-browser_1.1.*_amd64.deb' \
           --exclude='pool/main/b/brave-browser/brave-browser_1.0.*_amd64.deb' \
           --host="brave-browser-apt-release.s3.brave.com" \
           --dist="stable" \
           --codename="stable" \
           --section="main" \
           --arch="amd64" \
           --getcontents \
           --nosource \
           --method=https \
           --cleanup \
           --keyring=$HOME/keyrings/brave-browser-archive-keyring.gpg  \
           --omit-suite-symlinks \
           /data/debmirror/brave \
           2>&1 | egrep -v '(Warning: --rsync-extra is not configured to mirror the trace files|This configuration is not recommended)'
