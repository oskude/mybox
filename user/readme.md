# [mµbox](../readme.md) user

## alkit

| | | | | |
|-|-|-|-|-|
| [`pkgs.list`](pkgs.list) | [`stat.sh`](stat.sh) | [`diff.sh`](diff.sh) | [`push.sh`](push.sh) |

## home

- TODO: can we get a linux filesystem that writes to the disk right away? so we don't need to umount/sync manually...

| | |
|-|-|
| ram mount | [`etc/aldos/home-human.mount`](etc/aldos/home-human.mount) |
| user files | [`etc/aldos/user-files.path`](etc/aldos/user-files.path) |
| user files | [`etc/aldos/user-files.service`](etc/aldos/user-files.service) |
| user files | [`etc/aldos/user-files.sh`](etc/aldos/user-files.sh) |

## login

- TODO: move getty thing to etc/aldos

| | |
|-|-|
| auto login | [`etc/systemd/system/getty@tty1.service.d/override.conf`](etc/systemd/system/getty@tty1.service.d/override.conf) |
| auto desktop | [`etc/profile.d/start-desktop.sh`](etc/profile.d/start-desktop.sh) |

## access

| | |
|-|-|
| sudo rights | [`etc/sudoers.d/human`](etc/sudoers.d/human) |
