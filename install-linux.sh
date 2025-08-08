#!/usr/bin/env bash
set -euo pipefail

echo "[+] Updating apt..."
sudo apt update

echo "[+] Installing packages..."
sudo apt install -y zsh git curl wget unzip stow ripgrep fd-find fzf bat neovim kitty

echo "[+] Installing Starship..."
curl -sS https://starship.rs/install.sh | sh -s -- -y

echo "[+] Installing FiraCode Nerd Font..."
mkdir -p ~/.local/share/fonts
cd /tmp
curl -LO https://github.com/ryanoasis/nerd-fonts/releases/latest/download/FiraCode.zip
unzip -o FiraCode.zip -d ~/.local/share/fonts >/dev/null
fc-cache -fv >/dev/null

echo "[+] Fetching Night Owl theme for Kitty..."
mkdir -p ~/.config/kitty/themes
curl -fsSL https://raw.githubusercontent.com/lukegazebrook/night-owl-kitty/master/nightowl.conf \
  -o ~/.config/kitty/themes/nightowl.conf || true

echo "[+] Symlinking dotfiles with stow..."
cd "$HOME/dots"
stow --no-folding .

echo "[+] Setting Zsh as default shell (log out/in to take effect)..."
chsh -s "$(command -v zsh)" || true

echo "[✔] Done. Restart Kitty or run: exec zsh"
