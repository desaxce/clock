import QtQuick 2.0
import Ubuntu.Components 0.1
import QtQuick.Window 2.2

Window {
	id: editor
	title: "Clock Editor"
	property alias name: clockName.text
	property alias timer: clockStartTime.text
	width: parent.width
	height: parent.height

	signal addClicked()

	TextField {
		anchors.top: editor.top
		id: clockStartTime
		text: "Start time"
		validator: IntValidator{}
	}

	TextField {
		anchors.top: clockStartTime.bottom
		id: clockName
		text: "Clock name"
	}

	Text {
		id: addButton
		anchors.top: clockName.bottom
		text: "Add"
		MouseArea {
			anchors.fill: parent
			onClicked: addClicked()
		}
	}
}
