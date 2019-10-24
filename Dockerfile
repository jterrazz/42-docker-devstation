FROM alpine:latest

RUN apk update
RUN apk upgrade
RUN apk --no-cache add git \
          build-base \
          gdb \
          bash \
          openssl \
          openssh-client \
          valgrind \
          strace \
          ltrace \
          nasm \
          curl \
          zsh \
          vim \
          make \
          radare2 \
          man man-pages mdocml-apropos less less-doc

RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
RUN echo 'export PAGER=less' >> $HOME/.zshrc

WORKDIR /home
USER root
