# Use linux with macos

```bash
alias debian="docker start -i -a $(docker ps -a | grep mylinux | head -1 | cut -f1 | awk '{print $1}')"
alias debian-build="sh /Users/jterrazz/Projects/.utils/my-ubuntu/start.sh"
```
