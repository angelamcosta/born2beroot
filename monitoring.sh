#!/bin/bash
# Bash script

wall "
Operating System: $(. /etc/os-release; echo "$NAME")
Kernel: $(uname -r)
CPU(s): $(nproc)
vCPU(s): $(cat /proc/cpuinfo | grep processor | wc -l)
$(free --mega | grep Mem | awk '{ printf("Memory Usage: %.0f/%.0fMB (%.2f%%)\n", $3, $2, $3/$2 * 100.0) }')
$(df -h . | sed 1d | awk '{ printf("Disk Usage: %.2f/%.2fGb (%.0f%%)\n", $3, $4, $5) }')
$(grep 'cpu ' /proc/stat | awk '{ printf("CPU load: %.2f%%\n", ($2+$4)*100/($2+$4+$5)) }')
$(who -b | awk '{ print("Last reboot: "$3 " " $4) }')
Connections TCP: $(ss -tn src :4242 | grep -i "estab" | wc -l) ESTABLISHED
User log: $(who | wc -l)
Network: IP $(ip addr | grep "inet " | sed 1d | awk '{ print($2) }') ($(ip addr | grep ether | awk '{ print($2) }'))
Sudo: $(cat /var/log/sudo/sudo.log | wc -l | awk '{ print $1/2 }') cmd
$(if grep -q /dev/mapper /etc/fstab
	then
echo "LVM is in use"
	else
echo "LVM not in use"
	fi)
"