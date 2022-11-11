# :computer: Born2BeRoot

## Table of Contents

- [Introduction](#introduction)
- [Mandatory part](#mandatory-part)
    - [Choosing the OS](#choosing-the-os)
    - [Creating the partitions](#creating-the-partitions)
    - [Groups and users](#groups-and-users)
    - [Downloading necessary packages](#downloading-and-configuring-necessary-packages)
- [Tasks](#tasks)

## Introduction

This project aims to be an introduction to the wonderful world of virtualization. The use of VirtualBox (or UTM) is mandatory.

The subject of the project can be found in [this link](https://raw.githubusercontent.com/angelamcosta/born2beroot/main/en.subject.pdf).

## Mandatory part

### Choosing the OS

Since I'm new to system administration, I've chosen Debian because it's more user-friendly and because it has a vast amount of packages in its default repository.

### Creating the partitions

To complete the mandatory part, you must create at least 2 encrypted partitions using LVM. I’ve chosen to create the partitions structure of the bonus part. The structure is as shown below:

![partitions bonus](https://raw.githubusercontent.com/angelamcosta/born2beroot/main/src/partitions%20structure.png)
    
I've created the partitions using the following configs:
    
    500M - Primary - Beginning - Ext2 - /boot
    
    max - Logical - physical volume for encryption
    
    - Configure the encrypted volumes
        - Choose encryption password (save it, you should take notes of all the passwords you are creating)
    - Configure the Logical Volume Manager
        - Create volume group
        - Choose a name for your vg
        - Select the encrypted partition
        - Create the logical volumes
        - Format the logical volumes accordingly
        
### Groups and users

As is stated in the subject, in addition to the root user, a user with your login as username has to be present. This user has to belong to the user42 and sudo groups. We will use the commands `addgroup user42` to create the user42 group, `adduser <your_login> user42` to add your user to it, and `adduser <your_login> sudo` to add your user to the sudo group. You can also check if everything is correct by using the command `getent group <name_of_the_group>` to see if your user is a part of it.

### Downloading and configuring necessary packages

After unlocking the disk, login with the user created during installation and then use the command `su -` to login as root. You will need a few packages (download only what you will use). I chose to download the following:

#### Openssh

```
    apt-get install openssh-server
```

To configure the shh port and permissions. As per subject instructions, an SSH service will be running on port 4242 only. For security reasons, it must not be possible to connect using SSH as root. We will alter in the /etc/ssh/sshd_config file the lines `#Port 22` to `Port 4242` and `#PermitRootLogin prohibit-password` to `PermitRootLogin no` (both *without* the hashtag). Finally, can use the commands `sudo service ssh restart` and `sudo service ssh status` to check if everything is working accordingly.

#### UFW

```
    apt-get install ufw
```

To configure firewall permissions. We can use `ufw status` to check if the service is active (initially it will be inactive). Then, we can use `ufw allow 4242` to allow connections using the 4242 port. Finally, we can use the commands `ufw enable` and `ufw status` to check if the service is active and the ports are correct.

#### Sudo

```
    apt-get install sudo
```

To configure the sudo command. We can use the command `sudo visudo` to access the sudo config file. We will add the following lines:

-   Authentication using sudo has to be limited to 3 attempts in the event of an incorrect password.

```
    Defaults    passwd_tries=3
```

Note: *This is the default option, but we will make it explicit.*

-   A custom message of your choice has to be displayed if an error due to a wrong password occurs when using sudo.

```
    Defaults    badpass_message="<you error message>"
```

-   Each action using sudo has to be archived, both inputs and outputs. The log file has to be saved in the /var/log/sudo/ folder.


```
    Defaults    logfile=/var/log/sudo/<name of your file>.log
    Defaults    log_input, log_output
```

-   The TTY mode has to be enabled for security reasons.

```
    Defaults    requiretty
```

-   For security reasons too, the paths that can be used by sudo must be restricted.

```
    Defaults secure_path="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/snap/bin"
```

#### libpam-pwquality

```
    apt-get install libpam-pwquality
```

To set up a strong password policy. We will alter in the /etc/pam.d/common-password file the following line:

```
    password    requisite       pam_quality.so  retry=3 difok=7 minlen=10 dcredit=-1 ucredit=-1 maxrepeat=3 enforce_for_root reject_username
```

We will also alter the following lines in the /etc/login.defs file

```
    PASS_MAX_DAYS   30
    PASS_MIN_DAYS   2
```

## Tasks

- :ballot_box_with_check: signature.txt
- :ballot_box_with_check: monitoring.sh
- :white_large_square: Bonus part (ongoing)
