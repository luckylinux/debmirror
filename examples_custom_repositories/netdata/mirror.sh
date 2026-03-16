#!/bin/bash

# Abort on Error
set -e

function sync_netdata() {
    # Input Arguments
    local ltype="$1"
    local ldist="$2"
    local larch=${3-"amd64,arm64"}

    # Options
    local lopts=()
    lopts+=("--verbose")
    lopts+=("--debug")
    lopts+=("--flat-structure")
    lopts+=("--rsync-extra=none")
    lopts+=("--host=repository.netdata.cloud")
    lopts+=("--root=repos/stable/${ltype}")
    lopts+=("--dist=${ldist}")
    lopts+=("--no-dists-subpath")
    #lopts+=("--section=main")
    #lopts+=("--arch=${larch}")
    lopts+=("--getcontents")
    lopts+=("--nosource")
    lopts+=("--method=https")
    lopts+=("--cleanup")
    #####lopts+=("--keyring=$HOME/keyrings/netdata.gpg")
    #
    # This works correctly
    #lopts+=("--keyring=$HOME/scripts/netdata/6E155DC153906B73765A74A99DD4A74CECFA8F4F.gpg,$HOME/scripts/netdata/6588FDD7B14721FE7C3115E6F9177B5265F56346.gpg")
    #
    # Testing:
    lopts+=("--keyring=$HOME/scripts/netdata/6E155DC153906B73765A74A99DD4A74CECFA8F4F.gpg")
    lopts+=("--keyring=$HOME/scripts/netdata/6588FDD7B14721FE7C3115E6F9177B5265F56346.gpg")
    #
    #
    lopts+=("--omit-suite-symlinks")

    # Must use the patched Version of debmirror
    $HOME/debmirror \
           ${lopts[*]} \
           --exclude='pool/netdata_0\.97\..*_.*.deb' \
           --exclude='pool/netdata_0\.97-.*_.*.deb' \
           --exclude='pool/netdata_0\.98\..*_.*.deb' \
           --exclude='pool/netdata_0\.98-.*_.*.deb' \
           --exclude='pool/netdata_0\.99\..*_.*.deb' \
           --exclude='pool/netdata_0\.99-.*_.*.deb' \
           --exclude='pool/netdata_0\.100\..*_.*.deb' \
           --exclude='pool/netdata_1\.0\..*_.*.deb' \
           --exclude='pool/netdata_1\.1\..*_.*.deb' \
           --exclude='pool/netdata_1\.2\..*_.*.deb' \
           --exclude='pool/netdata_1\.3\..*_.*.deb' \
           --exclude='pool/netdata_1\.4\..*_.*.deb' \
           --exclude='pool/netdata_1\.5\..*_.*.deb' \
           --exclude='pool/netdata_1\.6\..*_.*.deb' \
           --exclude='pool/netdata_1\.7\..*_.*.deb' \
           --exclude='pool/netdata_1\.8\..*_.*.deb' \
           --exclude='pool/netdata_1\.9\..*_.*.deb' \
           --exclude='pool/netdata_1\.10\..*_.*.deb' \
           --exclude='pool/netdata_1\.11\..*_.*.deb' \
           --exclude='pool/netdata_1\.12\..*_.*.deb' \
           --exclude='pool/netdata_1\.13\..*_.*.deb' \
           --exclude='pool/netdata_1\.14\..*_.*.deb' \
           --exclude='pool/netdata_1\.15\..*_.*.deb' \
           --exclude='pool/netdata_1\.16\..*_.*.deb' \
           --exclude='pool/netdata_1\.17\..*_.*.deb' \
           --exclude='pool/netdata_1\.18\..*_.*.deb' \
           --exclude='pool/netdata_1\.19\..*_.*.deb' \
           --exclude='pool/netdata_1\.20\..*_.*.deb' \
           --exclude='pool/netdata_1\.21\..*_.*.deb' \
           --exclude='pool/netdata_1\.22\..*_.*.deb' \
           --exclude='pool/netdata_1\.23\..*_.*.deb' \
           --exclude='pool/netdata_1\.24\..*_.*.deb' \
           --exclude='pool/netdata_1\.25\..*_.*.deb' \
           --exclude='pool/netdata_1\.26\..*_.*.deb' \
           --exclude='pool/netdata_1\.27\..*_.*.deb' \
           --exclude='pool/netdata_1\.28\..*_.*.deb' \
           --exclude='pool/netdata_1\.29\..*_.*.deb' \
           --exclude='pool/netdata_1\.30\..*_.*.deb' \
           --exclude='pool/netdata_1\.31\..*_.*.deb' \
           --exclude='pool/netdata_1\.32\..*_.*.deb' \
           --exclude='pool/netdata_1\.33\..*_.*.deb' \
           --exclude='pool/netdata_1\.34\..*_.*.deb' \
           --exclude='pool/netdata_1\.35\..*_.*.deb' \
           --exclude='pool/netdata_1\.36\..*_.*.deb' \
           --exclude='pool/netdata_1\.37\..*_.*.deb' \
           --exclude='pool/netdata_1\.38\..*_.*.deb' \
           --exclude='pool/netdata_1\.39\..*_.*.deb' \
           --exclude='pool/netdata_1\.40\..*_.*.deb' \
           --exclude='pool/netdata_1\.41\..*_.*.deb' \
           --exclude='pool/netdata_1\.42\..*_.*.deb' \
           --exclude='pool/netdata_1\.43\..*_.*.deb' \
           --exclude='pool/netdata_1\.44\..*_.*.deb' \
           --exclude='pool/netdata_1\.45\..*_.*.deb' \
           --exclude='pool/netdata_1\.46\..*_.*.deb' \
           --exclude='pool/netdata_1\.47\..*_.*.deb' \
           --exclude='pool/netdata_1\.48\..*_.*.deb' \
           --exclude='pool/netdata_1\.49\..*_.*.deb' \
           --exclude='pool/netdata_1\.50\..*_.*.deb' \
           --exclude='pool/netdata_1\.51\..*_.*.deb' \
           --exclude='pool/netdata_1\.52\..*_.*.deb' \
           --exclude='pool/netdata_1\.53\..*_.*.deb' \
           --exclude='pool/netdata_1\.54\..*_.*.deb' \
           --exclude='pool/netdata_1\.55\..*_.*.deb' \
           --exclude='pool/netdata_1\.56\..*_.*.deb' \
           --exclude='pool/netdata_1\.57\..*_.*.deb' \
           --exclude='pool/netdata_1\.58\..*_.*.deb' \
           --exclude='pool/netdata_1\.59\..*_.*.deb' \
           --exclude='pool/netdata_1\.60\..*_.*.deb' \
           --exclude='pool/netdata_1\.61\..*_.*.deb' \
           --exclude='pool/netdata_1\.62\..*_.*.deb' \
           --exclude='pool/netdata_1\.63\..*_.*.deb' \
           --exclude='pool/netdata_1\.64\..*_.*.deb' \
           --exclude='pool/netdata_1\.65\..*_.*.deb' \
           --exclude='pool/netdata_1\.66\..*_.*.deb' \
           --exclude='pool/netdata_1\.67\..*_.*.deb' \
           --exclude='pool/netdata_1\.68\..*_.*.deb' \
           --exclude='pool/netdata_1\.69\..*_.*.deb' \
           --exclude='pool/netdata_1\.70\..*_.*.deb' \
           --exclude='pool/netdata_1\.71\..*_.*.deb' \
           --exclude='pool/netdata_1\.72\..*_.*.deb' \
           --exclude='pool/netdata_1\.73\..*_.*.deb' \
           --exclude='pool/netdata_1\.74\..*_.*.deb' \
           --exclude='pool/netdata_1\.75\..*_.*.deb' \
           --exclude='pool/netdata_1\.76\..*_.*.deb' \
           --exclude='pool/netdata_1\.77\..*_.*.deb' \
           --exclude='pool/netdata_1\.78\..*_.*.deb' \
           --exclude='pool/netdata_1\.79\..*_.*.deb' \
           --exclude='pool/netdata_1\.80\..*_.*.deb' \
           --user-agent="Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36" \
           /data/debmirror/netdata/${ltype}/${ldist} \
           2>&1 | egrep -v '(Warning: --rsync-extra is not configured to mirror the trace files|This configuration is not recommended)'
}

# Run Synchronizations
sync_netdata "debian" "bookworm" "amd64"
sync_netdata "debian" "trixie" "amd64"
sync_netdata "ubuntu" "noble" "amd64"
