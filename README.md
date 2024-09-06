# Automated Security Testing Script 

This repository contains a Bash script for automating security testing tasks on a website. The script performs subdomain discovery, live subdomain filtering, URL crawling, XSS vulnerability detection, and XSS payload injection.

## Installation

### Prerequisites

Before running the script, ensure that the following tools are installed:

- `Go` (Golang)
- `subfinder`
- `httpx-toolkit`
- `katana`
- `gf`
- `bxss`

### Install Required Tools

To install all required tools and set up the environment, use the provided `install.sh` script. This script will:

1. Install `Go` if it's not already installed.
2. Install the tools: `subfinder`, `httpx-toolkit`, `katana`, `gf`, and `bxss`.
3. Set up the `.gf` directory with necessary patterns.

#### Steps:

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/phirojshah/Automate-BlindXss.git
   cd Automate-BlindXss
   ```

2. **Run the Installation Script**:
   ```bash
   chmod +x install.sh
   ./install.sh
   ```

## Usage

To run the security testing script:

```bash
./automate_BlindXss.sh
```

When prompted, enter the website URL (e.g., `example.com`). The script will create a directory named after the website (excluding the domain suffix) and store all output files there.

### Directory Structure

After running the script, the following directory structure will be created:

```bash
website-name/
├── subdomains.txt
├── alive_subdomains.txt
├── potential_urls.txt
└── potential_xss_urls.txt
```

## Example

Here is an example of how to use the script:

```bash
./automate_BlindXss.sh.sh example.com
```

When prompted, enter the URL you want to analyze. The script will handle the rest and save the results in a directory named after the website.

## Contributing

If you would like to contribute to this project:

1. Fork the repository.
2. Create a new branch (`git checkout -b feature/YourFeature`).
3. Make your changes and commit them (`git commit -am 'Add new feature'`).
4. Push to the branch (`git push origin feature/YourFeature`).
5. Open a Pull Request.

## License

This project is licensed under the MIT License - see the [LICENSE](./LICENSE) file for details.

