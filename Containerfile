FROM ubuntu:noble

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y curl openjdk-21-jdk zsh

RUN curl -sLO https://github.com/itzg/rcon-cli/releases/download/1.6.9/rcon-cli_1.6.9_linux_amd64.tar.gz && \
    tar xf rcon-cli_1.6.9_linux_amd64.tar.gz rcon-cli && \
    mv rcon-cli /bin/rcon-cli && \
    rm rcon-cli_1.6.9_linux_amd64.tar.gz

COPY ./bin/ /bin/

RUN useradd -m minecraft

COPY ./overrides /home/minecraft/server

RUN chown -R minecraft:minecraft /home/minecraft

USER minecraft
WORKDIR /home/minecraft/server

RUN curl -sLO https://api.papermc.io/v2/projects/paper/versions/1.21.5/builds/5/downloads/paper-1.21.5-5.jar

CMD exec start paper-1.21.5-5.jar
