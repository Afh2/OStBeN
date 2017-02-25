import VPlay 2.0
import QtQuick 2.0
import "../entities"
import "../common"

// EMPTY SCENE

SceneBase {
    opacity: 0
    signal goToMenu

   BoxCollider{

   bodyType: Body.Static
   }
   MainHero {
    id: hero1
    onGoOverWindow: goToMenu()
   // onContact: goToMenu()
   }

   Enemy{
   id: enemy1
   x: 700
   y: 600
   onContact: goToMenu()
   }

    Keys.forwardTo: hero1.to_tac

    Text {
        text: "Game-Scene"
        color: "blue"
        anchors.centerIn: parent
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
