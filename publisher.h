#ifndef PUBLISHER_H
#define PUBLISHER_H

#include <QObject>
#include <QString>
#include <QtQml>

#include "transmitter.h"

class Publisher : public Transmitter
{
    Q_OBJECT

public:
    explicit Publisher(int, int, QString);

signals:
    void xChanged(double x);
    void yChanged(double y);

};

void printValueCallback(const OSSIA::Value*);

#endif // PUBLISHER_H
