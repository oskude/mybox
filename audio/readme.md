# [mµbox](../readme.md) audio

## alkit

| | | | | |
|-|-|-|-|-|
| [`pkgs.list`](pkgs.list) | [`stat.sh`](stat.sh) | [`diff.sh`](diff.sh) | [`push.sh`](push.sh) |

## system

- TODO: rename audio ports (to whats on the tin)?

| | |
|-|-|
| [disable internal](https://wiki.archlinux.org/title/Kernel_module#Blacklisting) | [`etc/modprobe.d/audio.conf`](etc/modprobe.d/audio.conf) |
| [device names](https://gitlab.freedesktop.org/pipewire/pipewire/-/wikis/Config-pipewire-media-session#matching-rules) | [`etc/pipewire/media-session.d/alsa-monitor.conf`](etc/pipewire/media-session.d/alsa-monitor.conf) |
| [jack override](https://gitlab.freedesktop.org/pipewire/pipewire/-/wikis/Config-JACK#installation) | [`etc/ld.so.conf.d/pipewire-jack.conf`](etc/ld.so.conf.d/pipewire-jack.conf) |
