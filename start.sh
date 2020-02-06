die () {
    echo >&2 "$@"
    exit 1
}

[ "$#" -eq 1 ] || die "1 argument required, $# provided. ./start <SHARED_FOLDER>"

docker run \
  --cap-drop=ALL  \
  --cap-add=SYS_PTRACE \
  --privileged \
  --security-opt seccomp=unconfined \
  --security-opt apparmor=unconfined \
  --rm \
  -it -v $1:/root/shared jterrazz/devstation zsh
