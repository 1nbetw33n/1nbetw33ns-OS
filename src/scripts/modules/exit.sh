#!/usr/bin/env bash

##finishing script
  echo "### Installer :: Finished Script... ###"
  sleep 1
  read -rp "### Installer :: Press ENTER to exit script and restart gdm session...> ###"
  sudo systemctl restart gdm