#pragma once

#include <QQmlExtensionPlugin>

class QMLOssiaPlugin : public QQmlExtensionPlugin
{
    Q_OBJECT
    Q_PLUGIN_METADATA(IID "org.qt-project.Qt.QQmlExtensionInterface")

  public:
    QMLOssiaPlugin();
    virtual ~QMLOssiaPlugin();
    void registerTypes(const char *uri);
};
