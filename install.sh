#!/bin/bash

set -e # Exit immediately if a command exits with a non-zero status

# --- CONFIGURATION ---
REPO_NAME="pokefetch"
REPO_URL="https://github.com/cofy-x/pokefetch.git"
INSTALL_DIR="$HOME/.pokefetch"

# --- COLORS ---
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}🚀 Starting pokefetch installation...${NC}"

# 1. Clean up old installations
if [ -d "$INSTALL_DIR" ]; then
    echo -e "⚠️  Existing directory found. Removing old version..."
    rm -rf "$INSTALL_DIR"
fi

# 2. Clone the repository
echo -e "${BLUE}📦 Cloning repository from GitHub...${NC}"
git clone --depth=1 "$REPO_URL" "$INSTALL_DIR"

# 3. Set permissions
chmod +x "$INSTALL_DIR/pokefetch"

# 4. Detect Shell and configure
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
    *)
        echo "⚠️  Could not detect a standard shell (bash/zsh). You may need to configure your path manually."
    ;;
esac

# 5. Add to PATH and Auto-run
if [ -n "$SHELL_CONFIG" ]; then
    # Check if already configured
    if grep -q "$INSTALL_DIR" "$SHELL_CONFIG"; then
        echo -e "✅ Configuration already exists in $SHELL_CONFIG"
    else
        echo -e "${BLUE}🔧 Updating $SHELL_CONFIG...${NC}"
        echo "" >> "$SHELL_CONFIG"
        echo "# --- pokefetch configuration ---" >> "$SHELL_CONFIG"
        # Add to PATH so user can type 'pokefetch' manually
        echo "export PATH=\"\$PATH:$INSTALL_DIR\"" >> "$SHELL_CONFIG"
        # Run it automatically on startup
        echo "pokefetch" >> "$SHELL_CONFIG"
        echo "# -----------------------------" >> "$SHELL_CONFIG"
        echo -e "✅ Added pokefetch to startup."
    fi
fi

echo -e "${GREEN}🎉 Installation Complete!${NC}"
echo -e "Restart your terminal or run 'source $SHELL_CONFIG' to see your first Pokémon."
echo -e "Tip: You can also type '${BLUE}pokefetch${NC}' manually at any time."