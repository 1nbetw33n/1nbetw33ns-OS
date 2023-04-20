#!bash/bin

##cleaning up
  echo "### Exit:: Removing Unused Packages..."
  yay -cc --noconfirm

##timeshift
  echo "### Exit:: Creating Initial Timeshift Snapshot..."
  sudo timeshift --create --comments "Fresh Install"

##finishing script
  echo "### Installer:: Finished Script"
  sleep 1
  read -rp "### Installer:: Press ENTER To Exit Script And Restart gdm session...> "
  sudo systemctl restart gdm