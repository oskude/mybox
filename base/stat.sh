source $template/lib.sh

if LocalesGenerated
then
	MsgOk "OK: locales generated"
else
	MsgEr "MISS: locales not generated"
fi
