#!/bin/bash

# Ask for the user's name
read -p "Enter your name: " user_name

# Define the main directory
APP_DIR="submission_reminder_${user_name}"

# Create the main application directory
mkdir -p "$APP_DIR"

# Create the submissions.txt file inside the directory
echo -e "Student, Assignment, Submission Status" > "$APP_DIR/submissions.txt"
echo -e "Chinemerem, Shell Navigation, not submitted" >> "$APP_DIR/submissions.txt"
echo -e "Chiagoziem, Git, submitted" >> "$APP_DIR/submissions.txt"
echo -e "Divine, Shell Navigation, not submitted" >> "$APP_DIR/submissions.txt"
echo -e "Anissa, Shell Basics, submitted" >> "$APP_DIR/submissions.txt"

# Confirmation message
echo "Directory and file created successfully!"
echo "Check inside $APP_DIR for submissions.txt."
