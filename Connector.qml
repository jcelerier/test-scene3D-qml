import QtQuick 2.2

Item {
    property point listener;

    Connections {
        target: publisher
        onXChanged: {
            listener.x = x
        }
        onYChanged: {
            listener.y = y
        }
    }
}
