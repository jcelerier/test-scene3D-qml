#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <thread>
#include "publisher.h"
#include "OssiaProperty.hpp"
#include "QMLOssiaPlugin.hpp"
#include <QQmlComponent>
#include <QQmlProperty>
#include <QQmlIncubator>

Publisher* publisher_singleton = nullptr;
int main(int argc, char *argv[])
{
    qmlRegisterType<OssiaProperty>("OssiaNetwork", 1, 0, "OssiaProperty");

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     [&] (QObject* main, const QUrl &url){
        if(main->objectName() != "Main")
            return;

        // Fetch ports & other info from QML
        auto p = main->property("inPort").toInt();
        auto r = main->property("outPort").toInt();
        auto name = main->property("sceneName").toString();

        publisher_singleton = new Publisher(p, r, name);

        // Create Scene
        auto scene_comp = new QQmlComponent(
                    &engine,
                    QUrl(QStringLiteral("qrc:/Scene.qml")),
                    QQmlComponent::PreferSynchronous);
        while(scene_comp->status() == QQmlComponent::Status::Loading)
        {
            std::this_thread::sleep_for(std::chrono::milliseconds(5));
        }
        if(scene_comp->status() == QQmlComponent::Status::Ready)
        {
            scene_comp->create(engine.rootContext());
        }
        else
        {
            qDebug() << scene_comp->errorString();

        }
    });

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    return app.exec();
}
