FROM debian:bookworm-slim

ARG BITCOIN_VERSION="38351585048e"
ARG TRIPLET=${TRIPLET:-"x86_64-linux-gnu"}

RUN  apt-get update && \
     apt-get install -qq --no-install-recommends ca-certificates dirmngr gosu wget libc6 procps python3
WORKDIR /tmp

# install bitcoin binaries
RUN BITCOIN_URL="https://github.com/benthecarman/bitcoin/releases/download/mutinynet-inq-29/bitcoin-${BITCOIN_VERSION}-${TRIPLET}.tar.gz" && \
     BITCOIN_FILE="bitcoin-${BITCOIN_VERSION}-${TRIPLET}.tar.gz" && \
     wget -qO "${BITCOIN_FILE}" "${BITCOIN_URL}" && \
     mkdir -p bin && \
     tar -xzvf "${BITCOIN_FILE}" -C /tmp/bin --strip-components=2 "bitcoin-${BITCOIN_VERSION}/bin/bitcoin-cli" "bitcoin-${BITCOIN_VERSION}/bin/bitcoind" "bitcoin-${BITCOIN_VERSION}/bin/bitcoin-wallet" "bitcoin-${BITCOIN_VERSION}/bin/bitcoin-util"

RUN cp /tmp/bin/* /usr/bin/.

ENTRYPOINT ["bitcoind", "--signet"]
