FROM ubuntu:22.04

COPY --from=ghcr.io/matti/themo-cli:31ebc5653a070ed433200292821dfa5b0f23e863 /themo-cli /usr/local/bin
COPY --from=ghcr.io/matti/e-boerse:533f7db04ebb485253ffdcdd0c45c59014ea3e92 /e-boerse /usr/local/bin

RUN apt-get update && apt-get install -y \
  ca-certificates

WORKDIR /app
COPY app .

ENTRYPOINT [ "/app/entrypoint.sh" ]
