FROM quay.io/fedora/fedora-coreos:stable
RUN rpm-ostree cliwrap install-to-root /

ADD https://copr.fedorainfracloud.org/coprs/kwizart/kernel-longterm-6.6/repo/fedora-40/kwizart-kernel-longterm-6.6-fedora-40.repo /etc/yum.repos.d/kernel-longterm-6.6.repo

RUN rpm-ostree override remove kernel kernel-{core,modules,modules-extra} --install kernel-longterm --install kernel-longterm-core --install kernel-longterm-modules --install kernel-longterm-modules-extra

RUN ostree container commit