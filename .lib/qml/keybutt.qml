import QtQuick 2.15
import QtQuick.Window 2.15
import QtQml.Models 2.15

Window {
	id: win
	width: winw
	height: winh
	x: winx
	y: winy
	visible: true
	color: "black"
	flags: Qt.SplashScreen | Qt.X11BypassWindowManagerHint
	title: "keybutt"

	property color fcolor: fcol
	property color bcolor: bcol

	property ObjectModel itemList: ObjectModel{
		Item {} // TODO: bug or feature? anim is wonky if list empty
	}

	ListView {
		id: listView
		//anchors.fill: parent
		height: win.height - (spacing * 2)
		width: childrenRect.width
		anchors.centerIn: parent
		model: itemList
		orientation: ListView.Horizontal
		spacing: 2
		anchors.topMargin: 2
		/*
		removeDisplaced: Transition {
			NumberAnimation {
				property: "x"
				duration: 250
			}
		}
		*/
	}

	Component.onCompleted: {
		kb.mouseEvent.connect(onMouse)
		kb.keyEvent.connect(onKey)
	}

	function onMouse (press, bnum) {
		if (press) {
			let comp = Qt.createComponent("MouseItem.qml")
			let item = comp.createObject(null, {
				button: bnum,
				height: win.height - 2 * listView.spacing
			})
			itemList.append(item)
		} else {
			if (bnum === 4 || bnum === 5) {
				// note: mouse scroll press false is too fast
				delayCall(100, ()=>{removeMouse(bnum)})
			} else {
				removeMouse(bnum)
			}
		}
	}

	function onKey (press, ksym) {
		removeKey(ksym) // also remove repeated keys
		if (press) {
			// TODO: is this cached? if not, cache ourself?
			let comp = Qt.createComponent("KeyItem.qml")
			let item = comp.createObject(null, {
				text: ksym,
				height: win.height - 2 * listView.spacing
			})
			itemList.append(item)
		}
	}

	function removeMouse (bnum) {
		for (let i = 0; i < itemList.count; i++) {
			let item = itemList.get(i)
			if (!item) continue
			if (item.button === bnum) {
				// TODO: do we need to destroy the item?
				itemList.remove(i)
				break
			}
		}
	}

	function removeKey (ksym) {
		for (let i = 0; i < itemList.count; i++) {
			let item = itemList.get(i)
			if (!item) continue
			if (item.text === ksym) {
				// TODO: do we need to destroy the item?
				itemList.remove(i)
				break
			}
		}
	}

	function delayCall (time, cb) {
		let timer = Qt.createQmlObject("import QtQuick 2.15; Timer {}", win)
		timer.interval = time
		timer.repeat = false
		timer.triggered.connect(cb)
		timer.triggered.connect(function rem(){
			timer.triggered.disconnect(cb)
			timer.triggered.disconnect(rem)
		})
		timer.start()
	}
}
