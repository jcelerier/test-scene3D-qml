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

    //// Pillars ////

    AudioEngine {
        id: towerEngine
        listener.position : Qt.vector3d(0, 0, 0);

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
            end: 700
            rolloff: 1
        }

        AudioSample {
            name: "Pillars-sample"
            source: "file:///home/jcelerier/bosch/audio/SFX/Pillars-mono.wav"
            preloaded:true
        }

        Sound {
            name: "Pillar"
            attenuationModel:"atten"
            category:"sfx"
            PlayVariation {
                sample: "Pillars-sample"
                maxGain:0.9
                minGain:0.8
                minPitch: 0.5
                maxPitch: 1.5
            }
        }

        AudioSample {
            name: "PillarsVerb-sample"
            source: "file:///home/jcelerier/bosch/audio/SFX/Pillars-verb.wav"
            preloaded:true
        }

        Sound {
            name: "PillarVerb"
            attenuationModel:"atten"
            category:"sfx"
            PlayVariation {
                sample: "PillarsVerb-sample"
                maxGain:0.9
                minGain:0.8
                minPitch: 0.5
                maxPitch: 1.5
            }
        }

        dopplerFactor: 1
        speedOfSound: 343.33

        listener.up:"0,1,0"
        listener.velocity:"0,0,0"
        listener.direction:"0,0,-1"

    }

    Character {
        engine: towerEngine
        address: "Pillar/1"
        sound: "PillarVerb"
        pos: Qt.vector3d(-70, 20, 70)
        dir: "0, 0, 1"
    }


    Character {
        engine: towerEngine
        address: "Pillar/2"
        sound: "PillarVerb"
        pos: Qt.vector3d(70, 20, 70)
        dir: "0, 0, 1"
    }

    Character {
        engine: towerEngine
        address: "Pillar/3"
        sound: "Pillar"
        pos: Qt.vector3d(10, -20, -70)
        dir: "-1, 0, 1"
    }

    Character {
        engine: towerEngine
        address: "Pillar/4"
        sound: "Pillar"
        pos: Qt.vector3d(-10, -20, -70)
        dir: "1, 0, 1"
    }

    Character {
        engine: towerEngine
        address: "Pillar/5"
        sound: "Pillar"
        pos: Qt.vector3d(0, 100, 0)
    }

}
