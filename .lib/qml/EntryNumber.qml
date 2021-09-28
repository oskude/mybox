import QtQuick 2.15

Rectangle {
	id: root
	property alias text: txt.text
	property int min: 0
	property int max: 10
	signal textEdited()

	color: theme.values.color00
	implicitWidth: txt.width
	implicitHeight: txt.height

	FontMetrics {
		id: fm
		font.family: theme.values.fontname
		font.pixelSize: theme.values.fontsize
	}

	TextInput {
		id: txt
		font.family: theme.values.fontname
		font.pixelSize: theme.values.fontsize
		width: (fm.maximumCharacterWidth * max.toString().length) + theme.values.fontsize
		color: theme.values.color07
		padding: Math.round(theme.values.fontsize / 2)
		topPadding: Math.round(padding / 2)
		bottomPadding: topPadding
		onEditingFinished: root.textEdited()
		MouseArea {
			anchors.fill: parent
			onWheel: {
				let n = parseInt(txt.text)
				if (wheel.angleDelta.y > 0) {
					if (++n > root.max) n = root.max
				} else {
					if (--n < root.min) n = root.min
				}
				txt.clear()
				txt.insert(0, n.toString())
				root.textEdited()
			}
		}
	}
}
