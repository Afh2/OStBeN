import VPlay 2.0
import QtQuick 2.0

GameWindow {
    id: gameWindow

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
    screenWidth: 960
    screenHeight: 640

    Scene {
        id: scene
        focus: true
        // the "logical size" - the scene content is auto-scaled to match the GameWindow size
        width: 480
        height: 320






        // background rectangle matching the logical scene size (= safe zone available on all devices)
        // see here for more details on content scaling and safe zone: https://v-play.net/doc/vplay-different-screen-sizes/

       
        JoystickControllerHUD {

            width: 70; height: 70
            z: 1
            anchors.bottom: parent.bottom
            anchors.right: parent.right

            // the joystick width is the space from the left to the start of the logical scene, so the radius is its half


            // this allows setting custom images for the JoystickControllerHUD component
            source: "../assets/img/joystick_background.png"
            thumbSource: "../assets/img/joystick_thumb.png"


            // this is the mapping between the output of the JoystickControllerHUD to the input of the player's TwoAxisController
            // this is a performance improvement, to not have to bind every time the position changes
            property variant twoAxisController: eb1.getComponent("TwoAxisController")
            controllerYPosition: 10
            controllerXPosition: 10
            joystickRadius: 30
            visible: true
            onControllerXPositionChanged: twoAxisController.xAxis = controllerXPosition;
            onControllerYPositionChanged: twoAxisController.yAxis = controllerYPosition;
        }



            Rectangle{
                  id: mainRenc
                width: parent.width
                height: parent.height
                AnimatedImage{
                    id: background_up
                    y: 0
                    width: parent.width
                    height: parent.height*2/3
                    anchors.horizontalCenterOffset: -28
                    anchors.horizontalCenter: parent.horizontalCenter
                    source: "../assets/background/Background_scene-1-1.gif"
             }

                EntityBase {
                    id: eb1
                    width: 26
                    height: 32
                    x: scene.width/2
                    y: scene.height/2
                  TwoAxisController {
                      id: twoAxisController

                      // whenever the thumb position changes, update the twoAxisController
                      xAxis: JoystickControllerHUD.controllerXPosition
                      yAxis: JoystickControllerHUD.controllerYPosition
                  }

                  BoxCollider {
                      width: 60; height: 40

                      force: Qt.point(twoAxisController.yAxis*8000, 0)
                      torque: twoAxisController.xAxis*2000
                  }


                  SpriteSequenceVPlay{
                      anchors.centerIn: parent
                    SpriteVPlay{
                    id: sp
                    frameCount: 26
                    width: 26
                    height: 32
                    source: "../assets/sprites/chibi.jpg"
                    frameHeight: 32
                    frameWidth: 26
                    frameX: 38
                    frameY: 19

                    }}}



                Image {
                    id: background_down
                    width: parent.width
                    height: parent.height/3
                    source: "../assets/background/background_down.png"
                    anchors.bottom: parent.bottom
                }





        }
            

        }// Rectangle with size of logical scene



}

