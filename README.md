# 1nbetw33ns Config Script
#### This script is intended to be run on an arch-based fresh installation with gnome as desktop environment and xorg as display server.
#### Theme  ::  Lavanda-Dark
#### Icons  ::  Candy-icons
#### Cursor ::  Sweet-cursors
#### Shell  ::  Orchis-Purple-Dark-Compact

<br>

#### _DOWNLOAD_ all necessary files (resources and scripts) ::
```sh
wget -O 1nbetw33ns-OS.zip https://github.com/1nbetw33n/1nbetw33ns-OS/archive/refs/heads/just_graphical.zip && \
unzip "${HOME}"/1nbetw33ns-OS.zip && sudo rm -rf "${HOME}"/1nbetw33ns-OS.zip
```
#### _RUN_ the configuration script ::
```sh
cd "${HOME}"/1nbetw33ns-OS-just_graphical/src/script/ && sh configure.sh
```
#### After restarting the gdm-session install Oh-My-Zsh ::
```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```


<br>

#### Version ::  6.0.1
#### Author ::   1nbetw33n
#### License ::  GNU General Public License v3.0