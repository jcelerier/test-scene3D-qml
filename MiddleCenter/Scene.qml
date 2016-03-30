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
        id: circleEngine
        listener.position : Qt.vector3d(listener.x, 500, listener.y);

        AudioCategory {
            id: master
            name:"sfx"
            volume: 1

            OssiaProperty on volume {
                node: "master_volume"
            }
        }

        AttenuationModelInverse {
            name:"atten"
            start: 20
            end: 700
            rolloff: 1
        }

        AudioSample {
            name: "Trajet1-sample"
            source: "file:///Users/grapholine/bosch-2/audio/chevaux/Trajet1-mono.wav"
            preloaded:true
        }

        AudioSample {
            name: "Trajet2-sample"
            source: "file:///Users/grapholine/bosch-2/audio/chevaux/Trajet2-mono.wav"
            preloaded:true
        }

        AudioSample {
            name: "Trajet3-sample"
            source: "file:///Users/grapholine/bosch-2/audio/chevaux/Trajet3-mono.wav"
            preloaded:true
        }

        Sound {
            name: "Trajet1"
            attenuationModel:"atten"
            category:"sfx"
            PlayVariation {
                sample: "Trajet1-sample"
                looping: true
            }
        }

        Sound {
            name: "Trajet2"
            attenuationModel:"atten"
            category:"sfx"
            PlayVariation {
                sample: "Trajet2-sample"
                looping: true
            }
        }
        Sound {
            name: "Trajet3"
            attenuationModel:"atten"
            category:"sfx"
            PlayVariation {
                sample: "Trajet3-sample"
                looping: true
            }
        }

        dopplerFactor: 1
        speedOfSound: 343.33

        listener.up:"0,1,0"
        listener.velocity:"0,0,0"
        listener.direction:"0,0,-1"

    }

    Character {
        engine: circleEngine
        address: "Trajet/1/"
        sound: "Trajet1"
        pos: Qt.vector3d(-70, 20, 70)
    }


    Character {
        engine: circleEngine
        address: "Trajet/2/"
        sound: "Trajet2"
        pos: Qt.vector3d(70, 20, 70)
    }

    Character {
        engine: circleEngine
        address: "Trajet/3/"
        sound: "Trajet3"
        pos: Qt.vector3d(10, -20, -70)
    }


}
