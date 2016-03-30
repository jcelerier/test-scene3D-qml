import QtQuick 2.2
import QtAudioEngine 1.0
import OssiaNetwork 1.0
import QtMultimedia 5.0
Item
{
    property string address
    property alias sound : theFX.source

    SoundEffect {
        id: theFX
        OssiaProperty on volume {
            node: address + "gain"
        }
        volume: 0.1
    }

    OssiaImpulse {
        node: address + "play"
        onImpulse: theFX.play()
    }
}
