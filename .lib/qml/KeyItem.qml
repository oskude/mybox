import QtQuick 2.15

Rectangle {
	id: root

	property alias text: txt.text

	radius: 3
	color: win.bcolor
	width: txt.contentWidth + (txt.leftPadding * 2)
	//implicitHeight: txt.height
	//height: ListView.height

	Text {
		id: txt
		color: win.fcolor
		//anchors.centerIn: root
		leftPadding: 6
		rightPadding: leftPadding
		/*
		leftPadding: 6
		rightPadding: leftPadding
		topPadding: 3
		bottomPadding: topPadding
		*/
		height: root.height
		font.family: "monospace"
		//font.pixelSize: 16
		fontSizeMode: Text.VerticalFit
		minimumPixelSize: 2
		font.pixelSize: 120
	}

	ListView.onRemove: SequentialAnimation {
		PropertyAction {
			target: root
			property: "ListView.delayRemove"
			value: true
		}
		NumberAnimation {
			target: root
			property: "opacity"
			to: 0
			duration: 250
		}
		PropertyAction {
			target: root
			property: "ListView.delayRemove"
			value: false
		}
	}
}
