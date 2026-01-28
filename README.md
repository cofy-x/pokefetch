# 🐉 pokefetch

> A wild terminal appeared!

![License](https://img.shields.io/github/license/cofy-x/pokefetch)
![Shell](https://img.shields.io/badge/shell-bash%20%7C%20zsh-blue)

**pokefetch** is a lightweight CLI tool that displays a random, colored ASCII Pokémon every time you open a new terminal tab.

It is designed to be **fast**, **simple**, and **zero-dependency**. It works perfectly with iTerm2, Zsh, Bash, and standard macOS/Linux terminals.

![Demo Animation](https://github.com/user-attachments/assets/8fed3bbd-c48d-45f7-adfd-3ff01b196738)

## ✨ Features

- **⚡️ Zero Dependencies:** Pure Shell script. No `python`, `node`, or `lolcat` required.
- **🎨 Native Colors:** Renders pre-colored ASCII art using original ANSI codes.
- **📂 Extensible:** Easily add your own `.txt` art files.
- **🚀 Auto-Start:** Automatically runs when you open a new tab (optional).

## 🚀 Installation

Copy and paste this command into your terminal:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/cofy-x/pokefetch/main/install.sh)"
```

This script will clone the repo to `~/.pokefetch` and add the startup command to your `.zshrc` or `.bashrc`.

## 🛠 Usage

### Automatic

Once installed, a random Pokémon will appear automatically whenever you open a new terminal window or tab.

### Manual

You can summon a wild Pokémon manually at any time by typing:

```shell
pokefetch
```

## 🎨 Adding Custom Pokémon

Want to add a missing Pokémon or your own custom art?

1. Find or create an ASCII art file (must save as `.txt`).

2. Move the file into the assets folder:

   ```shell
   cp my-art.txt ~/.pokefetch/assets/
   ```

3. That's it! It will now appear in the random rotation.

## 🗑 Uninstall

To completely remove `pokefetch` and clean up your shell configuration automatically:

```shell
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/cofy-x/pokefetch/main/uninstall.sh)"
```

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](./LICENSE)

---

<p align="center"> Made with ❤️ for the Terminal </p>
