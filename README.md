*Hey there – I’m Jean-Baptiste, just another developer doing weird things with code. All my projects live on [jterrazz.com](https://jterrazz.com) – complete with backstories and lessons learned. Feel free to poke around – you might just find something useful!*

# Docker Devstation

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
