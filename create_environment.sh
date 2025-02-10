#!/bin/bash

# Ask for the user's name
read -p "Enter your name: " user_name

# Define the main directory
APP_DIR="submission_reminder_${user_name}"

# Create the main application directory
mkdir -p "$APP_DIR"

# Confirmation message
echo "Directory and file created successfully!"
