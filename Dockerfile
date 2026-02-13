FROM ghcr.io/requarks/wiki:2

USER root

RUN apk add --no-cache \
    zsh \
    postgresql-client \
    mysql-client \
    sqlite \
    tar \
    bzip2 \
    xz \
    zstd \
    gzip \
    libarchive-tools \
    zim-tools \
    kiwix-tools \
    pandoc \
    curl \
    wget \
    git \
    jq \
    less \
    nano \
    ca-certificates

# make zsh default shell for node user
RUN chsh -s /bin/zsh node || true

USER node

