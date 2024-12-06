#!/bin/bash 

set -e  # Exit script if any error occurs
set -x  # Enable debugging, prints each command as it's executed

# Function to install Docker Compose 
function docker_install(){
    echo "Installing Docker Compose..."
    sudo apt update -y && sudo apt install -y docker-compose 
    echo "Docker Compose Installation Complete"  
}

# Function to install Terraform 
function terraform_install(){    
    echo "Adding HashiCorp GPG Key and Repository..." 

    # Ensure wget is installed 
    if ! command -v wget &> /dev/null; then
        echo "wget is getting installed... Installation started..."
        sudo apt install -y wget
    fi 
    
    wget -O - https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
    
    # Add HashiCorp repository
    if ! command -v lsb_release &> /dev/null; then
        echo "Error: lsb release command is not found. Please install it and try again"
        exit 1
    fi 

    # Uncomment the following if using a specific Linux distro (adjust comments as needed)
    # echo "For Linux Mint: Change 'faye' to 'bookworm' manually in the repo file"
    # echo "For Ubuntu: Change the code name to match your release (e.g., 'jammy' for 22.04)"
  
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list > /dev/null
    
    sudo apt update && sudo apt install -y terraform
    echo "Terraform Installation Complete"
}




