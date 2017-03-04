import VPlay 2.0
import QtQuick 2.0



JoystickControllerHUD {
    anchors.bottom: parent.bottom
    anchors.right: parent.right
    z: 1
    // the joystick width is the space from the left to the start of the logical scene, so the radius is its half
    joystickRadius: scene.x/2


    // this allows setting custom images for the JoystickControllerHUD component
    source: "../../assets/img/joystick_background.png"
    thumbSource: "../../assets/img/joystick_thumb.png"


    // this is the mapping between the output of the JoystickControllerHUD to the input of the player's TwoAxisController
    // this is a performance improvement, to not have to bind every time the position changes
    property variant playerTwoxisController: mt.getComponent("TwoAxisController")
    onControllerXPositionChanged: mt.to_tac.xAxis = controllerXPosition;
    onControllerYPositionChanged: mt.to_tac.yAxis = controllerYPosition;
}
