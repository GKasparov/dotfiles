function pup --wraps='pacman -Syu' --description 'alias pup=pacman -Syu'
  pacman -Syu $argv; 
end
