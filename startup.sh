#!/bin/bash

# Define variables
APP_NAME="reminder-app"  # Updated to match the directory name
APP_DIR="reminder-app/"  # Update this to the correct path
LOG_FILE="$APP_DIR/app.log"
PYTHON_EXEC="python3"  # or "python" based on your setup
   
# Function to check if the app is running
is_running() {
    pgrep -f "$APP_NAME" > /dev/null 2>&1
}

# Change to the app directory
cd "$APP_DIR" || { echo "Directory $APP_DIR does not exist."; exit 1; }

# Check if the app is already running
if is_running; then
    echo "$APP_NAME is already running."
    exit 1
else
    echo "Starting $APP_NAME..."
    # Start the Flask app and redirect output to log file
    $PYTHON_EXEC app.py >> "$LOG_FILE" 2>&1 &
    echo "$APP_NAME started. Check $LOG_FILE for output."
fi