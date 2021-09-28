import QtQuick 2.15

Rectangle {
	id: root
	property int button

	width: height * 3
	color: win.bcolor
	radius: height

	Canvas {
		anchors.fill: parent
		onPaint: {
			let ctx = getContext("2d")
			let w = Math.round(width/3)
			ctx.fillStyle = win.fcolor
			if (button === 1) {
				ctx.beginPath()
				ctx.arc(
					w/2,
					height/2,
					height/2,
					Math.PI / 2,
					Math.PI + (Math.PI / 2),
					false
				)
				ctx.lineTo(w, 0)
				ctx.lineTo(w, height)
				ctx.fill()
			}
			else if (button === 2) {
				ctx.fillRect(w, 0, w, height)
			}
			else if (button === 3) {
				ctx.beginPath()
				ctx.arc(
					w*2 + w/2,
					height/2,
					height/2,
					Math.PI / 2,
					Math.PI + (Math.PI / 2),
					true
				)
				ctx.lineTo(w*2, 0)
				ctx.lineTo(w*2, height)
				ctx.fill()
			}
			else if (button === 4) {
				ctx.fillRect(w, 0, w, height/2)
			}
			else if (button === 5) {
				ctx.fillRect(w, height/2, w, height/2)
			}
		}
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
