#!/bin/bash
# Script 4: Log File Analyzer
# Author: [Your Name] | Reg No: [Your Reg No]
# Course: Open Source Software | Chosen Software: Linux Kernel
# Purpose: Reads a log file, counts keyword occurrences, and prints matching lines
# Usage: ./script4_log_analyzer.sh /var/log/syslog [keyword]

# --- Accept log file path as first argument ---
LOGFILE=$1
# --- Accept keyword as second argument, default to 'error' if not provided ---
KEYWORD=${2:-"error"}

COUNT=0       # Counter for keyword matches
RETRY=0       # Retry counter for empty file check
MAX_RETRY=3   # Maximum retries

# --- Check if a log file argument was provided ---
if [ -z "$LOGFILE" ]; then
    echo "Usage: $0 <logfile> [keyword]"
    echo "Example: $0 /var/log/syslog error"
    exit 1
fi

# --- Check if the file exists ---
if [ ! -f "$LOGFILE" ]; then
    echo "Error: File '$LOGFILE' not found."
    exit 1
fi

# --- Do-while style retry loop: retry if file is empty ---
while [ $RETRY -lt $MAX_RETRY ]; do
    if [ -s "$LOGFILE" ]; then
        # File has content — break out of retry loop
        break
    else
        RETRY=$((RETRY + 1))
        echo "Warning: '$LOGFILE' appears empty. Retry $RETRY of $MAX_RETRY..."
        sleep 1
    fi
done

# If still empty after retries, exit
if [ ! -s "$LOGFILE" ]; then
    echo "Error: '$LOGFILE' is empty after $MAX_RETRY retries. Exiting."
    exit 1
fi

echo "========================================================"
echo "  Log File Analyzer"
echo "  File    : $LOGFILE"
echo "  Keyword : '$KEYWORD'"
echo "========================================================"

# --- Read file line by line using while-read loop ---
while IFS= read -r LINE; do
    # Check if line contains the keyword (case-insensitive with -i flag)
    if echo "$LINE" | grep -iq "$KEYWORD"; then
        COUNT=$((COUNT + 1))   # Increment counter
    fi
done < "$LOGFILE"

echo ""
echo "  Result: Keyword '$KEYWORD' found $COUNT time(s) in $LOGFILE"
echo ""

# --- Print last 5 matching lines for context ---
echo "  Last 5 matching lines:"
echo "  ----------------------------------------"
grep -i "$KEYWORD" "$LOGFILE" | tail -5 | while IFS= read -r MATCH; do
    echo "  >> $MATCH"
done

echo "========================================================"
