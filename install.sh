#!/bin/bash 
##script to automate the installtion of stage 4 
##Secploit OS , Gentoo Kernal 

hd=/dev/sda 

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
