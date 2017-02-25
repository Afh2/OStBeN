import VPlay 2.0
import QtQuick 2.0
import "../common"
import "../entities"


// EMPTY SCENE

SceneBase {
    id: levelScene
    opacity: 0
    signal goToMenu


    MainHero {
     id: hero1
     x: 10
     y: 600
     z: 1
     onGoOverWindow: goToMenu()

         MovementAnimation {
             id:yma
             target: parent
             property: "y"
             velocity: -300*tac.yAxis
             running: enabled
             maxPropertyValue:  levelScene.height
             minPropertyValue: levelScene.height* 2/3
         }
    }

    Keys.forwardTo: hero1.to_tac

    AnimatedImage{
        id: background_up
        width: parent.width
        height: parent.height*2/3 + 5
        anchors.horizontalCenter: parent.horizontalCenter
        source: "../../assets/img/BackgroundScene-1-1.gif"
 }
    Image {
        id: background_down
        width: parent.width
        height: parent.height/3
        source: "../../assets/img/ground.png"
        anchors.bottom: parent.bottom
        anchors.top: background_up.bottom
    }

    JoystickControllerHUD {
        anchors.bottom: parent.bottom
        anchors.right: parent.right

        // the joystick width is the space from the left to the start of the logical scene, so the radius is its half
        joystickRadius: scene.x/2


        // this allows setting custom images for the JoystickControllerHUD component
        source: "../../assets/img/joystick_background.png"
        thumbSource: "../../assets/img/joystick_thumb.png"


        // this is the mapping between the output of the JoystickControllerHUD to the input of the player's TwoAxisController
        // this is a performance improvement, to not have to bind every time the position changes
        property variant playerTwoxisController: hero1.getComponent("TwoAxisController")
        onControllerXPositionChanged: hero1.to_tac.xAxis = controllerXPosition;
        onControllerYPositionChanged: hero1.to_tac.yAxis = controllerYPosition;
    }

}
