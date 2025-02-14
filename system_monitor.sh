#!/bin/bash

# Set warning limits
CPU_THRESHOLD=80
MEM_THRESHOLD=80
DISK_THRESHOLD=90
EMAIL="mohamedelazgy00@gmail.com"

# Get current values
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
MEM_USAGE=$(free | grep Mem | awk '{print $3/$2 * 100.0}')
DISK_USAGE=$(df / | awk 'NR==2 {print $5}' | sed 's/%//')

# Check CPU
if (( $(echo "$CPU_USAGE > $CPU_THRESHOLD" | bc -l) )); then
    echo "⚠️ CPU usage is high: $CPU_USAGE%" | mail -s "CPU Alert" $EMAIL
fi

#  Check RAM
if (( $(echo "$MEM_USAGE > $MEM_THRESHOLD" | bc -l) )); then
    echo "⚠️ Memory usage is high: $MEM_USAGE%" | mail -s "Memory Alert" $EMAIL
fi

# Check Disk
if (( "$DISK_USAGE" > "$DISK_THRESHOLD" )); then
    echo "⚠️ Disk usage is high: $DISK_USAGE%" | mail -s "Disk Alert" $EMAIL
fi
