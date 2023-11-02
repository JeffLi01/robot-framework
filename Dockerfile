FROM ubuntu:20.04

# Set up working locales and upgrade the base image
ENV LANG="C.UTF-8"

ARG UBUNTU_MIRROR

RUN { [ ! "$UBUNTU_MIRROR" ] || sed -i "s|http://\(\w*\.\)*archive\.ubuntu\.com/ubuntu/\? |$UBUNTU_MIRROR |" /etc/apt/sources.list; } && \
    apt-get -q update && \
    apt-get -q dist-upgrade -y && \
    DEBIAN_FRONTEND=noninteractive \
        apt-get -q install --no-install-recommends -y ca-certificates git locales lsb-release python3
RUN DEBIAN_FRONTEND=noninteractive apt-get -q install --no-install-recommends -y python3-pip

RUN python3 -m pip install robotframework==6.1.1
