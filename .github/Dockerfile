FROM debian:latest

RUN apt-get update && \
    apt-get install -y build-essential curl git procps yadm && \
    rm -rf /var/lib/apt/lists/*

RUN useradd -m -u 1000 -s /bin/bash linuxbrew && \
    echo 'linuxbrew ALL=(ALL) NOPASSWD:ALL' >>/etc/sudoers

USER linuxbrew
WORKDIR /home/linuxbrew
ENV PATH="/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin:${PATH}"
RUN HOMEBREW_DEVELOPER=1 yadm clone --bootstrap https://github.com/branchv/dotfiles.git && \
    yadm restore .
ENTRYPOINT ["fish", "-il"]
