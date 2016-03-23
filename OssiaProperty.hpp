#pragma once

#include "ossia_includes.h"
#include <QQmlProperty>
#include <QObject>
#include <QQmlPropertyValueSource>
#include "publisher.h"
namespace OSSIA
{
class Address;
}
class OssiaProperty :
        public QObject,
        public QQmlPropertyValueSource
{
    Q_OBJECT
    Q_INTERFACES(QQmlPropertyValueSource)
    Q_PROPERTY(QString node READ node WRITE setNode NOTIFY nodeChanged)
public:
    OssiaProperty(QObject *parent = nullptr);


    virtual void setTarget(const QQmlProperty &prop);

    QString node() const;

public slots:
    void setNode(QString node);

signals:
    void nodeChanged(QString node);

private:
    void setupAddress();
    QQmlProperty m_targetProperty;
    QString m_node;
    std::shared_ptr<OSSIA::Node> m_ossia_node{};
    std::shared_ptr<OSSIA::Address> m_address{};
    OSSIA::Address::iterator m_cbIt;
    QVariant::Type m_type{};
};
