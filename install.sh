#!/bin/bash 
##script to automate the installtion of stage 4 
##Secploit OS , Gentoo Kernal 

hd=/dev/sda 
ext2=2
ext4=3
parted -s $hd mklabel gpt &> /dev/null 

##remove previouse partition 

parted -s $hd rm 1 &> /dev/null 
parted -s $hd rm 2 &> /dev/null 
parted -s $hd rm 3 &> /dev/null 
parted -s $hd rm 4 &> /dev/null 

##partion start  
parted -s $hd unit mib 
parted -s $hd mkpart primary 1 3 
parted -s $hd name 1 grub 
parted -s $hd set 1 bios_grub on 

parted -s $hd mkpart primary 3 131
parted -s $hd name 2 boot 
parted -s $hd mkpart primary 643 -- -1 
parted -s $hd name 3 rootfs
parted -s $hd set 2 boot on 
##end of partion 
##formating 
mkfs.ext2 $hd$ext2 
mkfs.ext4 $hd$ext4
##end of formating 
##mouting Drive 
mount $hd$ext4 /mnt/gentoo 
##end of mounting 
##installing proccess 
tar xvfj /mnt/cdrom/stages/secploit.tar.gz -C /mnt/gentoo

echo "Successfully installed , please run chroot script " 
##end of install step 
mount --types proc /proc /mnt/gentoo/proc
mount --rbind /sys /mnt/gentoo/sys
mount --rbind /dev /mnt/gentoo/dev
echo "chrooting ...."
chroot /mnt/gentoo /bin/bash 
source /etc/profile
export PS1="(chroot) ${PS1}"


