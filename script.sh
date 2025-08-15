#!/bin/bash
# This is CoH script for sync issues modified by me for DoW:DE. My comments are preceded with "EDIT:" - isorokuYam
# Original intro text between ---:
# ---------------------------------------------------------------------------------------------------------------
# Just a simple bash script to automate extracting & moving a required dll to fix multiplayer sync-error issue.
# All credit for the script to TechT10n
# Credit for writing down the steps for this solution goes to jrbergen, who in turn got the solution from Cytomax55.
# More details here: https://gist.github.com/jrbergen/0ce746676c4fbcc2becd6054d1bba2ed
# and here: https://github.com/ValveSoftware/Proton/issues/3875#issuecomment-764191557
# ---------------------------------------------------------------------------------------------------------------
# Below is the default Steam library location.
# Change the path for STEAM_ROOT if you do not use the default location for your Steam Library  (do NOT include the trailing /)

# EDIT: 
# !IMPORTANT! 
# if you got flatpak, must comment # original path and uncomment one starting with .var
STEAM_ROOT=$HOME/.steam/steam
# STEAM_ROOT=$HOME/.var/app/com.valvesoftware.Steam/.local/share/Steam
STEAM_PATH=${STEAM_ROOT}/steamapps/compatdata/3556750/pfx/drive_c/windows/system32

DLL_FILE=ucrtbase.dll

# If the link to download the right version of VCredist changes in the future, you can change the link below.
VCREDIST_DOWNLOAD_LINK="https://download.microsoft.com/download/9/3/F/93FCF1E7-E6A4-478B-96E7-D4B285925B00/vc_redist.x64.exe"

# Define some colors for fluff / more readable output
GREEN=$(tput setaf 2)
BLUE=$(tput setaf 4)
NORMAL=$(tput sgr0)
RED=$(tput setaf 1)

printf "${BLUE}This script requires sudo permissions to copy to the Steam path, \n"
printf " as well as to change the owner/group for the DLL to the current user.\n"
printf " It shouldn't use sudo permissions for anything else.\n${NORMAL}"

sudo -v # Ask sudo permission to change the user owner/group for the .DLL
mkdir -p tmp
wget -P tmp $VCREDIST_DOWNLOAD_LINK
cabextract tmp/vc_redist.x64.exe --dir tmp
cabextract tmp/a10 --dir tmp
cp tmp/${DLL_FILE} .
sudo -n cp tmp/${DLL_FILE} "${STEAM_PATH}/"
rm -rf tmp

USER=$(whoami)
GROUP=$(id -g)
if [[ -e "${STEAM_PATH}/${DLL_FILE}" ]]
then
  sudo -n chown ${USER} "${STEAM_PATH}/${DLL_FILE}"
  sudo -n chgrp ${GROUP} "${STEAM_PATH}/${DLL_FILE}"
else
  printf "%40s\n" "${RED}Failure:${BLUE} setting the group/owner for the .DLL failed."
  printf " Did you provide the right Steam path, and is CoH2 installed via Steam?\n"
  printf " If that is not the issue, try performing the script steps manually.${NORMAL}\n\n"
  set -e && false # Exit script
fi

CHKFILE="${STEAM_PATH}/${DLL_FILE}"
if [[ -e "${CHKFILE}" ]]
then
  printf "%40s\n" "${GREEN}Success:${BLUE} ${DLL_FILE} was copied to ${STEAM_PATH}${NORMAL}\n"
else
  printf "%40s\n" "${RED}Failure:${BLUE} ${DLL_FILE} file copy failed. Try performing the script steps manually.${NORMAL}"
fi
