# Born2BeRoot

[![forthebadge](https://forthebadge.com/images/badges/made-with-c.svg)](https://forthebadge.com)

## Table of Contents

- [Introduction](#introduction)
- [Mandatory part](#mandatory-part)
  - [Mandatory part](#mandatory-part-1)
  - [The script](#the-script)
  - [Bonus part](#bonus-part)
- [Tasks](#tasks)

## Introduction

This project project aims to be an introduction to the wonderful world of virtualization. The use of VirtualBox (or UTM) is mandatory.

The subject of the project can be found in [this link](https://raw.githubusercontent.com/angelamcosta/born2beroot/main/en.subject.pdf).

## Mandatory part

### Mandatory part

<details closed>
<summary> OS Setup </summary>

- Create at least 2 encrypted partitions using LVM.
- A SSH service will be running on port 4242 only. For security reasons, it must not be possible to connect using SSH as root.
- The hostname of your virtual machine must be your login ending with 42 (e.g., wil42). You will have to modify this hostname during your evaluation.
- You have to implement a strong password policy.
  * Your password has to expire every 30 days.
  * The minimum number of days allowed before the modification of a password will be set to 2.
  * The user has to receive a warning message 7 days before their password expires.
  * Your password must be at least 10 characters long. It must contain an uppercase letter and a number. Also, it must not contain more than 3 consecutive identical characters.
  * The password must not include the name of the user.
  * The following rule does not apply to the root password: The password must have
at least 7 characters that are not part of the former password.
  * Of course, your root password has to comply with this policy.
- You have to install and configure sudo following strict rules.
- In addition to the root user, a user with your login as username has to be present.
- This user has to belong to the user42 and sudo groups.
- Authentication using sudo has to be limited to 3 attempts in the event of an incorrect password.
- A custom message of your choice has to be displayed if an error due to a wrong password occurs when using sudo.
- Each action using sudo has to be archived, both inputs and outputs. The log file has to be saved in the /var/log/sudo/ folder.
- The TTY mode has to be enabled for security reasons.
- For security reasons too, the paths that can be used by sudo must be restricted.

</details>

### The script

<details closed>
<summary> Finally, you have to create a simple script called monitoring.sh. It must be developed in bash. </summary>

- Your script must always be able to display the following information:
- The architecture of your operating system and its kernel version.
- The number of physical processors.
- The number of virtual processors.
- The current available RAM on your server and its utilization rate as a percentage.
- The current available memory on your server and its utilization rate as a percentage.
- The current utilization rate of your processors as a percentage.
- The date and time of the last reboot.
- Whether LVM is active or not.
- The number of active connections.
- The number of users using the server.
- The IPv4 address of your server and its MAC (Media Access Control) address.
- The number of commands executed with the sudo program.

</details>

### Bonus part

<details closed>
<summary> Bonus part </summary>

- Set up partitions correctly so you get a structure similar to the one below
![partitions bonus](https://raw.githubusercontent.com/angelamcosta/born2beroot/main/src/partitions%20structure.png)
- Set up a functional WordPress website with the following services: lighttpd, MariaDB, and PHP.
- Set up a service of your choice that you think is useful (NGINX / Apache2 excluded!). During the defense, you will have to justify your choice.

</details>

## Tasks

- :white_large_square: signature.txt
- :white_large_square: monitoring.sh
- :white_large_square: Bonus part

