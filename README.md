# Allwinner H3 Files
Allwinner H3 Kernel, U-boot and instructions.

# Included
* A working kernel (3.4.112) with /lib/modules directory (drivers) included.

* A working mainline (4.9rc1) with Systemd support and /lib/modules directory included.
Almost everything works with this kernel, including Ethernet, HDMI, USB, OTG, etc. Although I got "out of range" error while testing it with OPI-PC and Nano Pi M1. It's supposed to work with OPI-PC+. TV out is not tested either. 


The patches are coming from here: [Jean-François Moine's blog](http://moinejf.free.fr/opi2/)


Feedbacks are welcome.

* A working 2016 U-boot (Tested on Orange pi PC and Nano Pi M1). Working great with M1 with very fast SD card read speed. Not so much with OrangePi PC. The new Armbian's U-Boot would be so much better than this. This is going to be replaced by that one


* The other problem is kernel logging is scrambled with M1 but not OPI-PC. I have no idea why..
  UPDATE: It looks like it has something to do with the fex file. Added those to the repo. Getting to the bottom of it..
