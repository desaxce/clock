import QtQuick 2.0

Item {
	id: container
	property alias cellColor: rectangle.color
	property alias startTime: updater.startTime
	width:320; height: 200
	signal clicked()
	property var timeLeft: 20000
	property bool running: false
	
	Rectangle {
		id: rectangle
		border.color: "white"
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
		if (container.running == true) {
			container.clicked()
		} 
	}

	MouseArea {
		anchors.fill: parent
		onClicked: tryClick()
	}
}
