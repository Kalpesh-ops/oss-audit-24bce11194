#!/bin/bash
# Script 1: System Identity Report
# Author: [Your Name] | Reg No: [Your Reg No]
# Course: Open Source Software | Chosen Software: Linux Kernel
# Purpose: Displays a welcome screen with system information

# --- Variables ---
STUDENT_NAME="[Your Name]"        # Replace with your name
SOFTWARE_CHOICE="Linux Kernel"    # Chosen open source software

# --- Gather System Info using command substitution ---
KERNEL=$(uname -r)                            # Current kernel version
USER_NAME=$(whoami)                           # Logged-in username
HOME_DIR=$HOME                                # Home directory of current user
UPTIME=$(uptime -p)                           # Human-readable uptime
CURRENT_DATE=$(date '+%d %B %Y, %H:%M:%S')   # Current date and time
DISTRO=$(lsb_release -d | cut -f2)           # Linux distribution name
LICENSE="GNU General Public License v2 (GPL v2)"  # Linux Kernel license

# --- Display formatted output ---
echo "========================================================"
echo "         Open Source Audit — $STUDENT_NAME"
echo "========================================================"
echo ""
echo "  Software Under Audit : $SOFTWARE_CHOICE"
echo "  Distribution         : $DISTRO"
echo "  Kernel Version       : $KERNEL"
echo "  Logged-in User       : $USER_NAME"
echo "  Home Directory       : $HOME_DIR"
echo "  System Uptime        : $UPTIME"
echo "  Current Date & Time  : $CURRENT_DATE"
echo ""
echo "--------------------------------------------------------"
echo "  License covering this OS:"
echo "  $LICENSE"
echo ""
echo "  The GPL v2 ensures that the Linux Kernel and any"
echo "  modifications to it remain free and open for everyone."
echo "========================================================"
