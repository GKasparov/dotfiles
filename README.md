# dotfiles
Dotfiles for:
- i3-gaps
- Polybar
- Alacritty
- Picom
- Fish
- NixOS (configuration.nix file)

And startup scripts

Polybar config has two versions, one for Arch and one for Gentoo. The Arch version colouring takes into consideration that CHECK-AUR-UPDATES module is present. Gentoo, being Gentoo, does not have this module and therefore the colour ordering is slightly altered.

# Notes
- When installing Polybar on gentoo, ensure you enable i3wm and network use flags, otherwise those modules will NOT appear. To install Polybar on Gentoo with support for these modules, run: 
``sudo USE="i3wm network" emerge --ask x11-misc/polybar``
