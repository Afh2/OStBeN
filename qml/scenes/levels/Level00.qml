import VPlay 2.0
import QtQuick 2.0
import "../../entities"
import "../../entities/NPC"
import "../../common"

SceneBase {
   id: level00
   opacity: 0
   visible: opacity > 0
   enabled: visible
   PhysicsWorld {
       id: world
     updatesPerSecondForPhysics: 30
   }
   Keys.forwardTo: mt.to_tac

   MT {

    id: mt
    z:1
    x: 100
    y:100


   // onContact: goToMenu()
   }

    focus: true




//    EntityBase {
//        id: entity9
//        focus: true
//        onFocusChanged: entity9.focus()
//        anchors.bottom: parent.bottom
//        height: 80
//        width: 100
//        BoxCollider {
//            id: boxCollider
//            bodyType: Body.Static
//            // the size of the collider is the same as the one from entity by default
//        }

//        Rectangle {
//            anchors.fill: parent
//            color: "brown"
//            // this could be set to true for debugging
//            visible: false
//        }
//    }

    AnimatedImage{
        id: background_up
        width: parent.width
        height: parent.height*2/3 + 5
        anchors.horizontalCenter: parent.horizontalCenter
        source: "../../../assets/img/BackgroundScene-1-1.gif"
 }
    Image {
        id: background_down
        width: parent.width
        height: parent.height/3
        source: "../../../assets/img/ground.png"
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
//    JoystickControllerHUD {
//        anchors.bottom: parent.bottom
//        anchors.right: parent.right

//        // the joystick width is the space from the left to the start of the logical scene, so the radius is its half
//        joystickRadius: scene.x/2


//        // this allows setting custom images for the JoystickControllerHUD component
//        source: "../../assets/img/joystick_background.png"
//        thumbSource: "../../assets/img/joystick_thumb.png"


//        // this is the mapping between the output of the JoystickControllerHUD to the input of the player's TwoAxisController
//        // this is a performance improvement, to not have to bind every time the position changes
//        property variant playerTwoxisController: hero1.getComponent("TwoAxisController")
//        onControllerXPositionChanged: hero1.to_tac.xAxis = controllerXPosition;
//        onControllerYPositionChanged: hero1.to_tac.yAxis = controllerYPosition;
//    }

}
