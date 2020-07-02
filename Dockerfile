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

WORKDIR /root
RUN mkdir shared

RUN /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

RUN cd /tmp && git clone https://github.com/radareorg/radare2 && ./radare2/sys/install.sh

RUN apt-get -y install git build-essential libssl-dev zlib1g-dev
RUN apt-get -y install yasm pkg-config libgmp-dev libpcap-dev libbz2-dev

RUN git clone https://github.com/magnumripper/JohnTheRipper -b bleeding-jumbo john
RUN cd john/src && ./configure && make -s clean && make -sj4 && make shell-completion

RUN apt install -y software-properties-common
RUN add-apt-repository -y ppa:deadsnakes/ppa
RUN apt install -y python3-pip

RUN echo "alias python=python3.7 && alias pip=pip3" >> ~/.zshrc
RUN pip3 install virtualenv --upgrade
RUN pip3 install -U objection
RUN apt install -y aapt android-tools-adb default-jdk apktool

WORKDIR /root
USER root
