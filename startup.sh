#!/bin/bash

# Define variables
APP_SCRIPT="reminder.sh"  # The script to run
APP_DIR="app"  # The directory where the script is located

# Ensure the app directory exists
if [ ! -d "$APP_DIR" ]; then
    echo "Error: Directory '$APP_DIR' does not exist."
    exit 1
fi

# Ensure the script is executable
if [ ! -x "$APP_DIR/$APP_SCRIPT" ]; then
    echo "Making '$APP_SCRIPT' executable..."
    chmod +x "$APP_DIR/$APP_SCRIPT"
fi

# Function to check if the app is already running
is_running() {
    pgrep -f "$APP_SCRIPT" > /dev/null 2>&1
}

# Check if the app is already running
if is_running; then
    echo "$APP_SCRIPT is already running."
    exit 1
else
    echo "Starting $APP_SCRIPT..."
    nohup "$APP_DIR/$APP_SCRIPT" >/dev/null 2>&1 &
    echo "$APP_SCRIPT started successfully!"
fi

