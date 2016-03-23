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

    Audio {
        id: playMusic
        source: "file:///home/jcelerier/travail/test-scene-audio3D/Right/contents/fond-C.mp3"
        OssiaProperty on volume {
            node: "bgm/gain"
        }
        volume: 0.05
        Component.onCompleted: playMusic.play()
    }

    AudioEngine {
        id: audioEngine
        listener.position : Qt.vector3d(listener.x, listener.y, 0);

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
            name:"engine"
            source: "/contents/engine-loop.wav"
            preloaded:true
        }
        AudioSample {
            name:"horn"
            source: "/contents/horn.wav"
            preloaded:true
        }
        AudioSample {
            name:"whistle"
            source: "/contents/whistle.wav"
            preloaded:true
        }

        Sound {
            name:"engine_sound"
            attenuationModel:"atten"
            category:"sfx"
            PlayVariation {
                sample:"engine"
                maxGain:0.9
                minGain:0.8
                minPitch: 0.8
                maxPitch: 1.1
            }
        }

        Sound {
            name:"horn_sound"
            attenuationModel:"atten"
            category:"sfx"
            PlayVariation {
                sample:"horn"
                maxGain:0.9
                minGain:0.8
                minPitch: 0.8
                maxPitch: 1.1
            }
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

    SoundInstance {
        id: shipSound
        engine:audioEngine
        sound:"engine_sound"
        position: Qt.vector3d(300, 400, 0)

        OssiaProperty on gain {
            node: "engine/gain"
        }
    }

    SoundInstance {
        id: hornSound
        engine:audioEngine
        sound:"horn_sound"
        position: Qt.vector3d(500, 600, 0)
        OssiaProperty on gain {
            node: "horn/gain"
        }
    }

    SoundInstance {
        id: whistleSound
        engine:audioEngine
        sound:"whistle_sound"
        position: Qt.vector3d(200, 200, 150)

        OssiaProperty on gain {
            node: "whistle/gain"
        }
    }

    OssiaImpulse {
        node: "horn/play"
        onImpulse: hornSound.play()
    }
    OssiaImpulse {
        node: "engine/play"
        onImpulse: engineSound.play()
    }
    OssiaImpulse {
        node: "whistle/play"
        onImpulse: whistleSound.play()
    }
}
