#!/bin/bash

# Function to install Homebrew if it's not already installed
install_homebrew() {
  if ! command -v brew &> /dev/null; then
    echo "Homebrew is not installed. Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    if [ $? -eq 0 ]; then
      echo "Homebrew installation successful."
    else
      echo "Failed to install Homebrew. Please install it manually and then run this script again."
      exit 1
    fi
  fi
}

# Function to install an application using Homebrew Cask
install_app() {
  app_name="$1"
  if brew list --cask --versions "$app_name" &> /dev/null; then
    echo "$app_name is already installed."
  else
    brew install --cask "$app_name"
  fi
}

# Install Homebrew if not installed
install_homebrew

# Application installation with Homebrew Cask
install_app "google-chrome"
install_app "arc"
install_app "visual-studio-code"
install_app "rectangle"
install_app "dato"
install_app "raycast"
install_app "bitwarden"
install_app "github"    
install_app "github-cli"  
install_app "warp"      
install_app "docker"    
install_app "notion"    
install_app "spotify"   
install_app "whatsapp"
install_app "zsh"

# Add more applications here if needed

# Install Node Version Manager (NVM)
if ! command -v nvm &> /dev/null; then
  echo "Node Version Manager (NVM) is not installed. Installing NVM..."
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
  source ~/.nvm/nvm.sh
  echo "NVM installation successful."
fi

echo "Application installation completed."

# Configure keyboard key repeat settings
defaults write NSGlobalDomain KeyRepeat -int 1
defaults write NSGlobalDomain InitialKeyRepeat -int 10

# Restart the SystemUIServer for changes to take effect
killall SystemUIServer
