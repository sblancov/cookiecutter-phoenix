FROM elixir:slim

# hadolint ignore=DL3008
RUN apt-get update && \
    apt-get install --no-install-recommends -y inotify-tools && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    useradd -ms /bin/bash phoenix

USER phoenix
WORKDIR /app

RUN mix local.hex --force && \
    mix archive.install hex phx_new --force
