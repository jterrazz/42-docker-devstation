# Docker-devstation

> A docker image packing useful linux packages for **development** and **debugging**.

As long as you have access to docker, this repo will allow you to run / install **any linux packages** with **root privileges**. All that in your usual terminal (mac, windows, linux) without much impact on performances.

Many debug / security packages are included (`radare2`, `gdb`, `john`, `tshark`, etc). But feel free to fork to add your own packages 🤠.

## Usage

```bash
./start <SHARED_FOLDER>
```

### Access it from everywhere

1. Add in your `.zshrc`

```bash
SHARED_FOLDER="~"

alias devstation="\
	docker run \
  --cap-drop=ALL  \
  --cap-add=SYS_PTRACE \
  --privileged \
  --security-opt seccomp=unconfined \
  --security-opt apparmor=unconfined \
  --rm \
  -it -v ${SHARED_FOLDER}:/root/shared jterrazz/devstation zsh
"
```

2. Restart your terminal or type `source ~/.zshrc`

3. Enjoy 😊

```bash
devstation # Start the machine
```

### Build locally

```bash
./build.sh
```

#### Add your own packages

Packages installed during runtime are not saved. You can add permanent packages in the `Dockerfile`. You will have to build the new image after that.

#### Docker shortcuts

```bash
# Stop all processes
docker rm $(docker ps -a -q)

# Delete all images
docker rmi $(docker images -q)
```


apt install software-properties-common // Add no user
add-apt-repository ppa:deadsnakes/ppa // Add no user

apt install python3.7 -y
 // Add no user

apt install python3-pip // Add no user
alias python=python3.7
alias pip=pip3
pip install virtualenv --upgrade

pip3 install -U objection

apt-get install -y aapt
apt-get install android-tools-adb
Apt install default-jdk
Apt install apktool



// Replace the adb from before
apt install -y wget unzip
mkdir ~/Android && cd ~/Android
wget https://dl.google.com/android/repository/platform-tools-latest-linux.zip && unzip platform-tools-latest-linux.zip

// Replqce this one 
echo "alias adb='~/Android/platform-tools/adb'" >> ~/.bash_aliases && source ~/.bash_aliases

// Start with
adb -H host.docker.internal shell



echo "export PATH=\$PATH:/Users/${USER}/Library/Android/sdk/platform-tools/" >> ~/.bash_profile && source ~/.bash_profile




https://corellium.zendesk.com/hc/en-us/articles/360036975613-Using-Frida-with-Android
wget "https://github.com/frida/frida/releases/download/12.7.5/frida-server-12.7.5-android-arm64.xz"
adb connect
adb -H host.docker.internal push frida-server-12.7.5-android-arm64 /data/local/tmp/frida-server
