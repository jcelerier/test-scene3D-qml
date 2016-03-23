#pragma once

#include "ossia_includes.h"
#include <QtQml>
#include "publisher.h"
class OssiaImpulse :
        public QObject
{
    Q_OBJECT

    Q_PROPERTY(QString node READ node WRITE setNode NOTIFY nodeChanged)
public:
    OssiaImpulse(QObject* parent = nullptr);
    virtual ~OssiaImpulse();

    QString node() const;

public slots:
    void setNode(QString node);

signals:
    void nodeChanged(QString node);
    void impulse();

private:
    QString m_node;
    std::shared_ptr<OSSIA::Node> m_ossia_node{};
    std::shared_ptr<OSSIA::Address> m_address{};
};
