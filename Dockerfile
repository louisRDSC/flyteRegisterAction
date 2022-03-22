FROM ubuntu:latest
RUN apt-get update && apt-get install -y curl && apt-get clean && rm -rf /var/lib/apt/lists/*
RUN curl -sL https://ctl.flyte.org/install | bash -s -- -b /usr/local/bin

FROM alpine:3.8
COPY --from=0 /usr/local/bin /usr/local/bin
RUN export PATH=$(pwd)/bin:$PATH
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

