# Docker-devstation

A docker image packing useful linux packages for developing and debugging software.

## Usage

```bash
docker pull jterrazz/devstation-ubuntu
```

### With automated commands

1. Add in your `.zshrc`

```bash

SHARED_FOLDER="~/Projects" # Replace this with the local folder that will be accessible inside the machine

alias devstation="docker start -i -a $(docker ps -a | grep jterrazz/devstation-ubuntu | head -1 | cut -f1 | awk '{print $1}')"
alias devstation-spawn="docker run -it -v ${SHARED_FOLDER}:/home jterrazz/devstation-ubuntu zsh"
```

2. Restart your terminal or type `source ~/.zshrc`

3. Everything is ready !

```bash
devstation-spawn # Start a new instance of the virutal machine and attach the terminal
devstation # Restart the last devstation process
```

### Manual commands

```bash
# Start a new machine
docker run -it -v ${SHARED_FOLDER}:/root jterrazz/devstation zsh # Replace ${SHARED_FOLDER}

# Exit the machine (process not deleted)
exit

# To restart your process
docker ps -a # Shows all the processes + ids
docker start -i -a ${process_id}
```

## Customise the packages

Access the `Dockerfile` file to add any packages you want. Then you can locally build your image using the provided scripts.

## Docker tips

```bash
# Stop all the processes
docker rm $(docker ps -a -q)

# Delete all the images
docker rmi $(docker images -q)
```
