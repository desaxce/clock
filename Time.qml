import QtQuick 2.0

Item {
	id: container
	property alias cellColor: rectangle.color
	width:320; height: 200
	signal clicked()

	Rectangle {
		id: rectangle
		border.color: "white"
		anchors.fill: parent
	}

	MouseArea {
		anchors.fill: parent
		onClicked: container.clicked()
	}

	Text {
		id: helloText
		text: "Hello world!"
		y: 30
		anchors.horizontalCenter: container.horizontalCenter
		font.pointSize: 24; font.bold: true
	}
}
