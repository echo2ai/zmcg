#!/bin/bash

# Installation script for zmcg (Zero Multi Config Git)
# Installs zmcg to /usr/local/bin for system-wide usage

set -e

# Colors
GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${BLUE}zmcg - Zero Multi Config Git Installer${NC}"
echo "========================================"
echo ""

# Check if running on macOS
if [[ "$OSTYPE" == "darwin"* ]]; then
    echo -e "${BLUE}macOS detected - this tool is optimized for macOS${NC}"
fi

# Installation directory
INSTALL_DIR="/usr/local/bin"
SCRIPT_NAME="zmcg"

# Check if script exists
if [ ! -f "zmcg" ] && [ ! -f "zmcg.sh" ]; then
    echo -e "${RED}Error: zmcg script not found in current directory${NC}"
    exit 1
fi

# Check permissions
if [ ! -w "$INSTALL_DIR" ]; then
    echo -e "${RED}Error: Need write permission to $INSTALL_DIR${NC}"
    echo "Please run with sudo: sudo ./install.sh"
    exit 1
fi

# Copy script
echo -e "${BLUE}Installing zmcg to $INSTALL_DIR...${NC}"
if [ -f "zmcg" ]; then
    cp zmcg "$INSTALL_DIR/$SCRIPT_NAME"
else
    cp zmcg.sh "$INSTALL_DIR/$SCRIPT_NAME"
fi

# Make executable
chmod +x "$INSTALL_DIR/$SCRIPT_NAME"

echo -e "${GREEN}[✓] Installation complete!${NC}"
echo ""
echo "Quick start:"
echo "  zmcg create       Create a new profile"
echo "  zmcg list         Show all profiles"
echo "  zmcg switch work  Use 'work' profile in current repo"
echo "  zmcg key work     Show public key for 'work' profile"
echo "  zmcg help         Show help"
echo ""
echo "First run: zmcg create"
echo ""