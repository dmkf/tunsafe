FROM debian:stretch

# Add debian unstable repo for wireguard packages
RUN echo "deb http://deb.debian.org/debian/ unstable main" > /etc/apt/sources.list.d/unstable-wireguard.list && \
 printf 'Package: *\nPin: release a=unstable\nPin-Priority: 90\n' > /etc/apt/preferences.d/limit-unstable

# Install wireguard packges
RUN apt-get update && \
 apt-get install -y --no-install-recommends wireguard-tools iptables nano net-tools procps openresolv && \
 apt-get clean && \
 apt-get -y install clang-6.0  && \
 apt-get -y install unzip

COPY TunSafe-master.zip /TunSafe-master.zip
