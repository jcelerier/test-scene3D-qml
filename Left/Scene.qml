import QtQuick 2.0
import QtQuick.Window 2.2
import QtAudioEngine 1.0
import OssiaNetwork 1.0
import QtMultimedia 5.5

Item {
    objectName: "Scene"

    Item {
        id: listener
        OssiaProperty on x {
            node: "listener/x"
        }
        OssiaProperty on y {
            node: "listener/y"
        }
    }

    SoundEffect {
        id: playMusic
        loops: SoundEffect.Infinite
        source: "file:///home/jcelerier/travail/test-scene-audio3D/Left/contents/fond-A.wav"
        OssiaProperty on volume {
            node: "bgm/gain"
        }
        volume: 0
        Component.onCompleted: playMusic.play()
    }

    SingleShot {
        sound: "contents/horn.wav"
        address: "entry/"
    }

    AudioEngine {
        id: dialogEngine
        listener.position : Qt.vector3d(0, 10, 20);

        AudioCategory {
            id: master
            name:"sfx"
            volume: 1

            OssiaProperty on volume {
                node: "volume"
            }
        }

        AttenuationModelInverse {
            name:"atten"
            start: 20
            end: 1000
            rolloff: 1
        }

        AudioSample {
            name:"whistle"
            source: "contents/whistle.wav"
            preloaded:true
        }

        Sound {
            name:"whistle_sound"
            attenuationModel:"atten"
            category:"sfx"
            PlayVariation {
                sample:"whistle"
                maxGain:0.9
                minGain:0.8
                minPitch: 0.8
                maxPitch: 1.1
            }
        }

        dopplerFactor: 1
        speedOfSound: 343.33

        listener.up:"0,0,1"
        listener.velocity:"0,0,0"
        listener.direction:"0,1,0"
    }


    // x = 0 : left; x = max : right
    // y = 0 : front; y = max : back
    // listener pointe vers le bas

    ////// ADAM //////
    Character {
        engine: dialogEngine
        address: "adam/1/"
        sound: "whistle_sound"
        pos: Qt.vector3d(-10, 0, 10)
    }

    Character {
        engine: dialogEngine
        address: "adam/2/"
        sound: "whistle_sound"
        pos: Qt.vector3d(-10, 0, 10)
    }

    Character {
        engine: dialogEngine
        address: "adam/3/"
        sound: "whistle_sound"
        pos: Qt.vector3d(-10, 0, 10)
    }

    Character {
        engine: dialogEngine
        address: "adam/4/"
        sound: "whistle_sound"
        pos: Qt.vector3d(-10, 0, 10)
    }


    ////// GOD //////
    Character {
        engine: dialogEngine
        address: "god/1/"
        sound: "whistle_sound"
        pos: Qt.vector3d(0, 10, 15)
    }

    Character {
        engine: dialogEngine
        address: "god/2/"
        sound: "whistle_sound"
        pos: Qt.vector3d(0, 10, 15)
    }

    Character {
        engine: dialogEngine
        address: "god/3/"
        sound: "whistle_sound"
        pos: Qt.vector3d(0, 10, 15)
    }

    Character {
        engine: dialogEngine
        address: "god/4/"
        sound: "whistle_sound"
        pos: Qt.vector3d(0, 10, 15)
    }


    ////// EVE //////
    Character {
        engine: dialogEngine
        address: "god/1/"
        sound: "whistle_sound"
        pos: Qt.vector3d(10, 0, 13)
    }

    Character {
        engine: dialogEngine
        address: "god/2/"
        sound: "whistle_sound"
        pos: Qt.vector3d(10, 0, 13)
    }

    Character {
        engine: dialogEngine
        address: "god/3/"
        sound: "whistle_sound"
        pos: Qt.vector3d(10, 0, 13)
    }

    Character {
        engine: dialogEngine
        address: "god/4/"
        sound: "whistle_sound"
        pos: Qt.vector3d(10, 0, 13)
    }
}
