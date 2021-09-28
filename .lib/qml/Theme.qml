import QtQuick 2.15
import QtQml.Models 2.15

Item {
	id: root
	property string themefile: ""
	property ObjectModel itemModel: ObjectModel{}
	property var values: {}
	property var legacy: {
		"fontsize" : 10,
		"fontname" : "monospace",
		"color00" : "#000000", // console/input background / button foreground
		"color07" : "#AAAAAA", // console/input foreground / button background
		"color08" : "#555555", // window background
		"color15" : "#FFFFFF", // window foreground
		"color01" : "#AA0000",
		"color02" : "#00AA00",
		"color03" : "#AA5500",
		"color04" : "#0000AA",
		"color05" : "#AA00AA",
		"color06" : "#00AAAA",
		"color09" : "#FF5555",
		"color10" : "#55FF55",
		"color11" : "#FFFF55",
		"color12" : "#5555FF",
		"color13" : "#FF55FF",
		"color14" : "#55FFFF",
	}

	Component.onCompleted: {
		let args = Qt.application.arguments.slice(2)
		if (args[0] == "--") args = args.slice(1)
		if (args.length >= 1) {
			try {
				themefile = args[0]
				values = JSON.parse(readFile(themefile))
			} catch (e) {
				console.log("SORRY: please provide absolute path to theme file...")
				Qt.quit();
			}
		} else {
			let sysdef = readFile("/etc/aldos/theme.json")
			if (sysdef) {
				themefile = "/etc/aldos/theme.json"
				values = JSON.parse(sysdef)
			} else {
				values = Object.assign({}, legacy)
			}
		}
		for (let key in values) {
			let val = values[key]
			let comp = null
			if (!isNaN(val)) {
				comp = Qt.createComponent("ThemeNumber.qml")
			} else if (val.startsWith("#")) {
				comp = Qt.createComponent("ThemeColor.qml")
			} else {
				comp = Qt.createComponent("ThemeText.qml")
			}
			let item = comp.createObject(null,{
				key: key,
				val: Qt.binding(function(){return values[key]})
			})
			itemModel.append(item)
		}
	}

	function resetTheme () {
		values = Object.assign({}, legacy)
	}

	function loadTheme () {
		if (!themefile) {
			values = Object.assign({}, legacy)
			return
		}
		let content = readFile(themefile)
		let data = JSON.parse(content)
		for (let key in data) {
			values[key] = data[key]
		}
		valuesChanged()
	}

	function saveTheme () {
		let content = JSON.stringify(values, null, "\t")
		writeFile(themefile, content)
	}
}
