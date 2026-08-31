# New-Fedora-Setup

An automated post-install setup script for **Fedora Linux**, built to save 
time after a fresh install by handling driver setup, dev environment, 
essential apps, and cleanup — all in one run.

## Who is this for?

- Fedora users doing a **fresh install** who don't want to repeat the same 
  setup steps manually every time
- Developers who need a **ready-to-code environment** (VS Code, Git, C/C++ 
  build tools) right after install
- Users with an **Nvidia GPU** who need drivers configured correctly
- Privacy-conscious users — comes with Mullvad VPN, Mullvad Browser, and 
  KeePassXC pre-installed

## Why this script exists

Setting up Fedora from scratch usually means repeating 20+ manual steps: 
adding repos, installing drivers, remembering which apps you always use. 
This script automates all of that into one command — so a fresh Fedora 
install becomes a fully working, developer-ready system in minutes instead 
of hours.

## ⚠️ Before you run it

This script is based on my personal setup. Please read it before running:
- It **removes** LibreOffice and Firefox by default
- It installs **Nvidia drivers** (skip that part if you don't have an 
  Nvidia GPU)
- Feel free to comment out anything you don't need

## What it installs

🎮 **GPU Drivers** — Nvidia (RPM Fusion, akmod-nvidia, CUDA)

💻 **Development** — VS Code, Git, GCC/G++, development-tools group

🔒 **Security & Privacy** — KeePassXC, Mullvad VPN, Mullvad Browser

🌐 **Browsers** — Brave (origin build), LibreWolf, Chromium

📦 **Virtualization** — VirtualBox

🧩 **Productivity (Flatpak)** — Obsidian, Signal, Discord, TickTick, 
SyncThingy, Standard Notes, OnlyOffice, Dialect, LocalTranslate

🔤 **Fonts** — JetBrains Mono, Google Noto Fonts (full set)

🎬 **Media** — Multimedia codec group, gThumb

## How to run


- cd Downloads
- chmod +x new-fedora-setup.sh
- ./new-fedora-setup.sh

## License

Feel free to use, modify, or fork this for your own setup.