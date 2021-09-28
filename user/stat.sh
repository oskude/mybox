if id -u human &>/dev/null; then
	MsgOk "OK: user 'human' exists"
else
	MsgEr "MISS: user 'human' does not exist"
fi
