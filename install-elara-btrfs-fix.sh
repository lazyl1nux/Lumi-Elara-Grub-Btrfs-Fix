#!/bin/bash
#
# install-elara-btrfs-fix.sh
#
# This script is part of the LumiOS Project.
# Copyright (C) 2025 [Stratos Petrakogiannis/lazyl1nux]
# https://github.com/lazyl1nux/Lumi-Elara-Btrfs-Fix
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program. If not, see <https://www.gnu.org/licenses/>.
#
# Elara Btrfs GRUB Fix Installer for Debian/Ubuntu Systems


set -e

# --- Configuration ---
PROBER_SCRIPT_NAME="lumi-btrfs-prober"
PROBER_SOURCE_PATH="./${PROBER_SCRIPT_NAME}" # Assumes prober is in the same directory as installer
PROBER_INSTALL_PATH="/etc/grub.d/${PROBER_SCRIPT_NAME}"
LUMI_PROJECT_URL="https://github.com/lazyl1nux/Lumi-Elara-Btrfs-Fix" # Correct GitHub URL
CREATOR_NAME="[Stratos Petrakogiannis / lazyl1nux]" # Define your name here

# --- Functions for Robust Centered Output and Dividers ---
# Use a fixed width for simplicity and robustness across terminals
TERMINAL_WIDTH=80

print_centered() {
    local text="$1"
    printf "%*s\n" $(( (${#text} + TERMINAL_WIDTH) / 2 )) "$text"
}

print_section_divider() {
    printf "%${TERMINAL_WIDTH}s\n" "" | tr ' ' '='
}

# --- Installation Start Message ---
print_section_divider
print_centered "Lumi deploys its Elara's smart BTRFS GRUB fix for Debian/Ubuntu systems"
print_section_divider
echo ""

# --- Check for root privileges ---
print_centered "Checking for root privileges..."
if [ "$EUID" -ne 0 ]; then
    print_centered "Error: This script must be run with root privileges."
    print_centered "Please run: sudo ./install-elara-btrfs-fix.sh"
    echo ""
    print_section_divider
    exit 1
fi
print_centered "Root privileges confirmed."
echo ""

# --- Check if prober script exists ---
print_centered "Verifying prober script presence..."
if [ ! -f "$PROBER_SOURCE_PATH" ]; then
    print_centered "Error: The '${PROBER_SCRIPT_NAME}' script was not found in the same directory as this installer."
    print_centered "Please ensure both '${PROBER_SCRIPT_NAME}' and 'install-elara-btrfs-fix.sh' are in the same folder."
    echo ""
    print_section_divider
    exit 1
fi
print_centered "Prober script found."
echo ""

# --- Automated Btrfs Tools Installation ---
print_section_divider
print_centered "Checking for essential Btrfs tools..."
print_section_divider
echo ""

MISSING_TOOLS=()

# Check for btrfs-progs (provides 'btrfs' command)
if ! command -v btrfs &> /dev/null; then
    MISSING_TOOLS+=("btrfs-progs")
fi

# Check for util-linux (provides 'lsblk' and 'blkid')
if ! command -v lsblk &> /dev/null || ! command -v blkid &> /dev/null; then
    MISSING_TOOLS+=("util-linux")
fi

if [ ${#MISSING_TOOLS[@]} -gt 0 ]; then
    print_centered "The following essential tools are missing: ${MISSING_TOOLS[*]}"
    print_centered "These are required for Elara to detect BTRFS systems."
    echo ""
    read -p "$(print_centered "Do you want to install them now? (Y/n): ")" CONFIRM_INSTALL
    echo ""

    if [[ "$CONFIRM_INSTALL" =~ ^[Yy]$ ]]; then
        print_centered "Updating package lists and installing missing tools..."
        sudo apt update && sudo apt install -y "${MISSING_TOOLS[@]}"
        
        # Verify installation
        if ! command -v btrfs &> /dev/null || ! command -v lsblk &> /dev/null || ! command -v blkid &> /dev/null; then
            print_centered "Error: Failed to install all required tools. Please try manually."
            print_centered "For Debian/Ubuntu: sudo apt install btrfs-progs util-linux"
            echo ""
            print_section_divider
            exit 1
        fi
        print_centered "Missing tools installed successfully."
    else
        print_centered "Installation aborted. Essential tools are missing."
        echo ""
        print_section_divider
        exit 1
    fi
else
    print_centered "All essential Btrfs tools are already installed."
fi
echo ""

# --- Copy lumi-btrfs-prober to /etc/grub.d/ ---
print_section_divider
print_centered "Installing Elara's BTRFS prober script..."
print_section_divider
echo ""
print_centered "Copying '${PROBER_SCRIPT_NAME}' to GRUB directory: ${PROBER_INSTALL_PATH}"
sudo cp "$PROBER_SOURCE_PATH" "$PROBER_INSTALL_PATH"
print_centered "Making the prober script executable..."
sudo chmod +x "$PROBER_INSTALL_PATH"
echo ""
print_centered "Installation of prober script complete."
echo ""

# --- Final Success Message ---
print_section_divider
print_centered "Elara, developed by $CREATOR_NAME, landed in your system and successfully touched your GRUB."
print_centered "Please run 'sudo update-grub', reboot and enjoy your BTRFS installations"
print_centered "from your Debian/Ubuntu system GRUB menu."
echo ""
print_centered "For more information about the Lumi project and Elara, visit:"
print_centered "$LUMI_PROJECT_URL"
print_section_divider
echo ""

print_centered "Installation complete."
echo ""
