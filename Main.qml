import QtQuick 2.0

Rectangle {
	id: page
	width: 320; height: 480
	color: "#454545"
	property var onColor: "#FF8C00"
	property var onPressedColor: "#FF6900"
	property var offColor: "#656565"
	property var onTextColor: "#FFFFFF"
	property var offTextColor: "black"
	property var clockStart: 20000

	// TODO: create only one method called switchClocks
	function startTwo() {
		if (player2.running == false) {
			player1.running = false
			player1.cellColor = offColor
			player1.textColor = offTextColor
			player2.startTime = new Date().getTime()
			player2.running = true
			player2.cellColor = onColor
			player2.textColor = onTextColor
		}
	}

	function startOne() {
		if (player1.running == false) {
			player2.running = false
			player2.cellColor = offColor
			player2.textColor = offTextColor
			player1.startTime = new Date().getTime()
			player1.running = true
			player1.cellColor = onColor
			player1.textColor = onTextColor
		}
	}
	
	function pauseClocks() {
		player1.running = false
		player2.running = false

		player2.cellColor = offColor
		player2.textColor = offTextColor

		player1.cellColor = offColor
		player1.textColor = offTextColor
	}

	function resetClocks() {
		pauseClocks()
		player1.timeLeft = clockStart
		player1.timeLeft = clockStart
		player1.cellText = player1.computeText(clockStart/1000)
		player2.cellText = player2.computeText(clockStart/1000)
	}

	Time { 
		id: player1
		cellColor: offColor
		anchors {
			top: page.top
			left: page.left
			right: page.right
			leftMargin: 10
			rightMargin: 10
			topMargin: 10
		}
		rotation: 180
		onReleased: startTwo()
		onPressed: cellColor = onPressedColor
	}

	Time {
		id: player2
		cellColor: offColor
		anchors {
			bottom: page.bottom
			left: page.left
			right: page.right
			leftMargin: 10
			rightMargin: 10
			bottomMargin: 10
		}
		onReleased: startOne()
		onPressed: cellColor = onPressedColor
	}

	Rectangle {
		id: pause
		color: page.color
		height: page.height/10
		width: height
		anchors {
			horizontalCenter: page.horizontalCenter
			verticalCenter: page.verticalCenter
		}
		
		Rectangle {
			id: leftBar
			color: offColor
			width: pause.width/3
			height: pause.height
			smooth: true
			radius: 1
			anchors.left: pause.left
			anchors.leftMargin: pause.width/12
		}

		Rectangle {
			id: rightBar
			color: offColor
			width: pause.width/3
			height: pause.height
			smooth: true
			radius: 1
			anchors.right: pause.right
			anchors.rightMargin: pause.width/12
		}

		MouseArea {
			anchors.fill: parent
			onClicked: pauseClocks()
		}
	}

	Rectangle {
		id: reset
		color: "white"
		
		height: page.height/10
		width: height
		
		// TODO: remove at the end	
		smooth: true
		radius: 2
		Text {
			text: "Reset"
			font.pointSize: 13
			anchors {
				verticalCenter: reset.verticalCenter
				horizontalCenter: reset.horizontalCenter
			}
		}
		anchors {
			verticalCenter: page.verticalCenter
			rightMargin: player1.anchors.rightMargin
			right: page.right
		}

		MouseArea {
			anchors.fill: parent
			onClicked: resetClocks()
		}
	}
}
