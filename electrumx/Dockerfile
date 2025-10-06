FROM debian:bookworm-slim

RUN apt update && apt upgrade -y
RUN apt install -y python3 python3-pip git pipx tini && apt-get clean

RUN pipx ensurepath

RUN git clone https://github.com/f321x/electrumx-fork.git
WORKDIR /electrumx-fork
RUN git checkout mutinynet

RUN pipx install .

COPY ./generate_ssl_cert.sh .
RUN chmod +x generate_ssl_cert.sh

COPY ./entry.sh .
RUN chmod +x entry.sh

# Use tini as ENTRYPOINT
ENTRYPOINT ["/usr/bin/tini", "--"]

# CMD ["tail", "-f"]
CMD ["./entry.sh"]

