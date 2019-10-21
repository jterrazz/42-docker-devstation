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
          man \
          nasm \
          curl \
          zsh \
          vim \
          make \
          radare2

RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

WORKDIR /home
USER root
