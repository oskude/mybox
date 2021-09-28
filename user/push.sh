if id -u human &>/dev/null; then
	echo "TODO: update user groups"
else
	# INFO: some groups are not available until the app is installed
	useradd --create-home --shell /bin/bash human
fi
