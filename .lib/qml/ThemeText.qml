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
		Entry {
			id: entry
			onTextEdited: {
				theme.values[key] = text
				theme.valuesChanged()
			}
		}
	}
}
