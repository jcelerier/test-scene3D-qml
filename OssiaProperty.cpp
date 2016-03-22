#include "OssiaProperty.hpp"
#include "publisher.h"
#include <iostream>
OssiaProperty::OssiaProperty(QObject *parent)
    : QObject(parent)
{
}

void OssiaProperty::setTarget(const QQmlProperty &prop) { m_targetProperty = prop; }

QString OssiaProperty::node() const
{
    return m_node;
}

Publisher *OssiaProperty::publisher() const
{
    return m_publisher;
}

void OssiaProperty::setNode(QString node)
{
    if(!m_publisher)
        return;

    if (m_node == node)
        return;

    m_node = node;
    if(m_node == "x")
    {
        if(m_address) {
            m_address->removeCallback(m_cbIt);
        }
        m_address = m_publisher->_xAddress.get();
        m_cbIt = m_address->addCallback([=] (const OSSIA::Value* val) {
            if(auto res = dynamic_cast<const OSSIA::Float*>(val) ) {
                std::cerr << res->value << std::endl;
                m_targetProperty.write(res->value);
            }
        });
    }
    else if(m_node == "y")
    {
        if(m_address) {
            m_address->removeCallback(m_cbIt);
        }
        m_address = m_publisher->_yAddress.get();
        m_cbIt = m_address->addCallback([=] (const OSSIA::Value* val) {
            if(auto res = dynamic_cast<const OSSIA::Float*>(val) ) {
                std::cerr << res->value << std::endl;
                m_targetProperty.write(res->value);
            }
        });
    }
    else
    {
        if(m_address) {
            m_address->removeCallback(m_cbIt);
        }
        m_address = nullptr;
    }
    emit nodeChanged(node);
}

void OssiaProperty::setPublisher(Publisher *publisher)
{
    m_publisher = publisher;
}

void OssiaProperty::updateProperty() {

}
