#!/bin/bash

# Define paths
GIT_REPO_PATH="/path/to/your/git/repo"  # Replace with the actual path to your Git repository
CONFIGS_PATHS=(
  "/etc/your_config1.conf"
  "/etc/your_config2.conf"
  "/home/matthew/.config/hyprland/hyprland.conf"
  "/home/matthew/.config/otherapp/otherapp.conf"  # Replace with actual paths
  "/home/matthew/.config"  # Entire config directory
  # Add more specific files or directories as necessary
)

# Loop over each config file or directory and copy it to the git repo
for CONFIG_PATH in "${CONFIGS_PATHS[@]}"; do
  # Extract the base name of the path (for directories, it will keep the directory name)
  BASE_NAME=$(basename "$CONFIG_PATH")
  
  # If it's a directory, copy the entire directory
  if [ -d "$CONFIG_PATH" ]; then
    # Create the destination directory in the Git repo
    DEST_PATH="$GIT_REPO_PATH/$BASE_NAME"
    # Copy the directory recursively to the Git repo
    cp -r "$CONFIG_PATH" "$DEST_PATH"
    echo "Copied directory $CONFIG_PATH to $DEST_PATH"
  else
    # If it's a file, copy it to the Git repo
    DEST_PATH="$GIT_REPO_PATH/$BASE_NAME"
    cp "$CONFIG_PATH" "$DEST_PATH"
    echo "Copied file $CONFIG_PATH to $DEST_PATH"
  fi
done

# Navigate to the Git repo and commit changes
cd "$GIT_REPO_PATH" || exit
git add .
git commit -m "Backup config updates"
git push origin main  # Or your desired branch

echo "Configs backed up and pushed to Git"
