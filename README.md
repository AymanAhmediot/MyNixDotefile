# This is my dote files for Nix 

### In this config directory there are dote files of this software 

- DWM
- Rofi
- Flameshot
- Fastfetch
- Mako 
- Picom
- Kvantum
- alacritty

### Move directoryes in config to ~/.config/ 

```mv config/* ~/.config/ ```

### When you want to use this nix dote file you need to import your user name , host name and your time zone 

- Edit that file nixos/configuration.nix 
- After edit the file you can move the directory by delete the /etc/nixos/ 
- Move the nixos directory into the etc

```sudo rm -rf /etc/nixos/ && sudo mv nixos /etc/ ```

#### The theme I use is green dark yaru theme 

#### I use zsh and I use luke smith config with some changes 

```mv .zshrc ~/ ```

#### Do not for get to make `~/.cache/zsh/history`
#### For zsh history 

#### I use tmux and you can use my config by just moving it into the home directory

```mv .tmux.conf ~/ ```

#### I have my own bash scrip I will leave it to you if you want to use it or make you own one 

### Note 

- I configure it to install qemu and virt manager 
