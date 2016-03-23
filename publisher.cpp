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

    _minuitProtocol = Minuit::create("127.0.0.1", _pubPort, _recPort);
    _minuitDevice = Device::create(_minuitProtocol, "i-score");
}
