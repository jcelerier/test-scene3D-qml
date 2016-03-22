#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include "publisher.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    int p = DEFAULT_PPORT, r = DEFAULT_RPORT;
    if (argc == 3) {
        p = atoi(argv[1]);
        r = atoi(argv[2]);
    }

    Publisher pub(p, r);
    pub.init();
    engine.rootContext()->setContextProperty("publisher", &pub);

    return app.exec();
}
