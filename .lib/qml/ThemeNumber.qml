import QtQuick 2.15

Item {
	property alias key: label.text
	property alias val: entry.text
	implicitWidth: childrenRect.width
	implicitHeight: childrenRect.height
	Row {
		Label {
			id: label
		}
		EntryNumber {
			id: entry
			min: 0
			max: 99
			onTextEdited: {
				theme.values[key] = parseInt(text)
				theme.valuesChanged()
			}
		}
	}
}
