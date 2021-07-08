FROM fedora
RUN yum install iproute iputils curl iptables-utils tcpdump procps-ng -y
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
Entrypoint /entrypoint.sh
