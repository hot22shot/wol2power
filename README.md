# wol2power
Little script for nanokvm that listen for a particular MAC Adress and power ON the host PC.
The script is not mine but from supczinskib (https://github.com/sipeed/NanoKVM/issues/533), I just replaced his space key call to a script that use nanokvm command to power on the host.

Installation is simple :
* retreive the MAC address of the host pc
* put the two scripts in /root
* make them executable with chmod +x
* add the following line in /etc/inittab :

wol::respawn:/root/wol2power.sh MACADDRESS >/dev/null 2>&1

* Reboot the nanokvm
* Test with sending a magic packet to the MAC address
