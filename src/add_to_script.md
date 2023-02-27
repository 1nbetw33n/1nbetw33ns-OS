
### subdirs in repo structure with separate README.md's (for each program):

### script example output:
<kbd>*** CONFIGURE ROUNDED WINDOW CORNERS :: enter hex color in the format #RRGGBB ></kbd>

*** 
### packages:
* bc (add before extension configs set up because its needed for the script)
* xorg-xprop
* starship
* touchegg
* extension-manager
* neovim
* zsh-autosuggestions
* xclip
* kitty
* (plymouth)  (haven't made it work yet)
* geany
* geany-plugins
* unimatrix-git
* lolcat
* mpv
* yt-dlp
* youtube-viewer
* gtk-youtube-viewer
* qalculate-gtk

### remove from script:
* gthumb
* vlc
* gnome-calculator

### maybe add:
* wallset (for video wallpapers)


### ohmyzsh
#### plugins:
* zsh-autosuggestions
  * ``git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions``
  * add plugin to list of plugins in ``~/.zshrc`` (WITH SED?):
  * <pre>
    plugins=(plugin 1 plugin 2 plugin 3 etc.)
    </pre>
* zsh-syntax-highlighting
  * ``git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting``
* sudo
* web-search
* copyfile
* copybuffer
* z
* thefuck
* zsh-autopair (auto close brackets, quotes, etc.)
* 
#### theme:
* powerlevel10k:
* ``git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k``


### touchegg:
* <pre>
  sudo systemctl enable touchegg.service
  sudo systemctl start touchegg
  touchegg
  </pre>

### neovim:
#### lunarvim:
``LV_BRANCH='release-1.2/neovim-0.8' bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/fc6873809934917b470bff1b072171879899a36b/utils/installer/install.sh)``
<div>

<details>
<summary><h3>Glava</h3></summary>

* Using <kbd>Shellscript</kbd>
```sh
./glava-autostart.sh
```
* Using <kbd>Ansible Playbook</kbd>
```yml
ansible-playbook glava.yml
```

</details>

</div>


<details>
<summary><h3>Accent Color Uses</h3></summary>

* <kbd>System Accent Color</kbd> ::
  * <kbd>GTK</kbd> :: [gtk.css](~/.config/gtk-4.0/gtk.css)
  * <kbd>Custom Accent Color Extension: Custom</kbd> :: [gtk.css](~/.local/share/gnome-shell/extensions/custom-accent-colors@demiskp/resources/custom/gtk.css)
* <kbd>Zettlr</kbd> :: [custom.css](~/.config/Zettlr/custom.css)
* <kbd>Discord</kbd> :: [purp.theme.css](~/.config/BetterDiscord/themes/purp.theme.css)
* <kbd>Intellij</kbd> ::
  * <kbd>Material Theme Accent Color</kbd> :: [material-theme.xml](~/.config/JetBrains/IntelliJIdea2022.3/options/material_theme.xml)
  * <kbd>Atom Material Icons</kbd> ::
    * <kbd>Monochrome Icons Accent Color [PATH UNVERIFIED!!!!!!!]</kbd> :: [atom-material-icons.xml](~/.config/JetBrains/IntelliJIdea2022.3/options/atom-material-icons.xml)
    * <kbd>Custom Accent Color [PATH UNVERIFIED!!!!!!!]</kbd> :: [atom-material-icons.xml](~/.config/JetBrains/IntelliJIdea2022.3/options/atom-material-icons.xml)
* <kbd>Firefox</kbd> ::
  * <kbd>Enhancer for Youtube</kbd> :: [TODO: FIND_OUT](TODO: FIND_OUT)
* <kbd>Burn My Windows</kbd> :: [snap-color](/org/gnome/shell/extensions/burn-my-windows/snap-color)
  * <kbd>writing</kbd> :: ``dconf write /org/gnome/shell/extensions/burn-my-windows/snap-color "'rgb(112, 101, 226)'"``
  * <kbd>reading</kbd> :: ``dconf read /org/gnome/shell/extensions/burn-my-windows/snap-color``
* <kbd>Rounded Window Corners</kbd> :: [border-color](/org/gnome/shell/extensions/rounded-window-corners/border-color)
  * <kbd>writing</kbd> :: ``dconf write /org/gnome/shell/extensions/rounded-window-corners/border-color "(.4392, .3960, .8862, 1.)"`` (very weird format, so edit in extension gui menu for now)
  * <kbd>reading</kbd> :: ``dconf read /org/gnome/shell/extensions/rounded-window-corners/border-color``
</details>



### tweaks:
##### font:
* ``monospace text`` -> ``Inconsolata Nerd Font Mono Regular``

### starship (terminal theme):
* install package: ``yay -S starship``
* add line to ``~/.zshrc``:
  * ``eval "$(starship init zsh)"``



### add maybe:
* fzf (ohmyzsh extension)
* https://github.com/andrewferrier/fzf-z
* 


### dotfiles:
 * ~/.config/autostart
 * ~/.config/kitty
 * ~/.config/nvim
 * ~/.config/geany
 * ~/.config/neofetch
 * ~/.config/starship.toml
 * ~/.oh-my-zsh
 * ~/.zshrc
 * ~/.p10k.zsh
 * ~/.z
 * ~/.config/glava (not really working)
 * ~/.config/youtube-viewer
 * ~/.config/mpv
 * 

### geany plugins and plugin preferences:
* plugins :: tools -> plugin manager
* plugin preferences :: edit -> plugin preferences


### change app settings:
* ``dconf write /org/gnome/TextEditor/show-line-numbers true``

### change keybindings:
* <kbd>set custom keybindings</kbd> :: [set-custom-keybindings.sh](/script/new/set-custom-keybindings.sh)



### location of configs:
* <kbd>wm keybindings</kbd> :: [wm-keybindings](/org/gnome/desktop/wm/keybindings)
* shell keybindings: ``/org/gnome/shell/keybindings``
* custom keybindings: ``/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings``
* extensions: ``/org/gnome/shell/extensions``
* background: ``/org/gnome/desktop/background``

### Extensions:
#### enabled:
* Burn My Windows
* Caffeine
* Custom Accent Colors
* Dash to Panel
* Focus
* Freon
* gNordVPN-Local
* Hibernate Status Button
* Just Perfection
* No Annoyance v2
* Rounded WWindow Corners
* Sound Visualizer
* Transparent Window Moving
* User Themes
* Vertical Workspaces
* X11 Gestures
* Pop Shell

#### disabled:
* BackSlide
* Battery threshold
* Color Picker
* Extension List
* IP Finder
* Resource Monitor
* RunCat
* TopHat
* 
