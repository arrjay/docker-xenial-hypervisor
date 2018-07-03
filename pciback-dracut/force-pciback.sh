#!/bin/bash

force_pciback() {
  local x
  for x in $(cat "${1}") ; do
    case "${x}" in
      pciback_force=*)
        pcif_args=$( echo "${x}" | sed 's/^pciback_force=//' )
        pcif_dev=$( echo "${pcif_args}" | sed 's/,/ /g' )
        for pcidev in ${pcif_dev} ; do
          if [ -e "/sys/bus/pci/devices/${pcidev}/driver" ] ; then
            curdrv=$(readlink "/sys/bus/pci/devices/${pcidev}/driver")
            curdrv="${curdrv##*/}"
            if [ "${curdrv}" != "pciback" ] ; then
              echo "${pcidev}" > "/sys/bus/pci/devices/${pcidev}/driver/unbind"
              echo "${pcidev}" > "/sys/bus/pci/drivers/pciback/new_slot"
              echo "${pcidev}" > "/sys/bus/pci/drivers/pciback/bind"
            fi
          fi
        done
      ;;
    esac
  done
}

modprobe xen-pciback
force_pciback /proc/cmdline