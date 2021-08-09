#Ensure prerequisites are installed (ARCH LINUX ONLY)
yay -S ckb-next
echo "installed ckb-next"
sudo pacman -S flameshot
echo "installed flameshot"
sudo pacman -S picom
echo "installed picom"
yay -S polybar
echo "installed polybar"
sudo pacman -S rofi
echo "installed rofi"

#Remove current fish configs
rm ~/.config/fish/config.fish
rm -rf ~/.config/fish/functions
rm ~/.config/fish/fish_variables

#Move fish configs to user's .config directory
mv ./fish/config.fish ~/.config/fish/
mv ./fish/functions ~/.config/fish/
mv ./fish/fish.variables ~/.config/fish/

echo "Applied Fish configs"

#Delete current polybar config
rm ~/.config/polybar/config

#Move polybar config to user's .config directory
mv ./polybar/config ~/.config/polybar/

echo "Applied polybar configs"

#Remove current i3wm configs
rm ~/.config/i3/config

#Move current i3wm configs to user's .config directory
mv ./i3wm/config ~/.config/i3/

echo "Applied i3wm configurations"

#Move i3 shell scripts to i3 .config directory
mv ./i3wm/rofi.sh ~/.config/i3/
mv ./i3wm/picom.sh ~/.config/i3/
mv ./i3wm/flameshot.sh ~/.config/i3/
mv ./i3wm/polybar.sh ~/.config/i3/
mv ./i3wm/ckb-next.sh ~/.config/i3/
mv ./i3wm/BlackWallpaper.png ~/.config/i3/

echo "installed startup shell scripts"
echo "Reload i3wm to apply changes"
