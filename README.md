Fix for sync error in Dawn of War: Definitive Edition multiplayer
===

Issue seems to be related with lack of/invalid ucrtbase.dll in proton prefix. To fix it you either use script for Company of Heroes 2 (here is version adapted to DoW:DE) or using protontricks. For others, only installing vcrun2019/2022 with protonntricks was helpful.
Methods collected from Steam community advices.

A. ucrtbase.dll via script 
-   

Original script from https://gist.github.com/TechT10n/79b853003f2e9841a18e8b6decd0fd3e

I have added path for flatpak steam and changed game id for DoW:DE.  
Tested on Debian 13 and flatpak Steam with proton 9.0.4

Path starting from home directory, so should be enough to download anywhere, and run as program. 
- If you got **non-standard path** to steamapps folder, have to change one in script in `STEAM_ROOT=$HOME/.steam/steam` line
- if you got **flatpak**, comment `STEAM_ROOT=$HOME/.steam/steam` and uncomment `# STEAM_ROOT=$HOME/.var/app/com.valvesoftware.Steam/.local/share/Steam`

B. ucrtbase.dll via Protontricks
-

You can install this dll via protontricks.
- gui: run protontricks and select DoW:DE -> select default prefix -> install windows dll -> select uctrbase2019 -> ok
- terminal: `protontricks 3556750 ucrtbase2019'

C. vcrun2019/vcrun2022 via Protontricks
-
- gui: run protontricks and select DoW:DE -> select default prefix -> install windows dll -> select vcrun2019 -> ok
- terminal: `protontricks 3556750 vcrun2019'

vcrun2022 should work too.



