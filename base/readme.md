# [mµbox](../readme.md) base

## alkit

| | | | | |
|-|-|-|-|-|
| [`pkgs.list`](pkgs.list) | [`stat.sh`](stat.sh) | [`diff.sh`](diff.sh) | [`push.sh`](push.sh) | [`lib.sh`](lib.sh) |

## custom

| | |
|-|-|
| [etc/aldos](https://man.archlinux.org/man/systemd.generator.7) | [`etc/systemd/system-generators/aldos`](etc/systemd/system-generators/aldos) |

## basics

| | |
|-|-|
| [host name](https://tools.ietf.org/html/rfc1178) | [`etc/hostname`](etc/hostname) |
| [locales](https://wiki.archlinux.org/index.php/Locale#Generating_locales) | [`etc/locale.gen`](etc/locale.gen) |
| [locale](https://wiki.archlinux.org/index.php/Locale#Setting_the_system_locale) | [`etc/locale.conf`](etc/locale.conf) |
| [timezone](https://wiki.archlinux.org/index.php/System_time#Time_zone) | [`etc/localtime`](#symlink) |

## mounts

| | |
|-|-|
| [temp to ram](https://man.archlinux.org/man/systemd.mount.5) | [`etc/aldos/tmp.mount`](etc/aldos/tmp.mount) |
| [logs to ram](https://man.archlinux.org/man/systemd.mount.5) | [`etc/aldos/var-log.mount`](./etc/aldos/var-log.mount) |

## services

| | |
|-|-|
| [dhcp client](https://wiki.archlinux.org/title/Dhcpcd) | [`etc/aldos/dhcpcd.service`](#symlink) |
| [ntp client](https://wiki.archlinux.org/title/Systemd-timesyncd) | [`etc/aldos/systemd-timesyncd.service`](#symlink) |
