import QtQuick 2.3
import QtQuick.Window 2.2

Window {
    visible: true

    MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        property point mousepos: Qt.point(mouseX, mouseY)
        onMouseposChanged: {
            publisher.relayChanges(mousepos);
        }
        MultiPointTouchArea {
            anchors.fill: parent
            mouseEnabled: false
        }
        Image {
            anchors.fill: parent
            fillMode: Image.PreserveAspectFit
            asynchronous: true
            source: "/image/background.png"
        }
    }
}
