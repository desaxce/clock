import QtQuick 2.0

Canvas {
	id: triangle
	width: 20
	height:20
	property var color: "red"


	onPaint: {
		var ctx = getContext("2d")
		ctx.lineWidth = 4
		ctx.fillStyle = triangle.color
		ctx.beginPath()
		ctx.moveTo(width, 0)
		ctx.lineTo(width, height)
		ctx.lineTo(0, height)
		ctx.closePath()
		ctx.fill()
	}
}
