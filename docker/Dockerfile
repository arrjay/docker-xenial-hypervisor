FROM xenial-bootable

MAINTAINER RJ Bergeron <rbergero@gmail.com>

RUN add-apt-repository -m ppa:notarrjay/stretch-xen-on-xenial

RUN apt-get update && \
    env LC_ALL=C DEBIAN_FRONTEND=noninteractive apt-get install -q -y xen-system-amd64