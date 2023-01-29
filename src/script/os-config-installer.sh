#!bin/bash

path=/run/media/inbetween/Backup/EndeavourOS/os-config/scripts

scripts=(
	00_init.sh 01_welcome.sh 02_install-core.sh 03_install-extensions.sh 04_config-extensions.sh 05_install-misc.sh 
	06_config-apps.sh 07_transfer-data.sh 08_config-system.sh 09_remove-unused-apps.sh 10_exit.sh
	)
	
	for script in "${scripts[@]}"; do
		bash $path/$script
	done

