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
    instmods vfio-pci
}

# called by dracut
install() {
    inst_hook pre-udev 10 "$moddir/force-pciback.sh"
}