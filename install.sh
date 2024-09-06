#!/bin/bash

set -e

# Function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Install Go if not already installed
if ! command_exists go; then
    echo "Go is not installed. Installing Go..."
    # Download and install Go (version 1.20.5 as an example, adjust as needed)
    wget https://golang.org/dl/go1.20.5.linux-amd64.tar.gz
    sudo tar -C /usr/local -xzf go1.20.5.linux-amd64.tar.gz
    export PATH=$PATH:/usr/local/go/bin
    echo "Go installed successfully."
else
    echo "Go is already installed."
fi

# Install subfinder
if ! command_exists subfinder; then
    echo "Installing subfinder..."
    go install github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
else
    echo "subfinder is already installed."
fi

# Install httpx-toolkit
if ! command_exists httpx-toolkit; then
    echo "Installing httpx-toolkit..."
    go install github.com/projectdiscovery/httpx/cmd/httpx@latest
else
    echo "httpx-toolkit is already installed."
fi

# Install katana
if ! command_exists katana; then
    echo "Installing katana..."
    go install github.com/kt3k/katana@latest
else
    echo "katana is already installed."
fi

# Install gf
if ! command_exists gf; then
    echo "Installing gf..."
    go install github.com/tomnomnom/gf@latest
else
    echo "gf is already installed."
fi

# Install bxss
if ! command_exists bxss; then
    echo "Installing bxss..."
    go install github.com/ethicalhackingplayground/bxss@latest
else
    echo "bxss is already installed."
fi

# Create a .gf directory and copy gf patterns
mkdir -p ~/.gf
if [ ! -d "$HOME/.gf" ]; then
    echo "Creating .gf directory and copying patterns..."
    git clone https://github.com/1ndianl33t/Gf-Patterns
    cp Gf-Patterns/*.json ~/.gf
else
    echo ".gf directory already exists."
fi

echo "All tools installed successfully!"

