# 1nbetw33ns Config Script
#### This script is intended to be run on an arch-based fresh installation with gnome as desktop environment and xorg as display server.
#### It will install and configure everything that is needed to have a similar(-ish) experience to the one I have on my machine (see below).

<br>

#### Cursor                 ::  Sweet-cursors
#### Icons                  ::  Candy-icons 
#### Shell Theme            ::  Lavanda-Dark
#### Legacy Applications    ::  Lavanda-Dark
#### Font                   ::  CaskaydiaCove Nerd Font
#### Mono Font              ::  FiraCode Nerd Font
#### Tiling Window Manager  ::  Pop-Shell
#### Terminal               ::  Kitty

<br> 

##### Before running the script, make sure the System is up-to-date ::
```sh
yay -Syu
```

<br>

#### _DOWNLOAD_ all necessary files ::
- resources
- scripts
- readme
- license
```sh
cd "${HOME}" || exit && \
wget -O 1nbetw33ns-OS.zip https://github.com/1nbetw33n/1nbetw33ns-OS/archive/refs/heads/just_graphical.zip && \
unzip -qq "1nbetw33ns-OS.zip" && \
cd "1nbetw33ns-OS-just_graphical" || exit && \
rm -rf .idea .gitignore out && \
cd "${HOME}" || exit
```


#### _RUN_ the configuration script ::
```sh
cd "${HOME}"/1nbetw33ns-OS-just_graphical/src/script/ || exit && \
sh configure.sh
```
#### After restarting the gdm-session install Oh-My-Zsh ::
```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

<br>

#### Version ::  7.0.0
#### Author ::   1nbetw33n
#### License ::  GNU General Public License v3.0