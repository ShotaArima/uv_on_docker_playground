FROM debian:bookworm-slim

RUN apt-get update && apt-get install -y curl

RUN curl -LsSf https://astral.sh/uv/install.sh | sh && \
    echo '. $HOME/.cargo/env' >> $HOME/.bashrc

WORKDIR /root/local/app

COPY ./src/app/ ./

RUN . $HOME/.bashrc && uv sync
