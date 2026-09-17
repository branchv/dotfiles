ARG IMG=debian # `debian` or `alpine`
ARG SRC=remote # `remote` or `local`

# For local changes: docker run --rm -it $(docker build -f .github/Dockerfile -q --build-arg SRC=local .)
FROM scratch AS local
COPY --parents=true .config .github .ssh .vscode .bashrc .hushlogin .pre-commit-config.yaml .prekignore .profile .zprofile /root/
# For remote only: docker run --rm -it $(docker build -f .github/Dockerfile -q .)
FROM scratch AS remote
ADD https://www.google.com/robots.txt /tmp/.cache_buster
FROM "${SRC}" AS src

FROM alpine:latest AS alpine
RUN apk add --no-cache yadm

FROM debian:stable-slim AS debian
ENV PATH="/opt/homebrew/bin:${PATH}"
RUN apt-get update && \
    apt-get install -y build-essential curl git procps yadm && \
    rm -rf /var/lib/apt/lists/*

FROM "${IMG}" AS final
ARG SRC # for cache invalidation
COPY --from=src / /
RUN mkdir -p ~/.cache/fish && touch /.dockerenv ~/.cache/fish/last-updated && \
    yadm clone --bootstrap https://github.com/branchv/dotfiles.git
WORKDIR /root
ENTRYPOINT ["fish", "-il"]
