docker start -i -a $(docker ps -a | grep devstation | head -1 | cut -f1 | awk '{print $1}')
