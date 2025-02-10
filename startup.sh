#!/bin/bash

# Define variables
APP_SCRIPT="reminder.sh"  # Name of the script to run
APP_DIR="app"  # Directory where the script is located
LOG_FILE="$APP_DIR/app.log"

# Function to check if the app is already running
is_running() {
    pgrep -f "$APP_SCRIPT" > /dev/null 2>&1
}

# Ensure the app directory exists
if [ ! -d "$APP_DIR" ]; then
    echo "Error: Directory '$APP_DIR' does not exist."
    exit 1
fi

# Change to the app directory
cd "$APP_DIR" || exit 1

# Ensure the script is executable
if [ ! -x "$APP_SCRIPT" ]; then
    echo "Making '$APP_SCRIPT' executable..."
    chmod +x "$APP_SCRIPT"
fi

# Ensure log file exists
touch "$LOG_FILE"

# Check if the app is already running
if is_running; then
    echo "$APP_SCRIPT is already running."
    exit 1
else
    echo "Starting $APP_SCRIPT..."
    nohup "./$APP_SCRIPT" >> "$LOG_FILE" 2>&1 &
    echo "$APP_SCRIPT started. Check $LOG_FILE for logs."
fi

