import QtQuick 2.15

Text {
	padding: Math.round(theme.values.fontsize / 2)
	topPadding: Math.round(padding / 2)
	bottomPadding: topPadding
	color: theme.values.color15
	font.family: theme.values.fontname
	font.pixelSize: theme.values.fontsize
}
