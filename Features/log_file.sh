#!/bin/bash

LOG_FILE="script.log"

log_action() {
    echo "$(date) - $1" >> "$LOG_FILE"
}

log_action "Script started by user $(whoami)"
