#!/bin/bash

# called by dracut
check() {
    return 0
}

# called by dracut
depends() {
    return 0
}

# called by dracut
installkernel() {
    instmods xen-pciback
}

# called by dracut
install() {
    inst_hook pre-udev 10 "$moddir/force-pciback.sh"
}