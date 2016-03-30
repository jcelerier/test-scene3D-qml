import QtQuick 2.2
import QtAudioEngine 1.0
import OssiaNetwork 1.0

Item
{
    property string address
    property alias engine : theCharacter.engine
    property alias sound : theCharacter.sound
    property alias pos : theCharacter.position
    property alias dir : theCharacter.direction
    SoundInstance {
        id: theCharacter
        OssiaProperty on position {
            node: address + "pos"
        }

        OssiaProperty on gain {
            node: address + "gain"
        }
    }

    OssiaImpulse {
        node: address + "play"
        onImpulse: theCharacter.play()
    }
}
