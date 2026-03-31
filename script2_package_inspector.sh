#!/bin/bash
# Script 2: FOSS Package Inspector
# Author: [Your Name] | Reg No: [Your Reg No]
# Course: Open Source Software | Chosen Software: Linux Kernel
# Purpose: Checks if a package is installed and prints its details and philosophy

# --- Define the package to inspect ---
PACKAGE="linux-image-$(uname -r)"   # Dynamically gets current kernel package name

# --- Check if the package is installed using dpkg (Debian/Ubuntu) ---
if dpkg -l "$PACKAGE" &>/dev/null; then
    echo "--------------------------------------"
    echo " Package '$PACKAGE' is installed."
    echo "--------------------------------------"
    # Display version, description from dpkg
    dpkg -l "$PACKAGE" | grep -E '^ii' | awk '{print "  Package : "$2"\n  Version : "$3"\n  Arch    : "$4}'
    echo ""
    echo "  Additional Info:"
    apt-cache show "$PACKAGE" 2>/dev/null | grep -E 'Version|License|Description' | head -5
else
    echo "Package '$PACKAGE' is NOT found via dpkg."
    echo "Note: On Ubuntu, the Linux Kernel is part of the base OS."
    echo "Showing kernel info via uname instead:"
    echo "  Kernel Release : $(uname -r)"
    echo "  Kernel Version : $(uname -v)"
    echo "  Architecture   : $(uname -m)"
fi

echo ""
echo "--------------------------------------"
echo " Open Source Philosophy Notes"
echo "--------------------------------------"

# --- Case statement: prints philosophy note based on package/software name ---
case "linux" in
    linux)
        echo "  Linux Kernel: The foundation of the open-source world."
        echo "  Started by Linus Torvalds in 1991 as a free Unix-like OS."
        echo "  Licensed under GPL v2 — all modifications must remain open."
        ;;
    apache2 | httpd)
        echo "  Apache: The web server that helped build the open internet."
        ;;
    mysql | mariadb)
        echo "  MySQL/MariaDB: Open source at the heart of millions of apps."
        ;;
    firefox)
        echo "  Firefox: A nonprofit's fight to keep the web open and free."
        ;;
    vlc)
        echo "  VLC: Born in a university dorm — plays anything, free forever."
        ;;
    python3 | python)
        echo "  Python: A language grown entirely by its community."
        ;;
    git)
        echo "  Git: Built by Linus when proprietary tools failed the kernel project."
        ;;
    *)
        echo "  Open source software: Built openly, shared freely."
        ;;
esac

echo "--------------------------------------"
