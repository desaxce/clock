import QtQuick 2.0

Rectangle {
	id: page
	width: 320; height: 480
	color: "lightgray"


	Time { cellColor: "gray"; anchors.top: page.top; rotation: 180}

	Time { cellColor: "gray"; anchors.bottom: page.bottom}
}
