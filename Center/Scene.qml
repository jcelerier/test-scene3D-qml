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

        onXChanged: console.log("Point: " + x + " ," + y)
    }

    SoundEffect {
        id: playMusic
        source: "file:///Users/grapholine/bosch-2/audio/fond/fond-B.wav"
        OssiaProperty on volume {
            node: "bgm/gain"
        }
        volume: 0
        loops: SoundEffect.Infinite
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
            name: "Foule-1-sample"
            source: "file:///Users/grapholine/bosch-2/audio/foule/Foule-1-mono.wav"
            preloaded:true
        }

        Sound {
            name: "Foule-1"
            attenuationModel:"atten"
            category:"sfx"
            PlayVariation {
                sample: "Foule-1-sample"
                maxGain:0.9
                minGain:0.8
                minPitch: 0.8
                maxPitch: 1.1
            }
        }

        AudioSample {
            name: "Foule-2-sample"
            source: "file:///Users/grapholine/bosch-2/audio/foule/Foule-2-mono.wav"
            preloaded:true
        }

        Sound {
            name: "Foule-2"
            attenuationModel:"atten"
            category:"sfx"
            PlayVariation {
                sample: "Foule-2-sample"
                maxGain:0.9
                minGain:0.8
                minPitch: 0.8
                maxPitch: 1.1
            }
        }



        AudioSample {
            name: "Foule-3-sample"
            source: "file:///Users/grapholine/bosch-2/audio/foule/Foule-3-mono.wav"
            preloaded:true
        }

        Sound {
            name: "Foule-3"
            attenuationModel:"atten"
            category:"sfx"
            PlayVariation {
                sample: "Foule-3-sample"
                maxGain:0.9
                minGain:0.8
                minPitch: 0.8
                maxPitch: 1.1
            }
        }



        AudioSample {
            name: "Foule-4-sample"
            source: "file:///Users/grapholine/bosch-2/audio/foule/Foule-4-mono.wav"
            preloaded:true
        }

        Sound {
            name: "Foule-4"
            attenuationModel:"atten"
            category:"sfx"
            PlayVariation {
                sample: "Foule-4-sample"
                maxGain:0.9
                minGain:0.8
                minPitch: 0.8
                maxPitch: 1.1
            }
        }




        AudioSample {
            name: "Foule-5-sample"
            source: "file:///Users/grapholine/bosch-2/audio/foule/Foule-5-mono.wav"
            preloaded:true
        }

        Sound {
            name: "Foule-5"
            attenuationModel:"atten"
            category:"sfx"
            PlayVariation {
                sample: "Foule-5-sample"
                maxGain:0.9
                minGain:0.8
                minPitch: 0.8
                maxPitch: 1.1
            }
        }


        AudioSample {
            name: "Foule-6-sample"
            source: "file:///Users/grapholine/bosch-2/audio/foule/Foule-6-mono.wav"
            preloaded:true
        }

        Sound {
            name: "Foule-6"
            attenuationModel:"atten"
            category:"sfx"
            PlayVariation {
                sample: "Foule-6-sample"
                maxGain:0.9
                minGain:0.8
                minPitch: 0.8
                maxPitch: 1.1
            }
        }

        dopplerFactor: 1
        speedOfSound: 343.33

        listener.up:"0,1,0"
        listener.velocity:"0,0,0"
        listener.direction:"0,0,-1"
    }


    // x = 0 : left; x = max : right
    // y = 0 : front; y = max : back
    // listener pointe vers le bas
    Character {
        engine: audioEngine
        address: "Foule/1/"
        sound: "Foule-1"
        pos: Qt.vector3d(-30, 0, 15)
    }
    Character {
        engine: audioEngine
        address: "Foule/2/"
        sound: "Foule-2"
        pos: Qt.vector3d(30, 0, 15)
    }
    Character {
        engine: audioEngine
        address: "Foule/3/"
        sound: "Foule-3"
        pos: Qt.vector3d(-30, 0, -15)
    }

    Character {
        engine: audioEngine
        address: "Foule/4/"
        sound: "Foule-4"
        pos: Qt.vector3d(-25, 20, -10)
    }
    Character {
        engine: audioEngine
        address: "Foule/5/"
        sound: "Foule-5"
        pos: Qt.vector3d(60,60,100)
    }
    Character {
        engine: audioEngine
        address: "Foule/6/"
        sound: "Foule-6"
        pos: Qt.vector3d(-100,10,50)
    }
}
