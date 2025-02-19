#!/bin/bash

# Ask for the user's name
read -p "Enter your name: " user_name

# Define the main application directory
APP_DIR="submission_reminder_${user_name}"

# Define subdirectories and files
SUBDIRS=("app/reminder" "modules" "assets" "config")
FILES=("assets/submissions.txt" "config/config.env" "modules/functions.sh" "reminder.sh" "startup.sh")
FILE_CONTENTS=(
    "student, assignment, submission status
Chinemerem, Shell Navigation, not submitted
Chiagoziem, Git, submitted
Divine, Shell Navigation, not submitted
Anissa, Shell Basics, submitted"
    "# This is the config file
ASSIGNMENT=\"Shell Navigation\"
DAYS_REMAINING=2"
    "#!/bin/bash

# Function to read submissions file and output students who have not submitted
function check_submissions {
    local submissions_file=\$1
    echo \"Checking submissions in \$submissions_file\"

    # Skip the header and iterate through the lines
    while IFS=, read -r student assignment status; do
        # Remove leading and trailing whitespace
        student=\$(echo \"\$student\" | xargs)
        assignment=\$(echo \"\$assignment\" | xargs)
        status=\$(echo \"\$status\" | xargs)

        # Check if assignment matches and status is 'not submitted'
        if [[ \"\$assignment\" == \"\$ASSIGNMENT\" && \"\$status\" == \"not submitted\" ]]; then
            echo \"Reminder: \$student has not submitted the \$ASSIGNMENT assignment!\"
        fi
    done < <(tail -n +2 \"\$submissions_file\") # Skip the header
}"
    "#!/bin/bash

# Source environment variables and helper functions
source ./config/config.env
source ./modules/functions.sh

# Path to the submissions file
submissions_file=\"./assets/submissions.txt\"

# Print remaining time and run the reminder function
echo \"Assignment: \$ASSIGNMENT\"
echo \"Days remaining to submit: \$DAYS_REMAINING days\"
echo \"--------------------------------------------\"

check_submissions \$submissions_file"
    "#!/bin/bash
# Startup script for the reminder app

echo \"Starting the Submission Reminder App...\"
# Add any necessary startup commands here
"
)

# Create the main directory
mkdir -p "$APP_DIR"

# Create subdirectories
for subdir in "${SUBDIRS[@]}"; do
    mkdir -p "$APP_DIR/$subdir"
done

# Create and populate the files
index=0
for file in "${FILES[@]}"; do
    echo "${FILE_CONTENTS[$index]}" > "$APP_DIR/$file"
    ((index++))
done

# Provide a confirmation message
echo "Directory structure and files for 'submission_reminder_${user_name}' created successfully!"
