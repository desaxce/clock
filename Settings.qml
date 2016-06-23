import QtQuick 2.0
import Ubuntu.Components 0.1
import QtQuick.Dialogs 1.2

Rectangle {
	id: settings
	width: 320
	height: 480
	color: "white"

	ListModel {
		id: clockModel
		ListElement { name: "Default"; startTime: 30}
		ListElement { name: "Blitz"; startTime: 10}
	}

	Component {
		id: clockDelegate
		Row {
			id: fruit
			width: settings.width
			Text {
				width: settings.width/2
				anchors.left: settings.left
				text: name;
				font.pixelSize: 24
			}

			Text {
				anchors.right: settings.right
				text: "X"
				font.pixelSize:24

				MouseArea {
					anchors.fill: parent
					onClicked: {
						clockModel.remove(index)
					}
				}
			}
		}
	}

	ListView {
		anchors.fill: parent
		//clip: true
		width: settings.width
		model: clockModel
		delegate: clockDelegate
		header: bannerComponent
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

	Dialog {
		id: editor
		title: "Clock Editor"
		standardButtons: StandardButton.Ok | StandardButton.Cancel
		
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

		onAccepted: {
			console.log(clockName.text + "\t" + clockStartTime.text);
			clockModel.append({name: clockName.text, startTime: clockStartTime.text});
		}
	}

	Text {
		id: addButton
		text: "+"
		font.pixelSize: 36
		anchors.top: settings.top

		MouseArea {
			anchors.fill: parent
			onClicked: {
				editor.open()
			}
		}
	}
}
