#!/bin/bash

# Make sure necessary scripts are executable
chmod +x ./app/reminder.sh
chmod +x ./modules/functions.sh

# Source environment variables
source ./config/config.env

# Run the reminder script
./app/reminder.sh

