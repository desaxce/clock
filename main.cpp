#include <QtQuick/QQuickView>
#include <QGuiApplication>

Q_DECL_EXPORT int main(int argc, char **argv) {
	QGuiApplication app(argc, argv, 5);
	QQuickView *viewer = new QQuickView;
	viewer->setSource(QUrl("main.qml"));
	viewer->show();
	return app.exec();
}
