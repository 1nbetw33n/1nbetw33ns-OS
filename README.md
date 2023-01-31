# Minimal UI EOS Install Script
#### A script to install and configure a heavily customized, transparent, minimal EndeavourOS with purple Accents.
#### Version: 2.2.1
#### Author: 1nbetw33n
#### System Accent Color: `#b702ff`
#### Old System Accent Color: `#b526ff`


## 0 EndeavourOS Installer
### Installer
* Select `Start the Installer`
* Choose `Online`
#### Welcome
* Select `American English`
#### Location
* Select `Europe` and `Berlin`
#### Keyboard
* Select `German` and `Default`
#### Desktop
* Select `GNOME`
#### Packages
* Select:
 * `Desktop-Base + Common Packages`
 * `CPU specific Microcode update packages`
 * `Firefox and language package`
 * `GNOME-Desktop`
 * `Printing-Support`
 * `Support for Hp Printer/Scanner`
#### Boatloader
* Select `systemd-boot`
#### Partitions
* Select `Erase Disk`
 * Select `Swap (with Hibernate)` and `btrfs`
* Select `Encrypt system`
* Enter password twice
#### Users
* Fill out information
* Select `Use the same password for the administrator account`
#### Summary
* Check settings
* Install

## 1 Welcome
* _**TODO: write script**_
#### Update Mirrors (Arch)
#### Update System (EndeavourOS)
#### Update System
#### Package Cleanup Config
#### Launch Script:
* run in cli: `/run/media/inbetween/Backup/EndeavourOS/os-config/script/minimal-eos-installer.sh`

## 2 Core
* sed
* permanently disable wayland and set x11 as default session
* REISUB
* Zsh
* OhMyZsh

## 3 Extensions

### Install
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

### Config
#### Burn My Windows
![Burn My Windows](src/img/03_extensions-config/Burn-My-Windows.png)
* Set `Color` to `System Accent Color`
#### Caffeine
![Caffeine](src/img/03_extensions-config/Caffeine.png)
#### Color Picker
![Color Picker](src/img/03_extensions-config/Color-Picker.png)
#### Dash to Panel
* see `src/img/03_extensions-config/Dash-to-Panel` for config file
#### Extension List
![Extension List](src/img/03_extensions-config/Extension-List.png)
#### Focus
![Focus](src/img/03_extensions-config/Focus.png)
#### Forge _(disabled for now)_
![Forge](src/img/03_extensions-config/Forge_1.png)
![Forge](src/img/03_extensions-config/Forge_2.png)
![Forge](src/img/03_extensions-config/Forge_3.png)
![Forge](src/img/03_extensions-config/Forge_4.png)
* /Appearance/Color: Set all to transparent and apply changes
#### Freon
![Freon](src/img/03_extensions-config/Freon.png)
#### gNordVPN-Local
* /General: Enable `Auto-connect on Startup`
#### IP Finder
![IP Finder](src/img/03_extensions-config/IP-Finder.png)
#### Just Perfection _(disabled for now)_
#### Resource Monitor
![Resource Monitor](src/img/03_extensions-config/Resource-Monitor_1.png)
![Resource Monitor](src/img/03_extensions-config/Resource-Monitor_2.png)
![Resource Monitor](src/img/03_extensions-config/Resource-Monitor_3.png)
![Resource Monitor](src/img/03_extensions-config/Resource-Monitor_4.png)
* Disable: Disk, Net, Thermal, GPU
#### Rounded Window Corners
![Rounded Window Corners](src/img/03_extensions-config/Rounded-Window-Corners_1.png)
![Rounded Window Corners](src/img/03_extensions-config/Rounded-Window-Corners_2.png)
#### RunCat
![RunCat](src/img/03_extensions-config/RunCat.png)
#### TopHat
![TopHat](src/img/03_extensions-config/TopHat.png)
* Set Meter Color to `System Accent Color`
#### Transparent Window Moving
   Set Border Color to `System Accent Color`
##### Vertical Workspaces
![Vertical Workspaces](src/img/03_extensions-config/Vertical-Workspaces_1.png)
![Vertical Workspaces](src/img/03_extensions-config/Vertical-Workspaces_2.png)
![Vertical Workspaces](src/img/03_extensions-config/Vertical-Workspaces_3.png)
![Vertical Workspaces](src/img/03_extensions-config/Vertical-Workspaces_4.png)

## 4 Packages
### Install
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

### Config
#### Gnome Terminal
  /Profiles/Unnamed/Colors:
    * Disable `Use colors from system theme`
    * Set `Built in schemes` to `Gnome Dark`
    * Set `Default color` `text` to `#FFFFFF`
