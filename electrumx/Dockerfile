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

COPY ./generate_ssl_cert.sh .
RUN chmod +x generate_ssl_cert.sh

COPY ./entry.sh .
RUN chmod +x entry.sh

ENTRYPOINT ["./entry.sh"]

