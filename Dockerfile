FROM ubuntu:latest
RUN yes | unminimize

RUN apt-get clean
RUN apt-get update
RUN apt-get upgrade --fix-missing

RUN DEBIAN_FRONTEND=noninteractive apt install -y \
	gcc \
	make \
	binutils \
	build-essential \
	tshark \
	linux-source \
	nasm \
	zsh \
	curl \
	git \
	gdb \
	lldb \
	man \
	valgrind \
	vim

WORKDIR ~

RUN /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

RUN cd /tmp && git clone https://github.com/radareorg/radare2 && ./radare2/sys/install.sh

RUN sudo apt-get -y install git build-essential libssl-dev zlib1g-dev
RUN sudo apt-get -y install yasm pkg-config libgmp-dev libpcap-dev libbz2-dev

RUN git clone https://github.com/magnumripper/JohnTheRipper -b bleeding-jumbo john
RUN cd john/src && ./configure && make -s clean && make -sj4 && sudo make shell-completion

RUN mkdir shared
WORKDIR ~/shared
USER root
