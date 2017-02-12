import VPlay 2.0
import QtQuick 2.0
import "./common"

GameWindow {
    id: gameWindow
    property alias menuButtonBase: menuButtonBase

    // You get free licenseKeys from https://v-play.net/licenseKey
    // With a licenseKey you can:
    //  * Publish your games & apps for the app stores
    //  * Remove the V-Play Splash Screen or set a custom one (available with the Pro Licenses)
    //  * Add plugins to monetize, analyze & improve your apps (available with the Pro Licenses)
    //licenseKey: "<generate one from https://v-play.net/licenseKey>"

    activeScene: scene

    // the size of the Window can be changed at runtime by pressing Ctrl (or Cmd on Mac) + the number keys 1-8
    // the content of the logical scene size (480x320 for landscape mode by default) gets scaled to the window size based on the scaleMode
    // you can set this size to any resolution you would like your project to start with, most of the times the one of your main target device
    // this resolution is for iPhone 4 & iPhone 4S


    Scene {
        id: scene
Keys.forwardTo: tac
        // the "logical size" - the scene content is auto-scaled to match the GameWindow size
        width: 480
        height: 320
        Image {
            x: 0
            y: 0
            source: "../assets/MenuBackground.jpg"
            width: 480
            height: 320
            fillMode: Image.PreserveAspectFit
        }
        // background rectangle matching the logical scene size (= safe zone available on all devices)
        // see here for more details on content scaling and safe zone: https://v-play.net/doc/vplay-different-screen-sizes/
        Column {
            anchors.left: parent
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

             }
             MovementAnimation {
                 id:yma
                 target: parent
                 property: "y"
                 velocity: -300*tac.yAxis
                 running: true
             }

          /*  function sp(but) {
            switch(but){
            case "up":
                name1.

            }}*/

    }
}}
