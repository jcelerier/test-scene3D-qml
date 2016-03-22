#include "publisher.h"
#include <sstream>
#include <string>
#include <QDebug>
#include <iostream>

using namespace OSSIA;
using namespace std;

Publisher::Publisher(int pPort, int rPort, QString name):
    Transmitter(pPort, rPort)
{
    _localProtocol = Local::create();
    _localDevice = Device::create(_localProtocol, name.toStdString());

    _posNode = *(_localDevice->emplace(_localDevice->children().cend(), "listener"));
    _xNode = *(_posNode->emplace(_posNode->children().cend(), "x_pos"));
    _yNode = *(_posNode->emplace(_posNode->children().cend(), "y_pos"));

    _xAddress = _xNode->createAddress(Value::Type::FLOAT);
    _xAddress->addCallback([=] (const OSSIA::Value* val) {
        if(auto res = dynamic_cast<const OSSIA::Float*>(val) ) {
            std::cerr << res->value << std::endl;
            emit xChanged(res->value);
        }
    });
    _yAddress = _yNode->createAddress(Value::Type::FLOAT);

    _minuitProtocol = Minuit::create("127.0.0.1", _pubPort, _recPort);
    _minuitDevice = Device::create(_minuitProtocol, "i-score");
}
