# 1nbetw33ns OS Setup Script
#### This script is intended to be run on a fresh installation of Arch Linux with Gnome x11.
#### To start the script and download all necessary files, run the following command in the terminal:
```sh
wget -O 1nbetw33ns-OS.zip https://github.com/1nbetw33n/1nbetw33ns-OS/archive/refs/heads/main.zip && \
unzip ~/1nbetw33ns-OS.zip 1nbetw33ns-OS-main/src/resources/* 1nbetw33ns-OS-main/src/script/modules/* 1nbetw33ns-OS-main/src/script/install.sh && \
sudo rm -rf ~/1nbetw33ns-OS.zip && \
cd ~/1nbetw33ns-OS-main/src/script/ && bash install.sh
```
#### Version::  4.7.0
#### Author::   1nbetw33n
#### License::  GNU General Public License v3.0