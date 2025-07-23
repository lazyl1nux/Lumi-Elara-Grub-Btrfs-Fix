        <img width="604" height="597" alt="collage small" src="https://github.com/user-attachments/assets/30001b78-d490-4c88-885e-1bd35e6fb26d" />

# LumiOS-ElaraAI-Btrfs-Fix


Automatically detects and adds Btrfs Linux installations to your GRUB menu on Debian/Ubuntu systems, powered by ElaraAI.

**Our Motto: We break them so you don't!**

---

## 🌟 Welcome to the LumiOS Project!

This tool, powered by **ElaraAI**, provides an intelligent fix for Debian/Ubuntu-based systems to automatically detect and manage BTRFS (Btrfs) operating systems in your GRUB boot menu.

Are you a multi-boot Linux user on a Debian/Ubuntu system, frustrated by Btrfs installations not appearing in your GRUB menu? Tired of manual edits or complex command-line troubleshooting? ElaraAI is here to help!

This solution ensures:
* **Automatic Detection:** Finds your Btrfs Linux installations (like Fedora Silverblue, openSUSE, Manjaro, CachyOS, Garuda Linux, etc.).
* **Correct Naming:** Displays them in your GRUB menu with their proper distribution names.
* **Seamless Integration:** Works with your standard `sudo update-grub` command.
* **Zero-Effort Maintenance:** Automatically updates your GRUB menu if you add or remove Btrfs OSes in the future.

---

## 📦 What's Inside This Repository?

* `install-elara-btrfs-fix.sh`: **The Installer Script.** You will download and run this script to set up the fix on your system.
* `lumi_btrfs_prober`: The core script that intelligently detects your Btrfs systems, identifies their names and kernel paths, and generates the necessary GRUB entries. This script will be placed in `/etc/grub.d/` by the installer.
* `INSTRUCTIONS.txt`: Detailed, user-friendly instructions to guide you through the entire process.

---

## 🚀 Installation Steps (Easy as 1-2-3!)

Follow these simple steps to get ElaraAI's Btrfs GRUB Fix working on your Debian/Ubuntu system.

**Step 1: Download the Files**
* Click the green **"Code"** button on this GitHub page.
* Select **"Download ZIP"**.
* Unzip the downloaded file to a folder on your computer (e.g., `~/Downloads/ElaraAI-Btrfs-Fix`).

**Step 2: Open Your Terminal**
* Navigate to the folder where you unzipped the files. For example:
    ```bash
    cd ~/Downloads/ElaraAI-Btrfs-Fix
    ```

**Step 3: Make the Installer Executable**
* Before running, you need to give the installer permission to execute. Type this command in your terminal:
    ```bash
    chmod +x ./install-elara-btrfs-fix.sh
    ```

**Step 4: Run the Installer**
* Now, run the installer with administrator privileges. Type this command:
    ```bash
    sudo ./install-elara-btrfs-fix.sh
    ```
    Follow any on-screen prompts. The installer will copy the necessary files and confirm when it's done.

---

## ✨ Finalizing Your GRUB Menu

After the installer finishes, ElaraAI has touched your GRUB configuration. Now, you need to tell your system to update its boot menu.

**Step 5: Update GRUB**
* Type this command in your terminal:
    ```bash
    sudo update-grub
    ```
    You will see normal system output from `update-grub`. This process will now include your Btrfs installations, detected by ElaraAI.

**Step 6: Reboot and Enjoy!**
* Once `sudo update-grub` completes, simply reboot your computer:
    ```bash
    sudo reboot
    ```
* When your computer starts up, you will see a new entry in your GRUB menu: **"LumiOS Btrfs Detected OSes"**.
* Inside this submenu, you will find your Btrfs installations (like CachyOS, Garuda Linux, Manjaro Linux, etc.), perfectly named and ready to boot!

---

## ⚠️ Important Notes:

* This fix is designed for **Debian/Ubuntu-based systems**.
* If you add or remove Btrfs operating systems in the future, simply run `sudo update-grub` again, and ElaraAI will automatically update your menu.
* This script fixes the GRUB entry for Btrfs systems. It **cannot fix underlying OS corruption** (e.g., if a Btrfs OS has a broken `/etc/fstab` or corrupted core files, our script will list it, but the OS itself might still fail to boot).
* If you encounter any issues, please report them to help us improve!

---

## 💖 Support the LumiOS Project

This tool is a result of dedicated effort to make Linux more human. If ElaraAI has saved you time and frustration, please consider supporting the LumiOS Project!

* ** https://ko-fi.com/lazyl1nux **

---

## 📜 License

This project is licensed under the **GNU General Public License v3.0**. See the `LICENSE` file for details.

---

## 👤 Creators

Developed by **[Stratos Petrakogiannis / lazyl1nux]** as part of the LumiOS Project, with assistance from Google's Gemini AI.

---

**For more information about the LumiOS project and ElaraAI, visit this repository's main page.**

Thank you for being part of the LumiOS journey!