#### NordVPN
#### Firefox
* Set `browser.tabs.closeWindowWithLastTab` to `false`
* Enhancer for YouTube:
  * Enable `YouTube-DeepDark (custom)` and set `--main-color` to `System Accent Color`
* Dark Mode:
  * Set ` I. General dark styles (class a)` to `Dark mode #6 (amoled dark)`
  * Add `startpage.com, github.com, gist.github.com, youtube.com, trello.com` to `VI. Comma separated list of sites to exclude from dark mode`
![Firefox](src/img/04_packages-config/1_firefox-config/firefox-ui.png)
#### Firefox Dev
#### Brave
![Brave](src/img/04_packages-config/2_brave-config/01_brave.png)
![Brave](src/img/04_packages-config/2_brave-config/02_brave.png)
#### BetterDiscord
#### Telegram
#### Thunderbird
#### Zettlr
#### IntelliJ
![IntelliJ](src/img/04_packages-config/3_intellij-config/intellij_01.png)
![IntelliJ](src/img/04_packages-config/3_intellij-config/intellij_02.png)
![IntelliJ](src/img/04_packages-config/3_intellij-config/intellij_03.png)
![IntelliJ](src/img/04_packages-config/3_intellij-config/intellij_04.png)
![IntelliJ](src/img/04_packages-config/3_intellij-config/intellij_05.png)
![IntelliJ](src/img/04_packages-config/3_intellij-config/intellij_06.png)
![IntelliJ](src/img/04_packages-config/3_intellij-config/intellij_07.png)
![IntelliJ](src/img/04_packages-config/3_intellij-config/intellij_08.png)
![IntelliJ](src/img/04_packages-config/3_intellij-config/intellij_09.png)
![IntelliJ](src/img/04_packages-config/3_intellij-config/intellij_10.png)
![IntelliJ](src/img/04_packages-config/3_intellij-config/intellij_11.png)
![IntelliJ](src/img/04_packages-config/3_intellij-config/intellij_12.png)
![IntelliJ](src/img/04_packages-config/3_intellij-config/intellij_13.png)
#### Gnome Texteditor
![Gnome Texteditor](src/img/04_packages-config/4_texteditor-config/texteditor.png)
* /View: Enable `Line Numbers`
* press `Ctrl + ,` to open Preferences
  * Set theme to `Classic Dark`
  * Set font to `Cantarell 11`
  * Enable `Highlight current line`

### Packages Cleanup
* gnome-console
    
### Login to Accounts
* NordVPN
* NordPass
* Firefox
* Firefox Dev
* Brave (Sync)
* Discord
* Telegram
* IntelliJ

## 5 Transfer Data
* _**TODO: Update this Section**_
*  Documents
*  Pictures

## 6 Config System
### Config Gnome Tweaks
### Config OS Settings
#### EOS Settings
![OS Settings](src/img/06_system-config/1_eos-settings-config/0_Mouse-and-Touchpad.png)
![OS Settings](src/img/06_system-config/1_eos-settings-config/1_Keyboard-0_Custom-Shortcuts.png)
![OS Settings](src/img/06_system-config/1_eos-settings-config/1_Keyboard-1_Custom-Shortcuts.png)
![OS Settings](src/img/06_system-config/1_eos-settings-config/1_Keyboard-2_Custom-Shortcuts.png)
![OS Settings](src/img/06_system-config/1_eos-settings-config/1_Keyboard-3_Custom-Shortcuts.png)
![OS Settings](src/img/06_system-config/1_eos-settings-config/1_Keyboard-4_Custom-Shortcuts.png)
#### Tweaks
![Tweaks](src/img/06_system-config/2_tweaks-config/Tweaks_1.png)
![Tweaks](src/img/06_system-config/2_tweaks-config/Tweaks_2.png)
![Tweaks](src/img/06_system-config/2_tweaks-config/Tweaks_3.png)
![Tweaks](src/img/06_system-config/2_tweaks-config/Tweaks_4.png)
![Tweaks](src/img/06_system-config/2_tweaks-config/Tweaks_5.png)
![Tweaks](src/img/06_system-config/2_tweaks-config/Tweaks_6.png)
![Tweaks](src/img/06_system-config/2_tweaks-config/Tweaks_7.png)
#### EOS
![EOS](src/img/06_system-config/3_eos-config/eos-ui.png)

### Custom Shortcuts:
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

### Config Lockscreen Background
### Config OS PFP
### Config OS Background
### Timeshift

## 8 Config Wifi
#### https://www.h-brs.de/de/wlan-nutzung-an-der-hbrs
#### https://faq.inf.h-brs.de/faq/wlan/cert/linux
* HBRS
* H-BRS
* Eduroam

## 9 Config HBRS VPN
#### https://faq.inf.h-brs.de/faq/vpn/copy_of_linux


