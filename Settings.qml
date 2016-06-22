import QtQuick 2.0

Rectangle {
	id: settings
	width: parent.width
	height: parent.height
	color: "white"

	ListModel {
		id: clockModel
		ListElement { name: "Default"}
	}

	Component {
		id: clockDelegate
		Text {
			text: name;
			font.pixelSize: 24
			anchors.horizontalCenter: clockDelegate.horizontalCenter
		}
	}

	ListView {
		anchors.fill: parent
		clip: true
		model: clockModel
		delegate: clockDelegate
		header: bannerComponent
		highlight: Rectangle {
			width: parent.width
			color: "lightgray"
		}
	}

	Component {
		id: bannerComponent
		Rectangle {
			id: banner
			width: parent.width; height: 50
			border {color: "#9EDDF2"; width: 2}
			Text {
				anchors.centerIn: parent
				text: "Clocks available"
				font.pixelSize:32
			}
		}
	}
}
