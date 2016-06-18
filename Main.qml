import QtQuick 2.0

Rectangle {
	id: page
	width: 320; height: 480
	color: "lightgray"
	property var onColor: "orange"
	property var offColor: "gray"

	// TODO: create only one method called switchClocks
	function startTwo() {
		if (player2.running == false) {
			player1.running = false
			player1.cellColor = offColor
			player2.startTime = new Date().getTime()
			player2.running = true
			player2.cellColor = onColor
		}
	}

	function startOne() {
		if (player1.running == false) {
			player2.running = false
			player2.cellColor = offColor
			player1.startTime = new Date().getTime()
			player1.running = true
			player1.cellColor = onColor
		}
	}

	Time { 
		id: player1
		cellColor: offColor
		anchors.top: page.top
		rotation: 180
		onClicked: startTwo()
	}

	Time {
		id: player2
		cellColor: offColor
		anchors.bottom: page.bottom
		onClicked: startOne()
	}
}
