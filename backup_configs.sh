#!/bin/bash

# Define paths
GIT_REPO_PATH="/home/matthew/GitHub/dots" # Replace with the actual path to your Git repository
CONFIGS_PATHS=(
  "/etc/sddm.conf.d/theme.conf.user"
  "/usr/share/sddm/themes/simple-sddm"
  "/home/matthew/.config/hypr"
  "/home/matthew/.config/ranger"
  "/home/matthew/.config/xsettingsd" 
  "/home/matthew/.config/nwg-look" 
  "/home/matthew/.config/kitty" 
  "/home/matthew/.config/gtk-2.0" 
  "/home/matthew/.config/gtk-3.0" 
  "/home/matthew/.config/wlogout"
  "/home/matthew/.config/waybar" 
  "/home/matthew/.config/rofi" 
  "/home/matthew/.config/neofetch" 
  "/home/matthew/.bashrc"
  "/home/matthew/.vimrc"
  "/home/matthew/Pictures/background.jpg"
  # Add more specific files or directories as necessary
)

# Loop over each config file or directory and copy it to the git repo
for CONFIG_PATH in "${CONFIGS_PATHS[@]}"; do
  # Extract the base name of the path (for directories, it will keep the directory name)
  BASE_NAME=$(basename "$CONFIG_PATH")
 
  DEST_PATH="$GIT_REPO_PATH$CONFIG_PATH"
  cp -r "$CONFIG_PATH" "$DEST_PATH"
  echo "Copied directory $CONFIG_PATH to $DEST_PATH"
 
  # If it's a directory, copy the entire directory
  #if [ -d "$CONFIG_PATH" ]; then
  #  # Create the destination directory in the Git repo
  #  DEST_PATH="$GIT_REPO_PATH/$BASE_NAME"
  #  # Copy the directory recursively to the Git repo
  #  cp -r "$CONFIG_PATH" "$DEST_PATH"
  #  echo "Copied directory $CONFIG_PATH to $DEST_PATH"
  #Else
  #  # If it's a file, copy it to the Git repo
  #  DEST_PATH="$GIT_REPO_PATH/$BASE_NAME"
  #  cp "$CONFIG_PATH" "$DEST_PATH"
  #  echo "Copied file $CONFIG_PATH to $DEST_PATH"
  #fi
done

# Navigate to the Git repo and commit changes
#cd "$GIT_REPO_PATH" || exit
#git add .
#git commit -m "Backup config updates"
#git push origin main  # Or your desired branch

#echo "Configs backed up and pushed to Git"
