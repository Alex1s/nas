#!/usr/bin/env sh

set -x

smartctl --nocheck standby -i /dev/disk/by-id/wwn-0x5000c5007b1d782b
smartctl --nocheck standby -i /dev/disk/by-id/wwn-0x50014ee211933170
