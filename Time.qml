import QtQuick 2.0

Item {
	id: container
	property alias cellColor: rectangle.color
	property alias textColor: timeDisplay.color
	property alias startTime: updater.startTime
	property alias cellText: timeDisplay.text
	property var timeLeft: 20000
	property bool running: false

	width: parent.width - 20; height: 3*parent.height/8
	signal released()
	signal pressed()
	
	Rectangle {
		id: rectangle
		smooth: true
		radius: 4
		//border.color: "white"
		anchors.fill: parent
	}

	// Adds 0's at the begining of numbers
	function pad(num) {
		return ('00' + num).substr(-2);
	}

	function computeText(t) {
		var minutes = Math.floor(t/60)
		var seconds = Math.floor(t%60)
		return pad(minutes) + ":" + pad(seconds)
	}
	
	Text {
		id: timeDisplay
		text: computeText(container.timeLeft/1000)
		color: "black"
		anchors {
			horizontalCenter: container.horizontalCenter
			verticalCenter: container.verticalCenter
		}
		// TODO: adapt font size to container
		font.pointSize: 82; font.bold: false
	}
	
	Timer {
		id: updater
		interval: 10
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

	function tryPressed() {
		if (container.running == true) {
			container.pressed()
		}
	}

	MouseArea {
		anchors.fill: parent
		onReleased: container.released()
		onPressed: tryPressed()
	}
}
