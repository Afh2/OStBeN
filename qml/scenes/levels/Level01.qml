import VPlay 2.0
import QtQuick 2.0
import QtQuick.Dialogs 1.2
import "../../entities"
import "../../entities/NPC"
import "../../common"
import "../../entities"

SceneBase {

   id: level01
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
    y: 600
   }

   signal goToDialog()

   Beardie{
   id: beardie
   z:1
   x: 600
   y: 600
   onContactOn: {
       goToDialog()
   }
   }

    focus: true



JoyStick{
}



        BoxCollider {
            anchors.right: parent.right
            height: parent.height
            width: 0,1
            id: rightCollider
            bodyType: Body.Static
            visible: false
        }


    AnimatedImage{
        id: background_up
        height: parent.height*2/3 + 5
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.horizontalCenter: parent.horizontalCenter
        source: "../../../assets/img/BackgroundScene-1-1.gif"
 }
    Image {
        id: background_down
        source: "../../../assets/img/ground.png"
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.top: background_up.bottom

        BoxCollider {
            id: topCollider
            anchors.bottom: parent.top
            height: 0,1
            width: parent.width
            bodyType: Body.Static
            visible: false
            // the size of the collider is the same as the one from entity by default
        }
    }


}
