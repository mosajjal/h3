gpio set PL10
gpio set PG11
setenv machid 1029
setenv bootm_boot_mode sec
#setenv bootargs "console=ttyS0,115200 root=/dev/mmcblk0p2 rootwait rootfstype=ext4 cgroup_enable=memory swapaccount=1 panic=10 consoleblank=0 enforcing=0 loglevel=${verbosity}"
setenv bootargs console=ttyS0,115200 earlyprintk root=/dev/mmcblk0p2  video=HDMI-A-1:1920x1080-32@60 rootwait panic=10

#--------------------------------------------------------------------------------------------------------------------------------
fatload mmc 0 0x49000000 script.bin
fatload mmc 0 0x42000000 uInitrd
fatload mmc 0 0x46000000 zImage
#bootz 0x46000000 0x42000000 0x49000000
bootz 0x46000000 - 0x49000000
#--------------------------------------------------------------------------------------------------------------------------------

# Recompile with:
# mkimage -C none -A arm -T script -d /boot/boot.cmd /boot/boot.scr 
