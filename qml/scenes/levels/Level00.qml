import VPlay 2.0
import QtQuick 2.0
import "../../entities"
import "../../entities/NPC"
import "../../common"
import "../../entities"

SceneBase {
//    Image {
//        id: im1
//        opacity: 0.5
//        z:2
//        source: "../../../assets/img/controller-3.png"
//        anchors.left: parent.left
//        anchors.leftMargin: 20
//        anchors.bottom: parent.bottom
//        anchors.bottomMargin: 20
//    }
//    Image {
//        id: im2
//        opacity: 0.5
//        z:2
//        source: "../../../assets/img/pads-1.png"
//        anchors.right: parent.right
//        anchors.rightMargin: 20
//        anchors.bottom: parent.bottom
//        anchors.bottomMargin: 20
//    }

        Text{
                   id: text1
                   color: "#88053f"
                   text: "Hello Traveller!!! Welcome to Hell!)"
                   font.pointSize: 16
                   font.family: "Arial"
                   anchors.centerIn: parent
                   z:1
                   visible: false
               }

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
    y: 600
   // onContact: goToMenu()
   }

    Text {
        id: text4
        opacity: 0
font.pointSize: 16
    text: "Priva"
    x: 200
    y:600
    z:1
    }

    Keys.onUpPressed: {

    }
    Keys.onReleased:{
       // mt.bc.linearVelocity = 0; text4.opacity =1;

    }
   signal goToMenu()

   Beardie{
   id: beardie
   z:1
   x: 600
   y: 600
 //  onContactOn: goToMenu()
   onContactOn: {text1.visible = true
   if (text1.font.pointSize<40) text1.font.pointSize++
   }
   onContactEnd: text1.visible= false
   }

    focus: true



JoyStick{
    x:600
    y:10
}



        BoxCollider {
            anchors.bottom: parent.bottom
            height: 1
            width: level00.width
            id: boxCollider
            bodyType: Body.Static
            visible: false
            // the size of the collider is the same as the one from entity by default
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
//        width: parent.width
//        height: parent.height/3
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
