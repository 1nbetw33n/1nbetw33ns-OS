# Minimal UI EOS Install Script
#### A script to install and configure a heavily customized, transparent, minimal EndeavourOS with purple Accents.
#### Version: 1.3.1
#### Author: 1nbetw33n
#### System Accent Color: `#b702ff`
#### Old System Accent Color: `#b526ff`
#### Script Path: `/run/media/inbetween/Backup/EndeavourOS/os-config/scripts/os-config-installer.sh`

## 00 EndeavourOS Installer
* _**TODO: write script**_

## 01 Welcome
* _**TODO: write script**_
#### Update Mirrors (Arch)
#### Update System (EndeavourOS)
#### Update System
#### Package Cleanup Config
#### Misc
* sed
* permanently disable wayland and set x11 as default session

## 02 Install Core
* Timeshift
* Timeshift-autosnap
* REISUB
* Zsh
* OhMyZsh

## 03 Install Extensions
* Battery threshold
* Burn My Windows
* Caffeine
* Color Picker
* Dash to Panel
* Extension List
* Focus
* Forge
* Freon
* gNordVPN-Local
* IP Finder
* Just Perfection
* No overview at start-up
* NoAnnoyance v2
* Resource Monitor
* Rounded Window Corners
* RunCat
* TopHat
* Transparent WindowS Moving
* User Themes
* Vertical Workspaces

## 04 Config Extensions
#### Transparent Window Moving
   Set Border Color to `System Accent Color`
#### Forge _(disabled for now)_
   /Appearance/Color: Set all to transparent and apply changes
#### Resource Monitor
   Disable: Disk, Net, Thermal, GPU
#### TopHat
   Set Meter Color to `System Accent Color`
#### Burn My Windows
   Set Color to `System Accent Color`
#### gNordVPN-Local
   /General: Enable `Auto-connect on Startup`

## 05 Install Packages
* gnome-terminal
* gnome-browser-connector
* bpytop
* ocs-url
* alacarte
* gdm-tools
* darktable
* gimp
* gthumb
* brave-bin
* discord
* betterdiscord
* thunderbird
* masterpdfeditor-free
* zettlr
* intellij-idea-ultimate-edition
* obs-studio
* vlc
* nordpass-bin
* nordvpn-bin

## 06 Config Apps
* Gnome Terminal
  /Profiles/Unnamed/Colors:
    * Disable `Use colors from system theme`
    * Set `Built in schemes` to `Gnome Dark`
    * Set `Default color` `text` to `#FFFFFF`
* NordVPN
* Firefox
    * Enhancer for YouTube: Enable `YouTube-DeepDark (custom)` and set `--main-color` to `System Accent Color`
* Firefox Dev
* Brave
* BetterDiscord
* Telegram
* Thunderbird
* Zettlr
* IntelliJ
* Gnome Texteditor
  * /View: Enable `Line Numbers`
  * press `Ctrl + ,` to open Preferences
    * Set theme to `Classic Dark`
    * Set font to `Cantarell 11`
    * Enable `Highlight current line`
    
### Login to Accounts
* NordVPN
* NordPass
* Firefox
* Firefox Dev
* Brave (Sync)
* Discord
* Telegram
* IntelliJ

## 07 Transfer Data
* _**TODO: Update this Section**_
*  Documents
*  Pictures
*  .hbrs-certs

## 08 Config System
#### Config Gnome Tweaks
#### Config OS Settings
#### Custom Shortcuts:
<pre>
Launch CLI
gnome-terminal
Super + T
</pre>
<pre>
Launch Files
nautilus --new-window
Super + F
</pre>

#### Config Lockscreen Background
#### Config OS PFP
#### Config OS Background

## 09 Remove unused Packages
* gnome-console

## 10 Config Wifi
#### https://www.h-brs.de/de/wlan-nutzung-an-der-hbrs
#### https://faq.inf.h-brs.de/faq/wlan/cert/linux
* HBRS
* H-BRS
* Eduroam

## 11 Config HBRS VPN
#### https://faq.inf.h-brs.de/faq/vpn/copy_of_linux


