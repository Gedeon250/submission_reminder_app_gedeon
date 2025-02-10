#!/bin/bash

# Ask the user for their name
read -p "Enter your name: " user_name

# Define the main directory
APP_DIR="submission_reminder_${user_name}"

# Create the main application directory
mkdir -p "$APP_DIR/app"

# Create subdirectories inside the app folder
mkdir -p "$APP_DIR/app/logs"
mkdir -p "$APP_DIR/app/data"

# Create required files
touch "$APP_DIR/app/config.env"
touch "$APP_DIR/app/reminder.sh"
touch "$APP_DIR/app/functions.sh"
touch "$APP_DIR/app/startup.sh"
touch "$APP_DIR/app/data/submissions.txt"

# Add default content to submissions.txt
echo -e "Student Name, Assignment, Due Date, Status" > "$APP_DIR/app/data/submissions.txt"
echo -e "Alice, Linux Basics, 2025-02-15, Pending" >> "$APP_DIR/app/data/submissions.txt"
echo -e "Bob, Shell Scripting, 2025-02-18, Submitted" >> "$APP_DIR/app/data/submissions.txt"
echo -e "Charlie, Networking, 2025-02-20, Pending" >> "$APP_DIR/app/data/submissions.txt"
echo -e "David, Git & GitHub, 2025-02-22, Submitted" >> "$APP_DIR/app/data/submissions.txt"
echo -e "Emma, Final Project, 2025-02-25, Pending" >> "$APP_DIR/app/data/submissions.txt"

# Confirm that the environment has been set up
echo "Environment setup complete!"
echo "Your submission reminder app is ready in: $APP_DIR"

