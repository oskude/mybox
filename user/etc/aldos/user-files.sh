#!/usr/bin/bash

user="human"
userdir="/home/$user"
labelexp='^aldos_user.*'
partroot='/dev/disk/by-partlabel'
mntroot='/mnt/aldos'
mntopts='user,noatime'

# remove symlinks to $mntroot from $userdir
for mntpath in $(find "$mntroot" -mindepth 1 -maxdepth 1 -type d); do
	for path in $(find "$userdir" -mindepth 1 -maxdepth 1 -type l); do
		if [[ $(readlink "$path") == "$mntpath/"* ]]; then
			[[ ! -e "$path" ]] && rm "$path"
		fi
	done
done

# NOTE: if no disk with partlabel, /dev/disk/by-partlabel does not exist
[[ ! -e "$partroot" ]] && exit 0

# mount partitions that match $labelexp
# and symlink files in root to $userdir
for partpath in $(find "$partroot" -mindepth 1 -maxdepth 1 -type l); do
	label=${partpath#$partroot/}
	[[ $label =~ $labelexp ]] || continue
	mntpath="$mntroot/$label"
	findmnt "$mntpath" && continue
	mkdir -p "$mntpath"
	mount -o "$mntopts" "$partpath" "$mntpath"
	chown $user:$user "$mntpath"
	for path in $(find "$mntpath" -mindepth 1 -maxdepth 1 -type f,d); do
		runuser -u $user -- ln -s "$path" "$userdir/"
	done
done
