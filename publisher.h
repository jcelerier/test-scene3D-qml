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
    explicit Publisher();
    explicit Publisher(int, int);
    void init();

signals:
    void xChanged(double);
    void yChanged(double);

};

void printValueCallback(const OSSIA::Value*);

#endif // PUBLISHER_H
