FROM quay.io/fedora/fedora-coreos:stable
RUN rpm-ostree cliwrap install-to-root /

ADD https://copr.fedorainfracloud.org/coprs/kwizart/kernel-longterm-6.6/repo/fedora-40/kwizart-kernel-longterm-6.6-fedora-40.repo /etc/yum.repos.d/kernel-longterm-6.6.repo

RUN rpm-ostree override remove kernel kernel-{core,modules} --install kernel-longterm --install kernel-longterm-core --install kernel-longterm-modules
RUN rpm-ostree install -y htop iftop iotop mtr iperf3 smartmontools lm_sensors pciutils tcpdump bird kernel-tools https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.111.0/otelcol-contrib_0.111.0_linux_amd64.rpm

RUN ostree container commit