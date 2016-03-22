#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include "publisher.h"
#include <QQmlPropertyValueSource>
#include <QQmlComponent>
#include <QQmlProperty>
#include <QQmlIncubator>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    auto main = engine.findChild<QObject*>("Main");
    auto ctx = engine.contextForObject(main);
    QQmlComponent scene_comp(&engine, QUrl(QStringLiteral("qrc:/Scene.qml")));
    auto scene = scene_comp.create();

    if(!scene)
        return 0;

    int p = scene->property("inPort").toInt();
    int r = scene->property("outPort").toInt();
    QString name = scene->property("sceneName").toString();

    Publisher pub(p, r, name);
    engine.rootContext()->setContextProperty("publisher", &pub);

    QQmlComponent listener_comp{&engine, QUrl(QStringLiteral("qrc:/Connector.qml"))};
    auto listener = listener_comp.create(ctx);

    QQmlProperty l_prop(listener, "listener");


    return app.exec();
}
