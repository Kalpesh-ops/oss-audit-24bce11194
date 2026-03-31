#!/bin/bash
# Script 3: Disk and Permission Auditor
# Author: [Your Name] | Reg No: [Your Reg No]
# Course: Open Source Software | Chosen Software: Linux Kernel
# Purpose: Loops through key system directories and reports permissions and disk usage

# --- List of important system directories to audit ---
DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp" "/boot" "/lib/modules")

echo "========================================================"
echo "         Directory Audit Report — Linux System"
echo "========================================================"
echo ""

# --- Loop through each directory using a for loop ---
for DIR in "${DIRS[@]}"; do
    if [ -d "$DIR" ]; then
        # Extract permissions, owner, and group using ls and awk
        PERMS=$(ls -ld "$DIR" | awk '{print $1}')
        OWNER=$(ls -ld "$DIR" | awk '{print $3}')
        GROUP=$(ls -ld "$DIR" | awk '{print $4}')
        # Get disk usage, suppress permission errors with 2>/dev/null
        SIZE=$(du -sh "$DIR" 2>/dev/null | cut -f1)

        echo "  Directory : $DIR"
        echo "  Size      : $SIZE"
        echo "  Perms     : $PERMS | Owner: $OWNER | Group: $GROUP"
        echo "  ----------------------------------------"
    else
        # Directory doesn't exist on this system
        echo "  $DIR — does not exist on this system"
        echo "  ----------------------------------------"
    fi
done

echo ""
echo "========================================================"
echo "  Linux Kernel Config Directory Check"
echo "========================================================"

# --- Special check: Linux Kernel config/boot directory ---
KERNEL_CONFIG_DIR="/boot"
KERNEL_MODULE_DIR="/lib/modules/$(uname -r)"

for KDIR in "$KERNEL_CONFIG_DIR" "$KERNEL_MODULE_DIR"; do
    if [ -d "$KDIR" ]; then
        KPERMS=$(ls -ld "$KDIR" | awk '{print $1, $3, $4}')
        echo "  $KDIR => $KPERMS"
        echo "  (This is where Linux Kernel images and modules are stored)"
    else
        echo "  $KDIR not found."
    fi
done

echo "========================================================"
