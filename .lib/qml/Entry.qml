import QtQuick 2.15

// TODO: select colors

Rectangle {
	id: root
	property alias text: txt.text
	property alias textColor: txt.color
	signal textEdited()
	color: theme.values.color00
	implicitWidth: txt.width
	implicitHeight: txt.height

	TextInput {
		id: txt
		font.family: theme.values.fontname
		font.pixelSize: theme.values.fontsize
		color: theme.values.color07
		padding: Math.round(theme.values.fontsize / 2)
		topPadding: Math.round(padding / 2)
		bottomPadding: topPadding
		selectByMouse: true
		onAccepted: parent.textEdited()
	}
}
