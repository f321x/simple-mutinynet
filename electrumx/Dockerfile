FROM debian:bookworm-slim

RUN apt update && apt upgrade -y
RUN apt install -y python3 python3-pip git pipx

RUN pipx ensurepath

RUN git clone https://github.com/f321x/electrumx-fork.git
WORKDIR /electrumx-fork
RUN git remote add upstream https://github.com/spesmilo/electrumx
RUN git checkout mutinynet
RUN git pull upstream master --rebase

RUN pipx install .
RUN mkdir -p /data

ENTRYPOINT ["/root/.local/bin/electrumx_server"]

