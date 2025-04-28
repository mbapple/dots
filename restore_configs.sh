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

# Loop over each config file or directory and copy it to the target location
for CONFIG_PATH in "${CONFIGS_PATHS[@]}"; do
  # Extract the base name of the path
  BASE_NAME=$(basename "$CONFIG_PATH")
  
  # Define the source path in the git repo
  SOURCE_PATH="$GIT_REPO_PATH/$BASE_NAME"
  
  # Check if the source file or directory exists in the Git repo
  if [ -e "$SOURCE_PATH" ]; then
    # If it's a directory, copy it recursively
    if [ -d "$SOURCE_PATH" ]; then
      # Overwrite the system directory
      rm -rf "$CONFIG_PATH"  # Remove the existing directory
      cp -r "$SOURCE_PATH" "$CONFIG_PATH"
      echo "Restored directory $SOURCE_PATH to $CONFIG_PATH"
    else
      # If it's a file, overwrite it
      cp -f "$SOURCE_PATH" "$CONFIG_PATH"
      echo "Restored file $SOURCE_PATH to $CONFIG_PATH"
    fi
  else
    echo "Warning: $SOURCE_PATH not found in the Git repo"
  fi
done

echo "Configuration restoration complete!"
