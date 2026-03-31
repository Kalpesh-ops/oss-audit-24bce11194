# Open Source Software Audit Scripts

## Student Details
- Name: Kalpesh Parashar
- Registration Number: 24BCE11194

## Chosen Software
- Linux Kernel

## Project Overview
This repository contains 5 Bash scripts prepared for an Open Source Software audit activity focused on Linux and the Linux Kernel ecosystem.

## Dependencies
These scripts are intended to run on Linux and require standard shell tools.

### Core Requirements
- Bash shell
- GNU core utilities (echo, cat, ls, awk, grep, tail, du, cut, whoami, date, uname, sleep)

### Additional Commands Used
- lsb_release (used in script 1)
- dpkg and apt-cache (used in script 2; Debian/Ubuntu based systems)

### Install Missing Dependencies (if needed)
For Debian/Ubuntu:
```bash
sudo apt update
sudo apt install -y bash coreutils grep gawk util-linux lsb-release dpkg apt
```

Note:
- Script 2 is Debian/Ubuntu specific because it uses dpkg and apt-cache.
- Script 4 needs access permission to the log file you provide.

## Step 0: Prepare Scripts for Execution
Run these commands once from the project folder:
```bash
cd /path/to/oss-audit-24bce11194
chmod +x script1_system_identity.sh script2_package_inspector.sh script3_disk_permission_auditor.sh script4_log_analyzer.sh script5_manifesto_generator.sh
```

## Script 1: System Identity Report
File: script1_system_identity.sh

### What it does
- Displays a formatted system identity report.
- Shows distribution, kernel version, current user, home directory, uptime, date/time, and Linux Kernel license note.

### Commands it relies on
- uname, whoami, uptime, date, lsb_release, cut

### How to run (Linux)
1. Open terminal in the project directory.
2. Run:
```bash
./script1_system_identity.sh
```

## Script 2: FOSS Package Inspector
File: script2_package_inspector.sh

### What it does
- Builds the current kernel package name using uname.
- Checks whether that package is installed using dpkg.
- If installed, prints package details (name, version, architecture) and additional metadata.
- If not found, prints fallback kernel information using uname.
- Prints open-source philosophy notes.

### Commands it relies on
- uname, dpkg, apt-cache, grep, awk, head

### How to run (Linux)
1. Open terminal in the project directory.
2. Run:
```bash
./script2_package_inspector.sh
```

## Script 3: Disk and Permission Auditor
File: script3_disk_permission_auditor.sh

### What it does
- Audits important system directories:
  - /etc, /var/log, /home, /usr/bin, /tmp, /boot, /lib/modules
- Reports directory size, permissions, owner, and group.
- Performs Linux kernel-related checks for:
  - /boot
  - /lib/modules/$(uname -r)

### Commands it relies on
- ls, awk, du, cut, uname

### How to run (Linux)
1. Open terminal in the project directory.
2. Run:
```bash
./script3_disk_permission_auditor.sh
```

## Script 4: Log File Analyzer
File: script4_log_analyzer.sh

### What it does
- Accepts a log file path as input.
- Accepts an optional keyword (default: error).
- Verifies file existence and non-empty state (with retry logic).
- Counts case-insensitive matches of the keyword in the file.
- Prints the last 5 matching lines.

### Commands it relies on
- grep, tail, sleep

### How to run (Linux)
1. Open terminal in the project directory.
2. Run with default keyword (error):
```bash
./script4_log_analyzer.sh /var/log/syslog
```
3. Run with a custom keyword:
```bash
./script4_log_analyzer.sh /var/log/syslog warning
```

Notes:
- Some systems use /var/log/messages instead of /var/log/syslog.
- You may need elevated permission for protected logs:
```bash
sudo ./script4_log_analyzer.sh /var/log/syslog error
```

## Script 5: Open Source Manifesto Generator
File: script5_manifesto_generator.sh

### What it does
- Runs interactively and asks 3 questions.
- Generates a personalized manifesto text file:
  - manifesto_<username>.txt
- Prints the generated manifesto content and saves it locally.

### Commands it relies on
- read (Bash builtin), whoami, date, cat

### How to run (Linux)
1. Open terminal in the project directory.
2. Run:
```bash
./script5_manifesto_generator.sh
```
3. Answer the three prompts in terminal.
4. Open generated output file:
```bash
cat manifesto_$(whoami).txt
```

## Quick Run Checklist
1. Install dependencies.
2. Give execute permission with chmod +x.
3. Run each script using ./script_name.sh.
4. Use sudo only where log/file permissions require it.

## Suggested Execution Order
1. script1_system_identity.sh
2. script2_package_inspector.sh
3. script3_disk_permission_auditor.sh
4. script4_log_analyzer.sh
5. script5_manifesto_generator.sh
