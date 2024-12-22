FROM ubuntu:noble

RUN apt-get update && \
    apt-get install -y curl git zsh && \
    apt-get clean

RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
RUN usermod -s /bin/zsh root
RUN sed -i 's/robbyrussell/aussiegeek/' /root/.zshrc

RUN curl -sLO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
RUN tar -C /opt -xzf nvim-linux64.tar.gz
RUN rm nvim-linux64.tar.gz
RUN ln -s /opt/nvim-linux64/bin/nvim /usr/local/bin
RUN echo EDITOR=nvim >> /root/.zshrc
