#!bin/bash

## getting the current version of clion
  # "echo $(yay -Q clion" returns something like "clion 1:2022.3.2-1"
  # "awk '{print $2}'" returns the second column of the string (-> "1:2022.3.2-1")
  # "cut -d. -f1-2" returns the first two columns of the string (-> "1:2022.3") separated by the delimiter "."
  # "${clion_version:2:7}" removes the first two chars of the string (-> "2022.3")

clion_version=$(yay -Q clion | awk '{print $2}' | cut -d. -f1-2)
clion_version_dir=${clion_version:2:7}

intellij_version=$(yay -Q intellij-idea-ultimate-edition | awk '{print $2}' | cut -d. -f1-2)
intellij_config_dir=$home_dir/.config/JetBrains/IntelliJIdea$intellij_version
intellij_plugins_dir=$home_dir/.local/share/JetBrains/IntelliJIdea$intellij_version

#ls -l /home/inbetween/.config/JetBrains/CLion$clion_version_dir

home_dir=/home/inbetween
ext_home_dir=/run/media/$USER/Backup/EndeavourOS/home

clion_config_dir=$home_dir/.config/JetBrains/CLion$clion_version_dir

#ls -l $home_dir/.local/share/JetBrains/CLion$clion_version_dir

# list all directories beginning with "CLion" in the directory $home_dir/.local/share/JetBrains
# and save the result in the variable $clion_dir
clion_dir=$(ls -d $home_dir/.local/share/JetBrains/CLion*)
echo $clion_dir

#list all directories beginning with "IntelliJ" in the directory $home_dir/.local/share/JetBrains
# and save the result in the variable $intellij_dir
intellij_dir=$(ls -d $home_dir/.local/share/JetBrains/IntelliJ*)
echo $intellij_dir

#TODO: create new directories in $home/.local/share/JetBrains and $home/.config/JetBrains for CLion and IntelliJ with mkdir -p $home_dir/.local/share/JetBrains/{CLion$clion_version_dir,IntelliJIdea$intellij_version}
#TODO: and mkdir -p $home_dir/.config/JetBrains/{CLion$clion_version_dir,IntelliJIdea$intellij_version}
mkdir -p $home_dir/.local/share/JetBrains/{CLion$clion_version_dir,IntelliJIdea$intellij_version}
mkdir -p $home_dir/.config/JetBrains/{CLion$clion_version_dir,IntelliJIdea$intellij_version}

#intellij
## getting the current version of intellij-idea-ultimate-edition:
  # echo "$(yay -Q intellij-idea-ultimate-edition)" returns something like the following: "intellij-idea-ultimate-edition 2022.3.2-1"
  # "awk '{print $2}'" returns the second column of the string (-> "2022.3.2-1")
  # "cut -d. -f1-2" returns the first two columns of the string (-> "2022.3") separated by the delimiter "."
intellij_version=$(yay -Q intellij-idea-ultimate-edition | awk '{print $2}' | cut -d. -f1-2)
intellij_config_dir=$home_dir/.config/JetBrains/IntelliJIdea$intellij_version
intellij_plugins_dir=$home_dir/.local/share/JetBrains/IntelliJIdea$intellij_version

# identify the location of the latest version of intellij in $ext_home_dir/.config/JetBrains/
ext_intellij_config_dir=$(find /ho)

echo
echo "creating Jetbrains dir in .config and .local/share"
mkdir -p "$home_dir/.config/JetBrains" && mkdir -p "$home_dir/.local/share/JetBrains"

echo
echo "import intellij config"
cp -r "$intellij_config_dir" "$home_dir/.config/JetBrains/IntelliJIdea$intellij_version"





#TODO: copy the directories from $ext_home_dir/.local/share/JetBrains/IntelliJ* and $ext_home_dir/.config/JetBrains/IntelliJ* to $home_dir/.local/share/JetBrains/IntelliJ* and $home_dir/.config/JetBrains/IntelliJ*
#TODO: copy the directories from $ext_home_dir/.local/share/JetBrains/CLion* and $ext_home_dir/.config/JetBrains/CLion* to $home_dir/.local/share/JetBrains/CLion* and $home_dir/.config/JetBrains/CLion*