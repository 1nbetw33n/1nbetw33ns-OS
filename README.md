# 1nbetw33ns Config Script
#### This script is intended to be run on an arch-based fresh installation with gnome as desktop environment and xorg as display server.
#### Theme  ::  Lavanda-Dark
#### Icons  ::  Candy-icons
#### Cursor ::  Sweet-cursors
#### Shell  ::  Orchis-Purple-Dark-Compact

<br>

#### To download all necessary files (resources and scripts) and run the configuration script, run the following command in the terminal:
#### _---->> NOT SURE IF CURRENTLY WORKING <<----_
```sh
wget -O 1nbetw33ns-OS.zip https://github.com/1nbetw33n/1nbetw33ns-OS/archive/refs/heads/just_graphical.zip && \
unzip "${HOME}"/1nbetw33ns-OS.zip 1nbetw33ns-OS-just_graphical/src/resources/* 1nbetw33ns-OS-just_graphical/src/script/modules/* 1nbetw33ns-OS-just_graphical/src/script/configure.sh && \
sudo rm -rf "${HOME}"/1nbetw33ns-OS.zip && \
cd "${HOME}"/1nbetw33ns-OS-just_graphical/src/script/ && bash configure.sh
```

<br>

#### To _ONLY DOWNLOAD_ all necessary files (resources and scripts), run the following command in the terminal:
```sh
wget -O 1nbetw33ns-OS.zip https://github.com/1nbetw33n/1nbetw33ns-OS/archive/refs/heads/just_graphical.zip && \
unzip "${HOME}"/1nbetw33ns-OS.zip && sudo rm -rf "${HOME}"/1nbetw33ns-OS.zip
```

<br>

#### Version ::  5.6.1
#### Author ::   1nbetw33n
#### License ::  GNU General Public License v3.0