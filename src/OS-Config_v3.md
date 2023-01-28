# Minimal UI EOS Install & Config Script
#### A script to install and configure a heavily customized, transparent minimal EndeavourOS installation.
#### Version: 0.0.3
#### Author: 1nbetw33n
#### System Accent Color: `#b702ff` | Old System Accent Color: `#B526FF`
#### Script Call: `bash /run/media/inbetween/Backup/EndeavourOS/os-config/scripts/OS-Config-Installer.sh`

## 00 EndeavourOS Installer
* _TODO: write script_

## 01 Welcome
* _TODO: write script_
1. ### Update Mirrors (Arch)
2. ### Update System (EndeavourOS)
3. ### Update System
4. ### Package Cleanup Config
5. ### Misc
* sed
* completely disable wayland and set x11 as default session

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
1. ### Transparent Window Moving
   Set Border Color to `System Accent Color`
2. ### Forge _(disabled for now)_
   /Appearance/Color: Set all to transparent and apply changes
3. ### Resource Monitor
   Disable: Disk, Net, Thermal, GPU
4. ### TopHat
   Set Meter Color to `System Accent Color`
5. ### Burn My Windows
   Set Color to `System Accent Color`
6. ### gNordVPN-Local
   /General: Enable Auto-connect on Startup

## 05 Install Misc
* gnome-terminal
* gnome-browser-connector
* bpytop
* ocs-url
* alacarte
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
* gnome-terminal
   /Profiles/Unnamed/Colors: 
    * Disable `Use colors from system theme`
    * Set `Built in schemes` to `Gnome Dark`
    * Set `Default color` `text` to `#FFFFFF`
* NordVPN
* Firefox
  * Enhancer for YouTube: Enable `YouTube-DeepDark (custom)` and set --main-color to `System Accent Color`
* Firefox Dev
* Brave
* BetterDiscord
* Telegram
* Thunderbird
* Zettlr
* IntelliJ

## Login to Accounts
* NordVPN
* NordPass
* Firefox
* Firefox Dev
* Brave (Sync)
* Discord
* Telegram
* IntelliJ

## 07 Transfer Data
*  Documents
*  Pictures
*  .hbrs-certs

## 08 Config System
1. ### Config Gnome Tweaks
2. ### Config OS Settings
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

3. ### Config OS PFP
4. ### Config OS Background

## 09 Remove unused Apps
* gnome-console
* 

## 10 Config Wifi
* https://www.h-brs.de/de/wlan-nutzung-an-der-hbrs
* https://faq.inf.h-brs.de/faq/wlan/cert/linux
* HBRS
* H-BRS
* Eduroam

## 11 Config HBRS VPN
* https://faq.inf.h-brs.de/faq/vpn/copy_of_linux


