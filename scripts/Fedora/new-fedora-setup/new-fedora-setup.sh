#!/bin/bash
set -e # If an command fails, the script stops.

# ---- Remove Default Apps ----
echo "Removing packages..."
sudo dnf remove 'libreoffice*' -y
# sudo dnf remove firefox -y

# ---- Remove Default Apps ----
echo "Updating system..."
sudo dnf upgrade --refresh -y

# ---- Nvidia Drivers ----
echo "Installing NVIDIA drivers..."
sudo dnf install \
https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y
sudo dnf install gcc automake -y
sudo dnf install akmod-nvidia -y
sudo dnf install xorg-x11-drv-nvidia-cuda -y
sudo akmods
sudo dracut -f

# ---- Development Tools ----
echo "Installing development tools..."

## Visual Studio Code
echo "Installing Visual Studio Code..."

sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\nautorefresh=1\ntype=rpm-md\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/vscode.repo > /dev/null
sudo dnf install -y code

## Development Packages
echo "Installing development packages..."

sudo dnf group install -y "development-tools"
sudo dnf install -y \
    gcc-c++ \
    cmake \
    ninja-build \
    gdb \
    git \
    gh

# ---- Packages & Programs ----
echo "Installing applications..."

sudo dnf group install multimedia -y
sudo dnf install -y \
	keepassxc \
	gthumb
	#gnome-tweaks

## Brave Browser
sudo dnf install dnf-plugins-core -y
sudo dnf config-manager addrepo --from-repofile=https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo -y
sudo dnf install brave-origin -y

## Mullvad VPN
sudo dnf config-manager addrepo --from-repofile=https://repository.mullvad.net/rpm/stable/mullvad.repo -y
sudo dnf install mullvad-vpn -y

## Mullvad Browser
sudo dnf install mullvad-browser -y

## VirtualBox
sudo dnf install kernel-devel kernel-headers dkms elfutils-libelf-devel qt5-qtx11extras -y
sudo dnf install VirtualBox -y
sudo usermod -aG vboxusers $USER

## Flatpak Apps
echo "Installing Flatpak applications..."
# flatpak install flathub com.mattjakeman.ExtensionManager -y
flatpak install flathub md.obsidian.Obsidian -y
flatpak install flathub org.signal.Signal -y
flatpak install flathub app.drey.Dialect -y
flatpak install flathub dev.ters.LocalTranslate -y
flatpak install flathub com.discordapp.Discord -y
flatpak install flathub com.ticktick.TickTick -y
flatpak install flathub com.github.zocker_160.SyncThingy -y
flatpak install flathub org.standardnotes.standardnotes -y
flatpak install flathub io.gitlab.librewolf-community -y
flatpak install flathub org.onlyoffice.desktopeditors -y
flatpak install flathub org.chromium.Chromium -y
flatpak update -y

# ---- Fonts ----
echo "Intalling fonts..."
sudo dnf install jetbrains-mono-fonts -y
sudo dnf install -y google-noto-fonts-all

sudo fc-cache -f -v

# ---- Cleanup ----
echo "Cleaning up..."

sudo dnf autoremove -y

echo "Setup complete!"
