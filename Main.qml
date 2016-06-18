import QtQuick 2.0

Rectangle {
	id: page
	width: 320; height: 480
	color: "lightgray"


	Time { cellColor: "red"; anchors.top: page.top}

	Time { cellColor: "gray"; anchors.bottom: page.bottom}
}
