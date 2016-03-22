#pragma once

#include "ossia_includes.h"
#include <QQmlProperty>
#include <QObject>
#include <QQmlPropertyValueSource>
namespace OSSIA
{
class Address;
}
class Publisher;
class OssiaProperty :
        public QObject,
        public QQmlPropertyValueSource
{
    Q_OBJECT
    Q_INTERFACES(QQmlPropertyValueSource)
    Q_PROPERTY(QString node READ node WRITE setNode NOTIFY nodeChanged)
    Q_PROPERTY(Publisher* publisher READ publisher WRITE setPublisher)
public:
    OssiaProperty(QObject *parent);


    virtual void setTarget(const QQmlProperty &prop);

    QString node() const;

    Publisher* publisher() const;

public slots:
    void setNode(QString node);

    void setPublisher(Publisher* publisher);

signals:
    void nodeChanged(QString node);

private slots:
    void updateProperty();

private:
    QQmlProperty m_targetProperty;
    QString m_node;
    OSSIA::Address* m_address{};
    OSSIA::Address::iterator m_cbIt;
    Publisher* m_publisher;
};
