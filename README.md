# dots
dotfiles for hyprland

Compositor: hyprland
Bar: waybar
Menu: rofi-wayland
File Explorer: ranger


GTK Theme: Materia Dark Compact
Font: RobotoMono Nerd Font Medium 9.75
Icon Theme: tela-circle-icons-blue (dark)

Other:
- htop
- neofetch
- auto-cpufreq

# Installation:
### Install Relevant Packages:
Install yay:
```bash
cd
sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git
sudo chown -R matthew yay
cd yay
makepkg -si
```
Install relevant pacman packages:
```bash
sudo pacman -S --needed waybar htop neofetch tela-circle-icon-theme-blue ttf-roboto-mono-nerd rofi-wayland materia-gtk-theme
```
Install relevant yay packages:
```bash
yay -S auto-cpu-freq
```
## Clone and Install:
Note, the repo must be cloned into /home/matthew/GitHub"
```bash
cd /home/matthew/GitHub
git clone https://github.com/mbapple/dots
cd dots
chmod +x restore_configs.sh
./restore_configs.sh
```

## Backing up configs:
```bash
cd /home/matthew/GitHub/dots
chmod +x backup_configs.sh
./backup_configs.sh
```
Then commit and push.
