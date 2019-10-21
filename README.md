# Docker-devstation

A docker image packing useful linux packages for software development and debugging.

## Usage

```bash
DEVSTATION_PATH="~/Projects/docker-devstation"

alias devstation="docker start -i -a $(docker ps -a | grep devstation | head -1 | cut -f1 | awk '{print $1}')"
alias devstation-spawn="sh $DEVSTATION_PATH/spawn.sh ~/Projects"
```

# Some tips
```
docker rm $(docker ps -a -q)
docker rmi $(docker images -q)
```
