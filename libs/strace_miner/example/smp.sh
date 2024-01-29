
#!/bin/bash
LOG_FILE="logs/$1_$(hostname)_$$.st"
echo $LOG_FILE
strace -f -tt -T -r -y -o "$LOG_FILE" "$@"
