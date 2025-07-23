#!/bin/bash
#
# install-elara-btrfs-fix.sh
#
# This script is part of the LumiOS Project.
# Copyright (C) 2025 [Stratos Petrakogiannis/lazyl1nux]
# https://github.com/lazyl1nux/LumiOS-ElaraAI-Btrfs-Fix
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
# ElaraAI Btrfs GRUB Fix Installer for Debian/Ubuntu Systems


set -e

# --- Configuration ---
PROBER_SCRIPT_NAME="lumi-btrfs-prober"
PROBER_SOURCE_PATH="./${PROBER_SCRIPT_NAME}" # Assumes prober is in the same directory as installer
PROBER_INSTALL_PATH="/etc/grub.d/${PROBER_SCRIPT_NAME}"
LUMIOS_PROJECT_URL="https://github.com/lazyl1nux/LumiOS-ElaraAI-Btrfs-Fix" # Placeholder URL

# --- Functions for Robust Centered Output and Dividers ---
# Use a fixed width for simplicity and robustness across terminals
# This avoids issues with 'tput cols' not being available or behaving differently under sudo/non-interactive shells.
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
print_centered "LumiOS deploys its ElaraAI's smart BTRFS GRUB fix for Debian/Ubuntu systems"
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

# --- Check for Btrfs tools ---
print_centered "Checking for essential Btrfs tools..."
if ! command -v btrfs &> /dev/null || ! command -v lsblk &> /dev/null || ! command -v blkid &> /dev/null; then
    print_centered "Error: Essential Btrfs or system tools (btrfs-progs, util-linux, blkid) are not found."
    print_centered "Please ensure Btrfs filesystem utilities are installed on your system."
    print_centered "For Debian/Ubuntu: sudo apt install btrfs-progs util-linux"
    echo ""
    print_section_divider
    exit 1
fi
print_centered "Essential Btrfs tools confirmed."
echo ""

# --- Copy lumi-btrfs-prober to /etc/grub.d/ ---
print_section_divider
print_centered "Installing ElaraAI's BTRFS prober script..."
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
print_centered "ElaraAI landed in your system and successfully touched your GRUB."
print_centered "Please run 'sudo update-grub', reboot and enjoy your BTRFS installations"
print_centered "from your Debian/Ubuntu system GRUB menu."
echo ""
print_centered "For more information about the LumiOS project and ElaraAI, visit:"
print_centered "$LUMIOS_PROJECT_URL"
print_section_divider
echo ""

print_centered "Installation complete."
echo ""
