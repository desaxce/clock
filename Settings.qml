import QtQuick 2.0
import Ubuntu.Components 0.1
import QtQuick.Window 2.2

Window {
	id: settings
	width: parent.width
	height: parent.height
	color: "white"
	visible: false

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

	Editor {	
		id: clockEditor
		visible: false
		onAddClicked: {
			clockModel.append({name: name, startTime: timer})
			clockEditor.visible = false
		}
	}

	Text {
		id: addButton
		text: "+"
		font.pixelSize: 36
		anchors.top: settings.top
		anchors.left: settings.left

		MouseArea {
			anchors.fill: parent
			onClicked: {
				clockEditor.visible = true
			}

		}
	}

	Text {
		id: goBackButton
		text: "<"
		font.pixelSize: 36
		anchors.top: settings.top
		anchors.left: addButton.right

		MouseArea {
			anchors.fill: parent
			onClicked: settings.visible = false
		}
	}
}
