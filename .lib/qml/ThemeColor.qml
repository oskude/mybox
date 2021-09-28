import QtQuick 2.15

Item {
	id: root
	property int pre: 100
	property color val
	property color pval
	//property alias key: label.text
	property string key
	property int hue
	property int sat
	property int lit

	implicitWidth: childrenRect.width
	implicitHeight: childrenRect.height

	onValChanged: {
		// TODO: bug/feature? hue is sometimes -1
		let h = val.hslHue
		if (h < 0) h = 0.0
		thue.text = hue = Math.round(h * pre)
		tsat.text = sat = Math.round(val.hslSaturation * pre)
		tlit.text = lit = Math.round(val.hslLightness * pre)
	}

	Row {
		Label {
			id: label
		}
		Entry {
			id: entry
			text: val
			onTextEdited: {
				theme.values[key] = text
				theme.valuesChanged()
			}
		}
		EntryNumber {
			id: thue
			text: hue; min: 0; max: pre
			onTextEdited: {
				hue = parseInt(text)
				let c = Qt.hsla(hue/pre, sat/pre, lit/pre, 1.0)
				theme.values[key] = c.toString()
				theme.valuesChanged()
			}
		}
		EntryNumber {
			id: tsat
			text: sat; min: 0; max: pre
			onTextEdited: {
				sat = parseInt(text)
				let c = Qt.hsla(hue/pre, sat/pre, lit/pre, 1.0)
				theme.values[key] = c.toString()
				theme.valuesChanged()
			}
		}
		EntryNumber {
			id: tlit
			text: lit; min: 0; max: pre
			onTextEdited: {
				lit = parseInt(text)
				let c = Qt.hsla(hue/pre, sat/pre, lit/pre, 1.0)
				theme.values[key] = c.toString()
				theme.valuesChanged()
			}
		}
		Rectangle {
			height: tlit.height
			width: height
			color: val
		}
		Rectangle {
			height: tlit.height
			width: height
			color: pval
		}
		Label {
			text: "lab"
			color: val
		}
		Label {
			text: "lab"
			color: pval
		}
		Entry {
			text: "inp"
			textColor: val
		}
		Entry {
			text: "inp"
			textColor: pval
		}
		Button {
			text: "but"
			textColor: val
		}
		Button {
			text: "but"
			textColor: pval
		}
	}

	// TODO: stupid in code, nice on screen...
	onKeyChanged: {
		let magic = 8 // really stupid!
		let namnum = key.match(/([a-z]+)([0-9]+)/)
		let name = namnum[1]
		let cnum = parseInt(namnum[2])
		let pnum = cnum + magic
		if (pnum >= (magic * 2)) {
			pnum -= (magic * 2)
		}
		pnum = pnum.toString().padStart(2, '0')
		pval = Qt.binding(function(){
			return theme.values[`${name}${pnum}`]
		})
		cnum = cnum.toString().padStart(2, '0')
		label.text = `${name}${cnum}/${pnum}`
	}
}
