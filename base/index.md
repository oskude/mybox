# System

Everything i need/want for a basic system.

## etc/aldos

Cause i'm lazy, there's a systemd unit [generator](https://man.archlinux.org/man/systemd.generator.7) to enable and load units from single files in `etc/aldos`.

- [`etc/systemd/system-generators/aldos`](etc/systemd/system-generators/aldos)

## Basics

- [`etc/hostname`](etc/hostname)
- [`etc/locale.conf`](etc/locale.conf)
- [`etc/locale.gen`](etc/locale.gen)
- `etc/localtime`

## Mounts

- [`etc/aldos/tmp.mount`](etc/aldos/tmp.mount)
- [`etc/aldos/var-log.mount`](etc/aldos/var-log.mount)

## Services

- `etc/aldos/dhcpcd.service`
