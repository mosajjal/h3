gpio set PL10
gpio set PG11
setenv machid 1029
setenv bootm_boot_mode sec
if ext4load mmc 0 0x00000000 /boot/.verbose
then
setenv verbosity 7
else
setenv verbosity 1
fi
setenv bootargs "console=ttyS0,115200 root=/dev/mmcblk0p2 rootwait rootfstype=ext4 cgroup_enable=memory swapaccount=1 panic=10 consoleblank=0 enforcing=0 loglevel=${verbosity}"
#--------------------------------------------------------------------------------------------------------------------------------
# Boot loader script to boot with different boot methods for old and new kernel
#--------------------------------------------------------------------------------------------------------------------------------
if ext4load mmc 0 0x00000000 /boot/.next || fatload mmc 0 0x00000000 .next || ext4load mmc 0 0x00000000 .next
then
# sunxi mainline kernel
#--------------------------------------------------------------------------------------------------------------------------------
ext4load mmc 0 0x49000000 /boot/dtb/${fdtfile} || fatload mmc 0 0x49000000 /dtb/${fdtfile} || ext4load mmc 0 0x49000000 /dtb/${fdtfile}
ext4load mmc 0 0x42000000 /boot/uInitrd || fatload mmc 0 0x42000000 uInitrd || ext4load mmc 0 0x42000000 uInitrd
ext4load mmc 0 0x46000000 /boot/zImage || fatload mmc 0 0x46000000 zImage || ext4load mmc 0 0x46000000 zImage
bootz 0x46000000 0x42000000 0x49000000
#bootz 0x46000000 - 0x49000000
#--------------------------------------------------------------------------------------------------------------------------------
else
# sunxi android kernel
#--------------------------------------------------------------------------------------------------------------------------------
ext4load mmc 0 0x43000000 /boot/script.bin || fatload mmc 0 0x43000000 script.bin || ext4load mmc 0 0x43000000 script.bin
ext4load mmc 0 0x42000000 /boot/uInitrd || fatload mmc 0 0x42000000 uInitrd || ext4load mmc 0 0x42000000 uInitrd
ext4load mmc 0 0x48000000 /boot/zImage || fatload mmc 0 0x48000000 zImage || ext4load mmc 0 0x48000000 zImage
bootz 0x48000000 0x42000000
#bootz 0x48000000
#--------------------------------------------------------------------------------------------------------------------------------
fi
# Recompile with:
# mkimage -C none -A arm -T script -d /boot/boot.cmd /boot/boot.scr 
