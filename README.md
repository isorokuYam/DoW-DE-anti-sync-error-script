# DoW:DE anti-sync-error script
Script to fix Sync error on multiplayer games

Original script from https://gist.github.com/TechT10n/79b853003f2e9841a18e8b6decd0fd3e

I have added path for flatpak steam and changed game id for DoW:DE
Tested on Debian 13 and flatpak Steam with proton 9.0.4
It was the only solution, which allowed me to finish multiplayer match.
I am not scripting/linux expert so add comment if there is any error in text.

Path starting from home directory, so should be enough to download anywhere, and run as program. If someone has non-standard path, has to change one in script.

---
A. If you got Flatpak Steam
1. Find in the script
   ````
   # EDIT:
   # !IMPORTANT!
   # if you got flatpak, must comment # original path and uncomment one starting with .var
   STEAM_ROOT=$HOME/.steam/steam
   # STEAM_ROOT=$HOME/.var/app/com.valvesoftware.Steam/.local/share/Steam
2. Comment `STEAM_ROOT=$HOME/.steam/steam` and uncomment `# STEAM_ROOT=$HOME/.var/app/com.valvesoftware.Steam/.local/share/Steam`

   
B. If you got non-standard path to steamapps folder
- replace `$HOME/.steam/steam` in `STEAM_ROOT=$HOME/.steam/steam` with proper path to Steam folder
