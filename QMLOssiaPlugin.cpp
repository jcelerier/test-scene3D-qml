#include "QMLOssiaPlugin.hpp"
#include "OssiaProperty.hpp"
#include <QtQml>
QMLOssiaPlugin::QMLOssiaPlugin()
{

}

QMLOssiaPlugin::~QMLOssiaPlugin()
{

}

void QMLOssiaPlugin::registerTypes(const char *uri)
{
    qmlRegisterType<OssiaProperty>(uri, 0, 1, "OssiaProperty");

}
