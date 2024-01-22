#!/bin/bash

# Replace 'your_process_name' with the actual process name
PROCESS_NAME="/home/palserver/.steam/SteamApps/common/PalServer/Pal/Binaries/Linux/PalServer-Linux-Tes>"
THRESHOLD_MB=14336   # Set your desired threshold in megabytes
START_SCRIPT="/home/palserver/.steam/SteamApps/common/PalServer/PalServer.sh"

# Use pgrep with -f to match against the entire command line
PIDS=$(pgrep -f "$PROCESS_NAME")

# Initialize MEMORY_USAGE to 0
MEMORY_USAGE=0

# Iterate through each PID and sum up the memory usage
for PID in $PIDS; do
    MEMORY_USAGE=$((MEMORY_USAGE + $(ps -o rss= -p $PID)))
done

if [ "$MEMORY_USAGE" -gt "$THRESHOLD_MB" ]; then
    echo "Memory usage exceeded threshold. Restarting PalWorld server."

    # Iterate through each PID and kill the corresponding process
    for PID in $PIDS; do
        kill $PID
        sleep 5  # Wait for the process to terminate (adjust as needed)
    done

    # Run the start script to restart the PalWorld server
    $START_SCRIPT
else
    echo "Memory usage is within the acceptable range."
fi
