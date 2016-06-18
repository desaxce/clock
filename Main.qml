import QtQuick 2.0

Rectangle {
	id: page
	width: 320; height: 480
	color: "lightgray"


	function startTwo() {
		if (player1.running = true) {
			player1.running = false
			player2.startTime = new Date().getTime()
			player2.running = true
		}
	}

	function startOne() {
		if (player2.running = true) {
			player2.running = false
			player1.startTime = new Date().getTime()
			player1.running = true
		}
	}

	Time { 
		id: player1
		cellColor: "gray"
		anchors.top: page.top
		rotation: 180
		running: false
		onClicked: startTwo()
	}

	Time {
		id: player2
		cellColor: "gray"
		anchors.bottom: page.bottom
		running: true
		startTime: new Date().getTime()
		onClicked: startOne()
	}
}
