#include "OssiaProperty.hpp"
#include "publisher.h"
#include <iostream>
#include <QVector3D>
std::shared_ptr<OSSIA::Node> getOrCreateNode(
        std::shared_ptr<OSSIA::Node> root,
        QStringList str)
{
    // if the node exists, we return it.
    for(auto child : root->children())
    {
        if(child->getName() == str[0].toStdString())
        {
            if(str.size() == 1)
            {
                return child;
            }
            else
            {
                str.removeFirst();
                return getOrCreateNode(child, str);
            }
        }
    }

    // The node did not exist
    auto it = root->emplace(root->children().end(), str[0].toStdString());
    if(str.size() == 1)
    {
        return *it;
    }
    else
    {
        str.removeFirst();
        return getOrCreateNode(*it, str);
    }
}

OssiaProperty::OssiaProperty(QObject *parent)
    : QObject(parent)
{
}

void OssiaProperty::setTarget(const QQmlProperty &prop)
{
    m_targetProperty = prop;
    m_type = prop.propertyType();
    if(m_ossia_node)
        setupAddress();
}

QString OssiaProperty::node() const
{
    return m_node;
}

void OssiaProperty::setNode(QString node)
{
    if(!publisher_singleton)
        return;

    if (m_node == node)
        return;

    m_node = node;

    if(m_ossia_node)
    {
        auto par = m_ossia_node->getParent();
        auto& cld = par->children();
        auto it = std::find(cld.begin(), cld.end(), m_ossia_node);
        if(it != cld.end())
            par->erase(it);
    }

    m_ossia_node = getOrCreateNode(
                publisher_singleton->_localDevice,
                node.split('/'));

    setupAddress();
    emit nodeChanged(node);
}

void OssiaProperty::setupAddress()
{
    m_ossia_node->removeAddress();

    switch(m_type)
    {

    case QMetaType::Type::Bool:
    {
        m_address = m_ossia_node->createAddress(OSSIA::Value::Type::BOOL);
        m_address->addCallback([=] (const OSSIA::Value* val) {
            if(auto res = dynamic_cast<const OSSIA::Bool*>(val) ) {
                m_targetProperty.write(res->value);
            }
        });
        return;
    }

    case QMetaType::Type::Int:
    case QMetaType::Type::UInt:
    case QMetaType::Type::Long:
    case QMetaType::Type::Short:
    case QMetaType::Type::LongLong:
    case QMetaType::Type::ULongLong:
    {
        m_address = m_ossia_node->createAddress(OSSIA::Value::Type::INT);
        m_address->addCallback([=] (const OSSIA::Value* val) {
            if(auto res = dynamic_cast<const OSSIA::Int*>(val) ) {
                m_targetProperty.write(res->value);
            }
        });
        return;
    }

    case QMetaType::Type::Float:
    case QMetaType::Type::Double:
    {
        m_address = m_ossia_node->createAddress(OSSIA::Value::Type::FLOAT);
        m_address->addCallback([=] (const OSSIA::Value* val) {
            if(auto res = dynamic_cast<const OSSIA::Float*>(val) ) {
                m_targetProperty.write(res->value);
            }
        });
        return;
    }

    case QMetaType::Type::QChar:
    case QMetaType::Type::Char:
    {
        m_address = m_ossia_node->createAddress(OSSIA::Value::Type::CHAR);
        m_address->addCallback([=] (const OSSIA::Value* val) {
            if(auto res = dynamic_cast<const OSSIA::Char*>(val) ) {
                m_targetProperty.write(res->value);
            }
        });
        return;
    }

    case QMetaType::Type::QVector3D:
    {
        m_address = m_ossia_node->createAddress(OSSIA::Value::Type::TUPLE);
        m_address->addCallback([=] (const OSSIA::Value* val) {
            if(auto res = dynamic_cast<const OSSIA::Tuple*>(val) ) {
                auto& vec = res->value;
                if(vec.size() < 3)
                    return;
                else
                {
                    QVector3D v3d;

                    if(auto v = dynamic_cast<OSSIA::Float*>(vec[0]))
                        v3d.setX(v->value);
                    else
                        return;
                    if(auto v = dynamic_cast<OSSIA::Float*>(vec[1]))
                        v3d.setY(v->value);
                    else
                        return;
                    if(auto v = dynamic_cast<OSSIA::Float*>(vec[2]))
                        v3d.setZ(v->value);
                    else
                        return;

                    m_targetProperty.write(v3d);
                }
            }
        });

        return;
    }

    case QMetaType::Type::QString:
    {
        m_address = m_ossia_node->createAddress(OSSIA::Value::Type::STRING);
        m_address->addCallback([=] (const OSSIA::Value* val) {
            if(auto res = dynamic_cast<const OSSIA::String*>(val) ) {
                m_targetProperty.write(QString::fromStdString(res->value));
            }
        });
        return;
    }

    default:
    {
        m_address = m_ossia_node->createAddress(OSSIA::Value::Type::IMPULSE);
        m_address->addCallback([=] (const OSSIA::Value* val) {
            m_targetProperty.write(QVariant{});
        });
        return;
    }


    }
}







