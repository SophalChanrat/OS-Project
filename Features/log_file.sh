#!/bin/bash

LOG_FILE="$HOME/script.log"

log_action() {
	local message="$1"
	local timestamp="$(date '+%Y-%m-%d %H:%M:%S')"

    	echo "[$timestamp] - $message" >> "$LOG_FILE"
}

