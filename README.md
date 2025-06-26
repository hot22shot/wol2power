# wol2power
Little script for nanokvm that listen for a particular MAC Adress and power ON the host PC

Installation is simple :
* retreive the MAC address of the host pc
* put the two scripts in /root
* make them executable with chmod +x
* add the following line in /etc/inittab :

wol::respawn:/root/wolfix.sh <MAC ADDRESS> >/dev/null 2>&1

* Reboot the nanokvm
* Test with sending a magic packet to the MAC address
