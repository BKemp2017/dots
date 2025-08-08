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


echo "[+] Symlinking dotfiles with stow..."
cd "$HOME/dots"
stow --no-folding .

echo "[+] Setting Zsh as default shell (log out/in to take effect)..."
chsh -s "$(command -v zsh)" || true

echo "[✔] Done. Restart Kitty or run: exec zsh"

echo "[+] Installing Night Owl theme (kitty)…"
mkdir -p ~/.config/kitty/themes
cd /tmp
rm -rf nightowl
git clone https://github.com/Glazy/night-owl-kitty-theme.git nightowl
cp nightowl/*.conf ~/.config/kitty/themes/nightowl.conf

