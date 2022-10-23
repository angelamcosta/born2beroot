# Born2BeRoot

## Table of Contents

- [Introduction](#introduction)
- [Mandatory part](#mandatory-part)
- [Tasks](#tasks)

## Introduction

This project project aims to be an introduction to the wonderful world of virtualization. The use of VirtualBox (or UTM) is mandatory.

The subject of the project can be found in [this link](https://raw.githubusercontent.com/angelamcosta/born2beroot/main/en.subject.pdf).

## Mandatory part

### Choosing the OS

Since I'm new to system administration, I've chosen Debian because it's more user-friendly and because it has a vast amount of packages in its default repository.

### Creating the partitions

To complete the mandatory part, you must create at least 2 encrypted partitions using LVM. I’ve chosen to create the partitions structure of the bonus part. The structure is as shown below:

![partitions bonus](https://raw.githubusercontent.com/angelamcosta/born2beroot/main/src/partitions%20structure.png)
    
I've created the partitions using the folling configs:
    
    500M - Primary - Beginning - Ext2 - /boot
    
    max - Logical - physical volume for encryption
    
    - Configure the encrypted volumes
        - Choose encryption password (save it, you should take notes of all the passwords you are creating)
    - Configure the Logical Volume Manager
        - Create volume group
        - Choose a name for you vg
        - Select the encrypted partition
        - Create the logical volumes
        - Format the logical volumes accordingly

## Tasks

- :white_large_square: signature.txt (ongoing)
- :white_large_square: monitoring.sh (ongoing)
- :white_large_square: Bonus part (ongoing)

