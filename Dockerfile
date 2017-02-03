FROM ubuntu:16.04

ENV DEBIAN_FRONTEND noninteractive
ENV GOROOT /usr/local/go
ENV PATH /usr/local/go/bin:$PATH

RUN sed -i -e '/^deb-src/d' /etc/apt/sources.list \
    && apt-get update \
    && apt-get install -y software-properties-common \
    && apt-get install -y python-software-properties \
    && apt-get install -y dpkg \
    && apt-get install -y curl \
    && apt-get install -y wget \
    && apt-get install -y net-tools \
    && apt-get install -y openjdk-8-jre-headless \
    && apt-get update \
    && apt-get install -y autoconf \
    && apt-get install -y automake \
    && apt-get install -y autotools-dev \
    && apt-get install -y bison \
    && apt-get install -y build-essential \
    && apt-get install -y debhelper \
    && apt-get install -y debian-archive-keyring \
    && apt-get install -y debootstrap \
    && apt-get install -y devscripts \
    && apt-get install -y dh-make \
    && apt-get install -y dpatch \
    && apt-get install -y fakeroot \
    && apt-get install -y flex \
    && apt-get install -y gcc \
    && apt-get install -y git-core \
    && apt-get install -y iptables-dev \
    && apt-get install -y libatasmart-dev \
    && apt-get install -y libcurl4-gnutls-dev \
    && apt-get install -y libcurl4-openssl-dev \
    && apt-get install -y libdbi0-dev \
    && apt-get install -y libdistro-info-perl \
    && apt-get install -y libesmtp-dev \
    && apt-get install -y libganglia1-dev \
    && apt-get install -y libgcrypt11-dev \
    && apt-get install -y libglib2.0-dev \
    && apt-get install -y libldap2-dev \
    && apt-get install -y libltdl-dev \
    && apt-get install -y libmemcached-dev \
    && apt-get install -y libmicrohttpd-dev \
    && apt-get install -y libmnl-dev \
    && apt-get install -y libmodbus-dev \
    && apt-get install -y libmysqlclient-dev \
    && apt-get install -y libnotify-dev \
    && apt-get install -y libopenipmi-dev \
    && apt-get install -y liboping-dev \
    && apt-get install -y libow-dev \
    && apt-get install -y libpcap-dev \
    && apt-get install -y libperl-dev \
    && apt-get install -y libpq-dev \
    && apt-get install -y libprotobuf-c0-dev \
    && apt-get install -y librabbitmq-dev \
    && apt-get install -y librdkafka-dev \
    && apt-get install -y librrd-dev \
    && apt-get install -y libsensors4-dev \
    && apt-get install -y libsnmp-dev \
    && apt-get install -y libtool \
    && apt-get install -y libudev-dev \
    && apt-get install -y libvarnishapi-dev \
    && apt-get install -y libvirt-dev \
    && apt-get install -y libxml2-dev \
    && apt-get install -y libyajl-dev \
    && apt-get install -y pbuilder \
    && apt-get install -y pkg-config \
    && apt-get install -y po-debconf \
    && apt-get install -y protobuf-c-compiler \
    && apt-get install -y python-dev \
    && apt-get install -y python-pip \
    && apt-get install -y python-virtualenv \
    && apt-get install -y quilt \
    && apt-get update \
    && apt-get clean \
    && apt-get update

LABEL go_version="1.7.4" \
      java_version="1.8"

# golang
RUN cd /tmp \
    && wget https://storage.googleapis.com/golang/go1.7.4.linux-amd64.tar.gz \
    && tar -C /usr/local -xzf go1.7.4.linux-amd64.tar.gz \
    && rm -f go1.7.4.linux-amd64.tar.gz \
    && mkdir -p /var/opt/signalfx-agent-workspace/src \
    && mkdir -p /var/opt/signalfx-agent-workspace/lib \
    && mkdir -p /var/opt/signalfx-agent-workspace/bin

# collectd-all-cleanup
RUN apt-get remove -y --purge build-essential software-properties-common python-software-properties python-pip \
    && apt-get autoremove -y --purge \
    && rm -rf /var/lib/apt/lists/*

# default startup command
CMD ["tail -f /dev/null"]