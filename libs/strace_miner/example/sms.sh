
#!/bin/bash
LOG_FILE="logs/sms.st"
strace -f -tt -T -r -y -o "$LOG_FILE" "$@"
