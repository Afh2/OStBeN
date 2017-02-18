import VPlay 2.0
import QtQuick 2.0
import "common"
import "scenes"

GameWindow {
    id: gameWindow
    property alias menuButtonBase: menuButtonBase

    // You get free licenseKeys from https://v-play.net/licenseKey
    // With a licenseKey you can:
    //  * Publish your games & apps for the app stores
    //  * Remove the V-Play Splash Screen or set a custom one (available with the Pro Licenses)
    //  * Add plugins to monetize, analyze & improve your apps (available with the Pro Licenses)
    //licenseKey: "<generate one from https://v-play.net/licenseKey>"

    activeScene: splashscene
    SplashScene {
        id: splashscene
    }

    // the size of the Window can be changed at runtime by pressing Ctrl (or Cmd on Mac) + the number keys 1-8
    // the content of the logical scene size (480x320 for landscape mode by default) gets scaled to the window size based on the scaleMode
    // you can set this size to any resolution you would like your project to start with, most of the times the one of your main target device
    // this resolution is for iPhone 4 & iPhone 4S
    onSplashScreenFinished: tm.start()
    function fn(){

    }
    Timer {
        id: tm
        interval: 1000
        onTriggered: {
            splashscene.opacity = 0
            splashscene.enabled = 0
            splashscene.visible = 0
            scene.opacity = 1
            scene.visible = 1
            scene.enabled = 1
            gameWindow.activeScene= scene

        }
    }


    Scene {
        id: scene
        signal namePressed()
        opacity: 0
        Keys.forwardTo: tac
        // the "logical size" - the scene content is auto-scaled to match the GameWindow size
        width: 480
        height: 320
        Image {
            id: ground
            x: 0
            y: 0
            source: "../assets/MenuBackground.jpg"
            width: 480
            height: 320
          //  fillMode: Image.PreserveAspectFit
        }
        // background rectangle matching the logical scene size (= safe zone available on all devices)
        // see here for more details on content scaling and safe zone: https://v-play.net/doc/vplay-different-screen-sizes/
        Column {

            anchors.left: parent
            anchors.centerIn: parent.left
            MenuButtonBase {
                text: "Start Story"


            }
            MenuButtonBase {
                id: menuButtonBase
                text: "Exit"
            }

        }
        EntityBase {

            AnimatedSpriteVPlay {
                running: scene.enabled
                id: name1
                interpolate: false
                frameRate: 3
                frameCount: 3 //Количество кадров
                width: 26 //Ширина окна
                height: 32
                frameHeight: 32 //Высота выреза файла
                frameWidth: 31  //Ширина выреза файла
                frameX: 38 //С чего начинать обрезку файла
                frameY: 19
                source: "../assets/chibi.png"
         }
            //Image
           // {
          //      id: sp2
//
         //   source: "../assets/name1.png"


          //  }
             TwoAxisController {
                 id: tac
                // inputActionPressed: ps(inputActionsToKeyCode)
             }

             MovementAnimation {
               id: xma
               target: parent
               property: "x"

               // outputXAxis is +1 if target is to the right, -1 when to the left and 0 when aiming towards it
               velocity: 300*tac.xAxis
               // alternatively, also the acceleration could be set, depends on how you want the entity to behave

               // start rotating towards the target immediately, when xAxis is +1 or -1
               running: true
               maxPropertyValue: ground.width-26
               minPropertyValue: 0

             }
             MovementAnimation {
                 id:yma
                 target: parent
                 property: "y"
                 velocity: -300*tac.yAxis
                 running: true
                 maxPropertyValue: ground.height-32
                 minPropertyValue: 0
             }
//             MovementAnimation {
//                     target: parent
//                     property: "pos"
//                    // velocity: Qt.point(30, 10)
//                     running: true

//                     // limit the entity within the scene size
//                     minPropertyValue: Qt.poitn(0, 0)
//                     maxPropertyValue: Qt.point(ground.width, ground.height)
//                   }

          /*  function sp(but) {
            switch(but){
            case "up":
                name1.

            }}*/

    }
}
    Timer {
      id: mainItemDelay
      interval: 3500
      onTriggered: {
        mainItemLoader.source = "MainItem.qml"
      }
    }

    // as soon as we set the source property, the loader will load the game
    Loader {
      id: mainItemLoader
      onLoaded: {
        if(item) {
          hideSplashDelay.start()
        }
      }
    }



}
