import QtQuick 2.15

Rectangle {
	id: root
	property alias text: txt.text
	property alias textColor: txt.color
	property bool selected: false
	signal clicked ()
	color: mouse.pressed | selected ? theme.values.color00 : theme.values.color07
	implicitWidth: txt.width
	implicitHeight: txt.height
	Text {
		id: txt
		color: mouse.pressed | root.selected ? theme.values.color07 : theme.values.color00
		anchors.centerIn: parent
		font.family: theme.values.fontname
		font.pixelSize: theme.values.fontsize
		padding: Math.round(theme.values.fontsize / 2)
		topPadding: Math.round(padding / 2)
		bottomPadding: topPadding
		MouseArea {
			id: mouse
			anchors.fill: parent
			onClicked: root.clicked()
		}
	}
}
