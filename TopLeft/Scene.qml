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


    AudioEngine {
        id: towerEngine
        listener.position : Qt.vector3d(listener.x, 0, 0);

        AudioCategory {
            id: towermaster
            name:"sfx"
            volume: 1

            OssiaProperty on volume {
                node: "tower_volume"
            }
        }

        AttenuationModelInverse {
            name:"atten"
            start: 20
            end: 1000
            rolloff: 1
        }

        AudioSample {
            name: "Tower-1-sample"
            source: "file:///Users/grapholine/bosch-2/audio/SFX/Tower-1.wav"
            preloaded:true
        }

        AudioSample {
            name: "Tower-2-sample"
            source: "file:///Users/grapholine/bosch-2/audio/SFX/Tower-2.wav"
            preloaded:true
        }
        Sound {
            name: "Tower"
            attenuationModel:"atten"
            category:"sfx"
            PlayVariation {
                sample: "Tower-1-sample"
                maxGain:0.9
                minGain:0.8
                minPitch: 0.5
                maxPitch: 1.5
            }
            PlayVariation {
                sample: "Tower-2-sample"
                maxGain:0.9
                minGain:0.8
                minPitch: 0.5
                maxPitch: 1.5
            }
        }

        dopplerFactor: 1
        speedOfSound: 343.33

        listener.up:"0,0,1"
        listener.velocity:"0,0,0"
        listener.direction:"0,1,0"

    }

    Character {
        engine: towerEngine
        address: "Pillar/"
        sound: "Tower"
        pos: Qt.vector3d(250, -200, -200)
    }

}
