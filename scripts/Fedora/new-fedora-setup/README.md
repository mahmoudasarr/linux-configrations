# New-Fedora-Setup

An automated post-installation bash script designed to streamline and accelerate the setup process for fresh Fedora Linux installations. It automatically configures hardware drivers, installs development environments, sets up essential privacy-focused applications, and performs system cleanup in a single run.

## Key Features & Use Cases

* **Post-Install Automation:** Eliminates repetitive manual setup tasks following a clean Fedora installation.
* **Developer-Ready:** Configures a full development environment out of the box (VS Code, Git, C/C++ toolchains).
* **Nvidia GPU Support:** Automatically enables RPM Fusion and configures official Nvidia drivers and CUDA libraries.
* **Privacy & Security Focused:** Pre-installs privacy-centric software including Mullvad VPN, Mullvad Browser, and KeePassXC.

## ⚠️ Important Considerations Before Running

This script is tailored to a specific workstation workflow. **Please review the script contents before executing:**

* **Software Removals:** Removes default installations of **LibreOffice** and **Firefox**.
* **Hardware Requirements:** Includes Nvidia GPU driver installation (comment out if using Intel/AMD graphics).
* **Interrupted Updates:** If the system update process halts, reboot your system and re-run the script.
* **Customization:** Feel free to open `new-fedora-setup.sh` and comment out (`#`) any software or steps you do not require.

## Software Stack Included

* **🎮 GPU Drivers:** Nvidia Drivers via RPM Fusion (`akmod-nvidia`), CUDA support
* **💻 Development Tools:** VS Code, Git, GCC/G++, `development-tools` package group
* **🔒 Privacy & Security:** KeePassXC, Mullvad VPN, Mullvad Browser
* **🌐 Web Browsers:** Brave (Official Repo), LibreWolf, Chromium
* **📦 Virtualization:** VirtualBox
* **🧩 Productivity (Flatpak):** Obsidian, Signal, Discord, TickTick, Syncthingy, Standard Notes, ONLYOFFICE, Dialect, LocalTranslate
* **🔤 Typography:** JetBrains Mono, Google Noto Fonts (complete set)
* **🎬 Multimedia:** RPM Fusion Multimedia Codecs, gThumb
* **🛠️ System Utilities:** Extension Manager, GNOME Tweaks

## Installation & Execution

Open your terminal and run the following commands:

```bash
cd ~/Downloads
chmod +x new-fedora-setup.sh
./new-fedora-setup.sh

```

## License

This project is open-source. Feel free to use, modify, or fork it to suit your personal setup requirements.