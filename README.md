# wol2power for nanokvm
Little script for nanokvm that listen for a particular MAC Adress and power ON the host PC.
The script is not mine but from supczinskib (https://github.com/sipeed/NanoKVM/issues/533), I just replaced his space key call to a script that use nanokvm commands to power on the host.

## Installation
* retreive the MAC address of the host pc
* put the two scripts in /root
* make them executable with chmod +x
* add the following line in /etc/inittab with the correct mac address :
```
wol::respawn:/root/wol2power.sh <MAC ADDRESS> >/dev/null 2>&1
```
* Reboot the nanokvm
* Test with sending a magic packet to the MAC address

## Use case :
I have a PC dedicated to game streaming with Apollo (https://github.com/ClassicOldSong/Apollo) and don't want it to be always on as my 3090 RTX TI and 5800X can draw a lot of power.
So it is shutdown most of the time.
Before using this script I had tried other ways :
* Classic WOL is not reliable as it tends to fail sometime, and finding that the PC has been running over a week is not a pleasant surprise with the price of energy.
* The PC was plugged on a shelly power plug and with the BIOS option Turn on AC power loss it allowed me to remotly turn on the PC with the shelly plug.
* But I had to log on the Shelly web interface to activate the plug each time I wanted the PC to boot.

As most Apollo/Sunshine clients (Moonlight and its forks) include sending WOL magic packets this script is most convenient for my usage, I can directly wake up my PC from my TV.

Of course as it is not true WOL I still have to manually shut down the PC each time I finish a game session.
