import QtQuick 2.0

Rectangle {
	id: reset
	// TODO:to remove once design finished
	color: "white"

	property var darkgrey
	property var lightgrey

	property var thickness: 15
	
	Rectangle {
		id: outerCircle
		width: reset.width
		height: reset.height
		color: lightgrey
		anchors {
			horizontalCenter: reset.horizontalCenter
			verticalCenter: reset.verticalCenter
		}
		smooth: true
		radius: width*0.5

		Rectangle {
			// TODO: fix this constant value
			width: outerCircle.width-reset.thickness
			height: outerCircle.height-reset.thickness
			color: darkgrey
			anchors {
				horizontalCenter: outerCircle.horizontalCenter
				verticalCenter: outerCircle.verticalCenter
			}
			smooth: true
			radius: width*0.5
		}
	}

	// Gum to remove part of the circles
	Rectangle {
		id: gomme
		color: darkgrey
		width: triangle.width
		height: triangle.height/2
		x: triangle.x
		y: triangle.y + triangle.height
	}
	
	Triangle {
		id: triangle
		width: reset.thickness
		height: reset.thickness
		color: lightgrey
		rotation: 45

		x: reset.width-triangle.width + 5*reset.thickness/21
		y: reset.height/2-triangle.height
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
