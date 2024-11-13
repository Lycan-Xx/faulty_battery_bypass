#!/bin/bash

# Define a temporary file to track execution
TEMP_FILE="/tmp/upower_service_executed"
# Define a log file
LOG_FILE="/var/log/upower_service_toggle.log"

# Function to log messages to both console and log file
log() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" | tee -a "$LOG_FILE"
    sleep 0.75 # Delay for 0.75 seconds
}

if [ ! -f "$TEMP_FILE" ]; then
    # First execution: Disable the service
    log "Disabling upower.service..."

    # Rename the service file to disable it
    mv /lib/systemd/system/upower.service /lib/systemd/system/upower.service$disabled$
    log "Moved upower.service to upower.service(disabled)."

    # Reload the systemd manager configuration
    systemctl daemon-reload
    log "Reloaded systemd manager configuration."

    # Stop the upower service
    systemctl stop upower.service
    log "Stopped upower.service."

    # Create the temporary file to indicate the script has been executed
    touch "$TEMP_FILE"
    log "Created temporary file to indicate execution."

else
    # Subsequent execution: Enable the service
    log "Enabling upower.service..."

    # Rename the service file back to its original name
    mv /lib/systemd/system/upower.service$disabled$ /lib/systemd/system/upower.service
    log "Moved upower.service(disabled) back to upower.service."

    # Reload the systemd manager configuration
    systemctl daemon-reload
    log "Reloaded systemd manager configuration."

    # Start the upower service
    systemctl start upower.service
    log "Started upower.service."

    # Optionally, remove the temporary file if you want to reset the state
    rm "$TEMP_FILE"
    log "Removed temporary file indicating execution."
fi
