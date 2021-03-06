#!/bin/bash
# Script for checking for updates 
kodi-send --action=Notification"(Gamestarter,Checking for updates...,4000,/storage/.kodi/addons/script.gamestarter/icon.png)"

# comprobar que changelog de internet y local son iguales
wget --no-check-certificate -O /storage/.kodi/addons/script.gamestarter/changelog_latest.txt https://raw.githubusercontent.com/bite-your-idols/Gamestarter-Pi/master/script.gamestarter/changelog.txt
VERSION_LOCAL=$(head -c 6 /storage/.kodi/addons/script.gamestarter/changelog.txt) 
VERSION_ONLINE=$(head -c 6 /storage/.kodi/addons/script.gamestarter/changelog_latest.txt) 
echo $VERSION_LOCAL
echo $VERSION_ONLINE


if [[ $VERSION_LOCAL == $VERSION_ONLINE ]]
then
   # echo "Gamestarter is up to date"
   kodi-send --action=Notification"(Gamestarter,Gamestarter is up to date,6000,/storage/.kodi/addons/script.gamestarter/icon.png)"
else
   # echo "There is a new version you can download"
   kodi-send --action=Notification"(Gamestarter,There is a new version you can download,6000,/storage/.kodi/addons/script.gamestarter/icon.png)"
fi

rm /storage/.kodi/addons/script.gamestarter/changelog_latest.txt
