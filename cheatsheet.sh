#!/bin/bash

SJG_RED="\033[0;31m"
SJG_YELLOW='\033[1;33m'
SJG_NC='\033[0m'
CHEATSHEET=$1

function sj_gash_print_title() {
  printf "$SJG_YELLOW $1\n"
}

function sj_gash_print_body() {
  printf "$SJG_NC $1\n\n"
}

cheatsheets="arp, arpspoof, dd, diskutil, gpg, growpart, netstat, python, resize2fs, shutdown, tcpdump, xfs_growfs"

echo ""

if [ -z $CHEATSHEET ]; then
  printf "$SJG_RED No program provided, available options are: $cheatsheets"
else
  if [ $CHEATSHEET == "arp" ]; then

    sj_gash_print_title "List all in ARP Cache - Linux"
    sj_gash_print_body "arp"

    sj_gash_print_title "List all in ARP Cache  - Mac"
    sj_gash_print_body "arp -a"

    sj_gash_print_title "Create a static entry to prevent being arp spoofed"
    sj_gash_print_body "arp -s <router-ip> <router-mac>"

  elif [ $CHEATSHEET == "arpspoof" ]; then
  
    sj_gash_print_title "Send a ARP request to entire network on the <nic> subnet and tell it to send requests which were meant for <router-ip> to the local IP instead"
    sj_gash_print_body "arpspoof -i <nic - e.g. eth0> <router-ip - e.g. 192.168.0.1>"

    sj_gash_print_title "Send a ARP request to <target-ip> on the <nic> subnet and tell it to send requests which were meant for <router-ip> to the local IP instead"
    sj_gash_print_body "arpspoof -i <nic - e.g. eth0> -t <target-ip> <router-ip - e.g. 192.168.0.1>"

    sj_gash_print_title "Poison both the target and host so traffic is captured in both directions"
    sj_gash_print_body "arpspoof -i <nic - e.g. eth0> -t <target-ip> -r <poison> <fake-router-ip>"
  
  elif [ $CHEATSHEET == "dd" ]; then

    sj_gash_print_body "This should have been called cc (convert and copy), but, obviously that was taken."
    
    sj_gash_print_title "Burn iso to device (rdisks speeds up process)"
    sj_gash_print_body "sudo dd bs=1m if=file.iso of=/dev/rdisk{xxx}"
  
  elif [ $CHEATSHEET == "diskutil" ]; then
    
    sj_gash_print_title "Unmount an entire disk"
    sj_gash_print_body "diskutil unmountDisk /dev/disk{xxx}"

    sj_gash_print_title "Unmount a single volume"
    sj_gash_print_body "diskutil unmount /dev/disk{xxx}"

    sj_gash_print_title "Eject device"
    sj_gash_print_body "diskutil eject /dev/disk{xxx}"
  
  elif [ $CHEATSHEET == "gpg" ]; then
    
    sj_gash_print_title Retrieve key
    sj_gash_print_body "gpg --receive-keys simon@jakowicz.com"

    sj_gash_print_title "Encrypt using my private key"
    sj_gash_print_body "gpg -e -r simon@jakowicz.com -o"

    sj_gash_print_title "Decrypt symmetric or asymmetric"
    sj_gash_print_body "gpg -d -o"

    sj_gash_print_title "Symmetric Encryption"
    sj_gash_print_body "gpg --symmetric"
  
  elif [ $CHEATSHEET == "growpart" ]; then
    
    sj_gash_print_title "Resize the /dev/disk0 partition to the size of it’s volume"
    sj_gash_print_body "growpart /dev/disk{xxx}"
  
  elif [ $CHEATSHEET == "netstat" ]; then
    
    sj_gash_print_title "Run as sudo for more information"
    sj_gash_print_body "sudo netstat -tupln # (tcp, upd, pid, listen, numeric)"
  
  elif [ $CHEATSHEET == "python" ]; then
    
    sj_gash_print_title "Start HTTP server Python 2"
    sj_gash_print_body "python -m SimpleHTTPServer 8000"

    sj_gash_print_title "Start HTTP server Python 3"
    sj_gash_print_body "python -m http.server 3000"
  
  elif [ $CHEATSHEET == "resize2fs" ]; then
    
    sj_gash_print_title "Extend a 'ext2, ext3, ext4' filesystem after resizing the partition"
    sj_gash_print_body "sudo resize2fs /dev/disk[0-9]"
  
  elif [ $CHEATSHEET == "shutdown" ]; then
    
    sj_gash_print_title "Restart"
    sj_gash_print_body "shutdown -r"
    sj_gash_print_body "init 6"

    sj_gash_print_title "Shutdown now"
    sj_gash_print_body "poweroff"
    sj_gash_print_body "init 0"

    sj_gash_print_title "shutdown in 30 mins"
    sj_gash_print_body "shutdown +30"
  
  elif [ $CHEATSHEET == "tcpdump" ]; then
    
    sj_gash_print_title "Dump all traffic, don’t addresses to names"
    sj_gash_print_body "tcpdump -n"

    sj_gash_print_title "Dump traffic on a specific interface"
    sj_gash_print_body "tcpdump -i <interface - e.g. eth0>"

    sj_gash_print_title "Dump traffic to a specific host"
    sj_gash_print_body "tcpdump host www.google.com"

    sj_gash_print_title "Capture the traffic from a specific interface, source, destination and destination port"
    sj_gash_print_body "tcpdump -i eth0 src <source-ip e.g. 192.168.0.100> and dst <dst-ip 12.34.56.78> and dst port <dest-port e.g. 80>"

  elif [ $CHEATSHEET == "xfs_growfs" ]; then
    
    sj_gash_print_title "Extend a bfs filesystem after resizing the partition"
    sj_gash_print_body "sudo xfs_growfs -d /dev/disk[0-9]"

  else
      printf "$SJG_RED Could not find cheatsheet for: $CHEATSHEET"
  fi
fi
