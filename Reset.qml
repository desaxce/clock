import QtQuick 2.0

Rectangle {
	id: reset

	property var darkgrey
	property var lightgrey

	property var thickness: 15
	
	Rectangle {
		id: triangle
		width: reset.thickness
		height: reset.thickness
		smooth: true
		//radius: 2
		color: lightgrey
	}

	Rectangle {
		width: triangle.width
		height: triangle.height
		rotation: 45
		smooth: true
		color: "white"
		x: triangle.x-triangle.width
		y: triangle.y-triangle.height
	}

	/*Rectangle {
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
	}/*

	// Gum to remove part of the circles
	/*Rectangle {
		id: gomme
		color: darkgrey
		width: triangle.width
		height: triangle.height/2
		x: triangle.x
		y: triangle.y + triangle.height
	}*/
	

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
