#!/bin/bash

#
# This script cooks the required packages and configuration into
# the disk image.
#

ROOT=`pwd`/..
OPENSUSE=$ROOT/thirdparty/bootstrap/opensuse
UPDATE=$ROOT/updaterzip
BASYS=$OPENSUSE/build/disk


cd $OPENSUSE/build

if [ ! -d disk ]; then
    echo "STOP: Disk directory does not exist.  Run ./deploy first."
    exit 1
fi

if [ $UID -ne 0 ]; then
    echo "STOP: This script must be run as root."
    exit 1
fi

echo "Copying pakcages from $OPENSUSE/packages/tf300 into $BASYS"
cd $OPENSUSE/packages/tf300

cp -pr * $BASYS