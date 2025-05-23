#!/bin/bash

# Full package list
packages=(
  7zip acpi all-repository-fonts arduino-ide ardupilot-mission-planner atool audacity auto-cpufreq
  avrdude balena-etcher base base-devel blender blueman bluez-utils brightnessctl cliphist clipse
  cups darktable dunst efibootmgr exfat-utils f3 firefox firewalld fontforge freecad fwupd genius
  gimp git github-cli github-desktop-bin gparted gramps grim grsync grub gst-plugin-pipewire gtop
  hugin hyprland hyprlock hyprpaper i8kutils inkscape intel-ucode kicad kitty libpulse libqalculate
  libreoffice-fresh libserialport linux linux-firmware linux-lts materia-gtk-theme nano neofetch
  network-manager-applet networkmanager newsboat nm-connection-editor nmap ntfs-3g nwg-drawer
  nwg-look obsidian openscad papirus-icon-theme pavucontrol pipewire pipewire-alsa pipewire-jack
  pipewire-pulse polkit-gnome prusa-slicer python-pandas qt5-wayland ranger reflector rofi-calc
  rofi-emoji rofi-wayland rpi-imager rsync rustdesk scribus sddm shotcut simple-sddm-theme-git
  slurp sof-firmware sof-tools speedcrunch tela-circle-icon-theme-blue terminator ttf-times-new-roman
  unzip vi vim virtualbox virtualbox-guest-utils visual-studio-code-bin vivaldi vlc waybar webcord
  wget wireplumber wlogout xdg-desktop-portal xdg-desktop-portal-gtk xdg-desktop-portal-hyprland
  xorg-xhost xournalpp yay yay-debug zip zram-generator
)

repo_packages=()
aur_packages=()

echo "Checking which packages are in the official repositories..."

for pkg in "${packages[@]}"; do
  if pacman -Si "$pkg" &>/dev/null; then
    repo_packages+=("$pkg")
  else
    aur_packages+=("$pkg")
  fi
done

# Install repo packages
if [ "${#repo_packages[@]}" -ne 0 ]; then
  echo "Installing official repo packages..."
  sudo pacman -S --needed "${repo_packages[@]}"
fi

# Install AUR packages
if [ "${#aur_packages[@]}" -ne 0 ]; then
  echo "Installing AUR packages..."
  yay -S --needed "${aur_packages[@]}"
fi

echo "All done!"

