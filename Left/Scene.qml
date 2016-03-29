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
        source: "file:///home/jcelerier/bosch/audio/fond/fond-A.wav"
        OssiaProperty on volume {
            node: "bgm/gain"
        }
        volume: 0
        Component.onCompleted: playMusic.play()
    }

    SingleShot {
        sound: "file:///home/jcelerier/bosch/audio/SFX/Transition-1.wav"
        address: "entry/"
    }

    AudioEngine {
        id: dialogEngine
        listener.position : Qt.vector3d(0, 20, 10);

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
            name: "Adam-1-sample"
            source: "file:///home/jcelerier/bosch/audio/dialog/Adam-1-mono.wav"
            preloaded:true
        }

        Sound {
            name: "Adam-1"
            attenuationModel:"atten"
            category:"sfx"
            PlayVariation {
                sample: "Adam-1-sample"
                maxGain:0.9
                minGain:0.8
                minPitch: 0.8
                maxPitch: 1.1
            }
        }

        AudioSample {
            name: "Adam-2-sample"
            source: "file:///home/jcelerier/bosch/audio/dialog/Adam-2-mono.wav"
            preloaded:true
        }

        Sound {
            name: "Adam-2"
            attenuationModel:"atten"
            category:"sfx"
            PlayVariation {
                sample: "Adam-2-sample"
                maxGain:0.9
                minGain:0.8
                minPitch: 0.8
                maxPitch: 1.1
            }
        }



        AudioSample {
            name: "Adam-3-sample"
            source: "file:///home/jcelerier/bosch/audio/dialog/Adam-3-mono.wav"
            preloaded:true
        }

        Sound {
            name: "Adam-3"
            attenuationModel:"atten"
            category:"sfx"
            PlayVariation {
                sample: "Adam-3-sample"
                maxGain:0.9
                minGain:0.8
                minPitch: 0.8
                maxPitch: 1.1
            }
        }



        AudioSample {
            name: "Adam-4-sample"
            source: "file:///home/jcelerier/bosch/audio/dialog/Adam-4-mono.wav"
            preloaded:true
        }

        Sound {
            name: "Adam-4"
            attenuationModel:"atten"
            category:"sfx"
            PlayVariation {
                sample: "Adam-4-sample"
                maxGain:0.9
                minGain:0.8
                minPitch: 0.8
                maxPitch: 1.1
            }
        }




        AudioSample {
            name: "Adam-5-sample"
            source: "file:///home/jcelerier/bosch/audio/dialog/Adam-5-mono.wav"
            preloaded:true
        }

        Sound {
            name: "Adam-5"
            attenuationModel:"atten"
            category:"sfx"
            PlayVariation {
                sample: "Adam-5-sample"
                maxGain:0.9
                minGain:0.8
                minPitch: 0.8
                maxPitch: 1.1
            }
        }



        //////////////////////
        /////////////// GOD
        /////////////////////


        AudioSample {
            name: "God-1-sample"
            source: "file:///home/jcelerier/bosch/audio/dialog/God-1-mono.wav"
            preloaded:true
        }

        Sound {
            name: "God-1"
            attenuationModel:"atten"
            category:"sfx"
            PlayVariation {
                sample: "God-1-sample"
                maxGain:0.9
                minGain:0.8
                minPitch: 0.8
                maxPitch: 1.1
            }
        }

        AudioSample {
            name: "God-2-sample"
            source: "file:///home/jcelerier/bosch/audio/dialog/God-2-mono.wav"
            preloaded:true
        }

        Sound {
            name: "God-2"
            attenuationModel:"atten"
            category:"sfx"
            PlayVariation {
                sample: "God-2-sample"
                maxGain:0.9
                minGain:0.8
                minPitch: 0.8
                maxPitch: 1.1
            }
        }



        AudioSample {
            name: "God-3-sample"
            source: "file:///home/jcelerier/bosch/audio/dialog/God-3-mono.wav"
            preloaded:true
        }

        Sound {
            name: "God-3"
            attenuationModel:"atten"
            category:"sfx"
            PlayVariation {
                sample: "God-3-sample"
                maxGain:0.9
                minGain:0.8
                minPitch: 0.8
                maxPitch: 1.1
            }
        }



        AudioSample {
            name: "God-4-sample"
            source: "file:///home/jcelerier/bosch/audio/dialog/God-4-mono.wav"
            preloaded:true
        }

        Sound {
            name: "God-4"
            attenuationModel:"atten"
            category:"sfx"
            PlayVariation {
                sample: "God-4-sample"
                maxGain:0.9
                minGain:0.8
                minPitch: 0.8
                maxPitch: 1.1
            }
        }

        //////////////////////
        /////////////// EVE
        //////////////////////
        AudioSample {
            id: theSample
            name: "Eve-1-sample"
            source: "file:///home/jcelerier/bosch/audio/dialog/Eve-1-mono.wav"
            preloaded:true
        }

        Sound {
            name: "Eve-1"
            attenuationModel:"atten"
            category:"sfx"
            PlayVariation {
                sample: "Eve-1-sample"
                maxGain:0.9
                minGain:0.8
                minPitch: 0.8
                maxPitch: 1.1
            }
        }

        AudioSample {
            name: "Eve-2-sample"
            source: "file:///home/jcelerier/bosch/audio/dialog/Eve-2-mono.wav"
            preloaded:true
        }

        Sound {
            name: "Eve-2"
            attenuationModel:"atten"
            category:"sfx"
            PlayVariation {
                sample: "Eve-2-sample"
                maxGain:0.9
                minGain:0.8
                minPitch: 0.8
                maxPitch: 1.1
            }
        }

        AudioSample {
            name: "Eve-3-sample"
            source: "file:///home/jcelerier/bosch/audio/dialog/Eve-3-mono.wav"
            preloaded:true
        }

        Sound {
            name: "Eve-3"
            attenuationModel:"atten"
            category:"sfx"
            PlayVariation {
                sample: "Eve-3-sample"
                maxGain:0.9
                minGain:0.8
                minPitch: 0.8
                maxPitch: 1.1
            }
        }

        AudioSample {
            name: "Eve-4-sample"
            source: "file:///home/jcelerier/bosch/audio/dialog/Eve-4-mono.wav"
            preloaded:true
        }

        Sound {
            name: "Eve-4"
            attenuationModel:"atten"
            category:"sfx"
            PlayVariation {
                sample: "Eve-4-sample"
                maxGain:0.9
                minGain:0.8
                minPitch: 0.8
                maxPitch: 1.1
            }
        }

        AudioSample {
            name: "Eve-5-sample"
            source: "file:///home/jcelerier/bosch/audio/dialog/Eve-5-mono.wav"
            preloaded:true
        }

        Sound {
            name: "Eve-5"
            attenuationModel:"atten"
            category:"sfx"
            PlayVariation {
                sample: "Eve-5-sample"
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

    ////// ADAM //////
    Character {
        engine: dialogEngine
        address: "Adam/1/"
        sound: "Adam-1"
        pos: Qt.vector3d(-10, 10, 0)
    }
    Character {
        engine: dialogEngine
        address: "Adam/2/"
        sound: "Adam-2"
        pos: Qt.vector3d(-10, 10, 0)
    }
    Character {
        engine: dialogEngine
        address: "Adam/3/"
        sound: "Adam-3"
        pos: Qt.vector3d(-10, 10, 0)
    }
    Character {
        engine: dialogEngine
        address: "Adam/4/"
        sound: "Adam-4"
        pos: Qt.vector3d(-10, 10, 0)
    }
    Character {
        engine: dialogEngine
        address: "Adam/5/"
        sound: "Adam-5"
        pos: Qt.vector3d(-10, 10, 0)
    }


    ////// GOD
    Character {
        engine: dialogEngine
        address: "God/1/"
        sound: "God-1"
        pos: Qt.vector3d(0, 15, 10)
    }
    Character {
        engine: dialogEngine
        address: "God/2/"
        sound: "God-2"
        pos: Qt.vector3d(0, 15, 10)
    }
    Character {
        engine: dialogEngine
        address: "God/3/"
        sound: "God-3"
        pos: Qt.vector3d(0, 15, 10)
    }
    Character {
        engine: dialogEngine
        address: "God/4/"
        sound: "God-4"
        pos: Qt.vector3d(0, 15, 10)
    }


    /////// EVE
    Character {
        engine: dialogEngine
        address: "Eve/1/"
        sound: "Eve-1"
        pos: Qt.vector3d(10, 13, 0)
    }
    Character {
        engine: dialogEngine
        address: "Eve/2/"
        sound: "Eve-2"
        pos: Qt.vector3d(10, 13, 0)
    }
    Character {
        engine: dialogEngine
        address: "Eve/3/"
        sound: "Eve-3"
        pos: Qt.vector3d(10, 13, 0)
    }
    Character {
        engine: dialogEngine
        address: "Eve/4/"
        sound: "Eve-4"
        pos: Qt.vector3d(10, 13, 0)
    }
    Character {
        engine: dialogEngine
        address: "Eve/5/"
        sound: "Eve-5"
        pos: Qt.vector3d(10, 13, 0)
    }

}
