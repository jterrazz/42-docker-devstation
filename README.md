> Hey there, app enthusiasts! 👋 Ready to dive into the world of game-changing apps? At [jterrazz.com](https://jterrazz.com), I'm all about crafting useful applications and sharing the journey! Discover coding insights, self-improvement hacks, and sneak peeks of my latest projects (psst... my next app is all about leveling up in life! 🚀). Come along for the ride - you might just find the spark for your next big idea! 💡💻

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
