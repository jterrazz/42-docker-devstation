# Docker-devstation

A docker image packing useful linux packages for developing and debugging software.

## Usage

```bash
docker pull jterrazz/devstation
```

### Automated commands

Add in your `.zshrc`
```bash
SHARED_FOLDER="~/Projects" # Replace this with the local folder that will be accessible inside the machine

alias devstation="docker start -i -a $(docker ps -a | grep devstation | head -1 | cut -f1 | awk '{print $1}')"
alias devstation-spawn="docker run -it -v ${SHARED_FOLDER}:/root jterrazz/devstation zsh"
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
