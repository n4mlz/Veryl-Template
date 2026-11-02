FROM rust:1-slim

ENV DEBIAN_FRONTEND=noninteractive
ENV PATH="/usr/local/cargo/bin:${PATH}"

RUN apt-get update \
 && apt-get install -y --no-install-recommends \
      build-essential \
      ca-certificates \
      git \
 && rm -rf /var/lib/apt/lists/*

# Install the official Veryl toolchain manager and its default compiler.
RUN cargo install verylup --locked \
 && verylup setup

WORKDIR /workspace
