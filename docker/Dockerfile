FROM xenial-bootable

MAINTAINER RJ Bergeron <rbergero@gmail.com>

RUN apt-get update && \
    env LC_ALL=C DEBIAN_FRONTEND=noninteractive apt-get install -q -y qemu-kvm libvirt-bin virtinst

RUN mkdir /usr/lib/dracut/modules.d/50pciback-force
ADD pciback-dracut/ /usr/lib/dracut/modules.d/50pciback-force