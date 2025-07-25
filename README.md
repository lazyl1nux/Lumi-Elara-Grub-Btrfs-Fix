<img width="604" height="597" alt="collage small" src="https://github.com/user-attachments/assets/30001b78-d490-4c88-885e-1bd35e6fb26d" />

# Lumi-Project-Btrfs-GRUB-Fix

Automatically detects and adds Btrfs Linux installations to your GRUB menu on Debian/Ubuntu systems, powered by Elara.

**Our Motto: We break them so you don't!**

---

## 🌟 Welcome to the Lumi Project!

The Lumi Project exists to create a **more humane, intuitive, and effortlessly powerful free and open-source operating system.** Our purpose is to build a Linux experience where **normal, everyday users feel truly at home**, empowered to accomplish their daily tasks and even more advanced operations with unprecedented ease. We believe the operating system should do the heavy lifting, freeing users from the frustration of complex command-line interfaces, endless forum searches, and lost time troubleshooting simple tasks. Lumi is designed for "lazy people" – not those who lack capability, but those who simply want their technology to **just work**, reliably and without fuss. Underneath its welcoming surface, Lumi is built on a robust, powerful Linux architecture, ensuring advanced users still have the flexibility and control they need, whenever they want it.

Within the Lumi Project, **Elara** is your dedicated smart assistant – a friendly, intelligent companion right there in your system. Elara is **NOT an artificial intelligence in the sense of being a creator or autonomous entity.** Instead, she represents the smart logic and helpful algorithms that empower the very reason for Lumi's existence. Elara is your trusted friend in the system, always ready to deploy the clever solutions that embody the Lumi philosophy. She's here to ensure you experience **smart, easy solutions that just work for you**, handling the complexities so you don't have to. Elara makes Lumi truly feel like home.

---

## 💡 About This Tool: Elara's Btrfs GRUB Fix

This specific tool, powered by Elara's intelligent logic, provides an automated fix for a common problem: getting Btrfs-based Linux installations (like Fedora Silverblue, openSUSE, Manjaro, CachyOS, Garuda Linux) to show up correctly in your Debian/Ubuntu GRUB menu.

This solution ensures:
* **Automatic Detection:** Finds your Btrfs Linux installations (by name and partition).
* **Dynamic Kernel Paths:** Correctly identifies the right kernel and initrd paths for each detected OS.
* **Seamless Integration:** Works with your standard `sudo update-grub` command.
* **Zero-Effort Maintenance:** Automatically updates your GRUB menu if you add or remove Btrfs OSes in the future.
* **No more manual GRUB edits for Btrfs entries!**

---

## 📦 What's Inside This Repository?

* `install-elara-btrfs-fix.sh`: **The Installer Script.** You will download and run this script to set up the fix on your system.
* `lumi_btrfs_prober`: The core script that intelligently detects your Btrfs systems, identifies their names and kernel paths, and generates the necessary GRUB entries. This script will be placed in `/etc/grub.d/` by the installer.
* `INSTRUCTIONS.txt`: Detailed, user-friendly instructions to guide you through the entire process.

---

## 🚀 Installation Steps (Easy as 1-2-3!)

Follow these simple steps to get Elara's Btrfs GRUB Fix working on your Debian/Ubuntu system.

**Step 1: Download the Files**
* Click the green **"Code"** button on this GitHub page.
* Select **"Download ZIP"**.
* Unzip the downloaded file to a folder on your computer (e.g., `~/Downloads/Lumi-Project-Btrfs-GRUB-Fix`).

**Step 2: Open Your Terminal**
* Navigate to the folder where you unzipped the files. For example:
    ```bash
    cd ~/Downloads/Lumi-Project-Btrfs-GRUB-Fix
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

After the installer finishes, Elara has touched your GRUB configuration. Now, you need to tell your system to update its boot menu.

**Step 5: Update GRUB**
* Type this command in your terminal:
    ```bash
    sudo update-grub
    ```
    You will see normal system output from `update-grub`. This process will now include your Btrfs installations, detected by Elara.

**Step 6: Reboot and Enjoy!**
* Once `sudo update-grub` completes, simply reboot your computer:
    ```bash
    sudo reboot
    ```
* When your computer starts up, you will see a new entry in your GRUB menu: **"LumiOS Btrfs Detected OSes"**.
* Inside this submenu, you will find your Btrfs installations (like CachyOS, Manjaro Linux, etc.), perfectly named and ready to boot!

---

## ⚠️ Important Notes:

* This fix is designed for **Debian/Ubuntu-based systems**.
* If you add or remove Btrfs operating systems in the future, simply run `sudo update-grub` again, and Elara will automatically update your menu.
* This script fixes the GRUB entries; it **cannot fix underlying OS corruption** (e.g., if a Btrfs OS has a broken `/etc/fstab` or corrupted core files, our script will list it, but the OS itself might still fail to boot).
* If you encounter any issues, please report them to help us improve!

---

## 💖 Support the Lumi Project

This tool is a result of dedicated effort to make Linux more human. If Elara has saved you time and frustration, please consider supporting the Lumi Project!

* `https://ko-fi.com/lazyl1nux`

---

## 📜 License

This project is licensed under the **GNU General Public License v3.0**. See the `LICENSE` file for details.

---

## 👤 Creators

Developed by **[Stratos Petrakogiannis / lazyl1nux]** as part of the Lumi Project, with assistance from Google's Gemini AI.

---

**For more information about the Lumi Project and Elara, visit this repository's main page.**

Thank you for being part of the Lumi journey!
