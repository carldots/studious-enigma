# studious-enigma
This is a configuration for a distrobuted distcc cluster. 
- TTY only
- Remote installation
- Causing the fuse to break in school


# installation
1. Boot into normal NixOS iso, flavour does not matter
2. `sudo -s`
2. `git clone https://github.com/carldots/studious-enigma && cd studious-enigma`
3. `nix --experimental-features "nix-command flakes" run github:nix-community/disko -- --mode disko ./disko.nix --arg device '"/dev/sda"'`
4. `nixos-generate-config --no-filesystems --root /mnt && cd /mnt/etc/nixos`
5. `git clone https://github.com/carldots/studious-enigma .`
6. `nixos-install --root /mnt --flake /mnt/etc/nixos#distcc`
