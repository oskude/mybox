function LocalesGenerated {
	local togen=($(grep -v '^#' "$template/etc/locale.gen" | cut -d " " -f 1))
	local isgen=($(localectl list-locales))

	[[ ${togen[*]} = ${isgen[*]} ]]
}
