#!/bin/bash

INSTALL_DIR="$HOME/.pokefetch"

# --- COLORS ---
GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${BLUE}🗑  Uninstalling pokefetch...${NC}"

# 1. Remove the directory
if [ -d "$INSTALL_DIR" ]; then
    rm -rf "$INSTALL_DIR"
    echo -e "✅ Removed directory: $INSTALL_DIR"
else
    echo -e "⚠️  Directory not found, skipping."
fi

# 2. Detect Shell Config (Same logic as install.sh)
SHELL_CONFIG=""
case "$SHELL" in
    */zsh)
        SHELL_CONFIG="$HOME/.zshrc"
    ;;
    */bash)
        if [ -f "$HOME/.bashrc" ]; then
            SHELL_CONFIG="$HOME/.bashrc"
        else
            SHELL_CONFIG="$HOME/.bash_profile"
        fi
    ;;
esac

# 3. Remove configuration from Shell Config
if [ -n "$SHELL_CONFIG" ] && [ -f "$SHELL_CONFIG" ]; then
    # Check if the config actually exists in the file
    if grep -q "# --- pokefetch configuration ---" "$SHELL_CONFIG"; then
        echo -e "${BLUE}🔧 Removing configuration from $SHELL_CONFIG...${NC}"
        
        # Create a backup just in case
        cp "$SHELL_CONFIG" "$SHELL_CONFIG.bak"
        echo -e "📦 Backup created at $SHELL_CONFIG.bak"
        
        # Use sed to delete the block.
        # We use a temp file approach to be 100% compatible with both macOS (BSD) and Linux (GNU) sed.
        sed '/# --- pokefetch configuration ---/,/# -----------------------------/d' "$SHELL_CONFIG" > "$SHELL_CONFIG.tmp" && mv "$SHELL_CONFIG.tmp" "$SHELL_CONFIG"
        
        echo -e "✅ Configuration removed from $SHELL_CONFIG"
    else
        echo -e "ℹ️  No pokefetch configuration found in $SHELL_CONFIG"
    fi
else
    echo -e "${RED}❌ Could not detect shell config file. Please check .zshrc or .bashrc manually.${NC}"
fi

echo -e "${GREEN}🎉 Uninstallation Complete!${NC}"
echo -e "Please restart your terminal to ensure the command is gone."