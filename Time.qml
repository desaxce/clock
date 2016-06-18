import QtQuick 2.0

Item {
	id: container
	property alias cellColor: rectangle.color
	width:320; height: 200
	signal clicked()
	property var timeLeft: 20000
	property bool running: false
	
	Rectangle {
		id: rectangle
		border.color: "white"
		anchors.fill: parent
	}

	// TODO: add 0's at the begining of numbers
	function computeText(t) {
		var minutes = Math.floor(t/60)
		var seconds = Math.floor(t%60)
		seconds = (seconds >= 0) ? seconds: seconds + 60
		return minutes.toString() + ":" + seconds.toString()
	}

	Text {
		id: timeDisplay
		text: computeText(container.timeLeft/1000)
		y: 30
		anchors.horizontalCenter: container.horizontalCenter
		anchors.verticalCenter: container.verticalCenter
		font.pointSize: 60; font.bold: true
	}
	
	Timer {
		id: updater
		interval: 100
		repeat: true
		running: container.running
		triggeredOnStart: false
		property var startTime
		property var endTime
		onTriggered: {
			endTime = new Date().getTime()
			container.timeLeft += startTime - endTime
			startTime = endTime
			timeDisplay.text = computeText(container.timeLeft/1000)
		}
	}

	function tryClick() {
		if (container.running == false) {
			updater.startTime = new Date().getTime()
			container.running = true
			container.clicked()
		} else {
			container.running = false
		}
	}

	MouseArea {
		anchors.fill: parent
		onClicked: tryClick()
	}
}
