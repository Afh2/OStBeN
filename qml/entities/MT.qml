import VPlay 2.0
import QtQuick 2.0

EntityBase {
    id: mt
    property alias to_tac: tac



    AnimatedSpriteVPlay {
        id: mt_asv
        running: enabled
        anchors.centerIn: parent
        interpolate: false
        frameRate: 3
        frameCount: 3 //Количество кадров
        width: mt_bc.width    //Ширина окна
        height: mt_bc.height
        frameHeight: 32 //Высота выреза файла
        frameWidth: 31  //Ширина выреза файла
        frameX: 38     //С чего начинать обрезку файла
        frameY: 19
        source: "../../assets/sprites/chibi.png"
        onXChanged: {

         mt_asv.running = false
        }
    }

     TwoAxisController {
         id: tac
        // inputActionPressed: ps(inputActionsToKeyCode)
         inputActionsToKeyCode: {
         "up"= Qt.Key_Up
         }
         onInputActionPressed: {
         if (actionName === "up") mt_bc.force = Qt.point(tac.xAxis*60000, -tac.yAxis*60000)
         }
     }

     BoxCollider {
         id: mt_bc
         body.bullet: true
         body.linearDamping: 10
         body.angularDamping: 15
         anchors.centerIn: parent
         bodyType: body.Dynamic
         width: 26     //Ширина окна
         height: 32
         density: 0.02
         friction: 0.4
         restitution: 0.5


         // this is applied every physics update tick



        onForceChanged: {

        }
        // torque: tac.xAxis*2000 * world.pixelsPerMeter * world.pixelsPerMeter



//         MovementAnimation {
//           id: xma
//           target: mt_bc
//           property: "x"

//           // outputXAxis is +1 if target is to the right, -1 when to the left and 0 when aiming towards it
//           velocity: 300*tac.xAxis
//           // alternatively, also the acceleration could be set, depends on how you want the entity to behave

//           // start rotating towards the target immediately, when xAxis is +1 or -1
//           running: enabled
//         //  maxPropertyValue: ground.width-26
//          // minPropertyValue: 0

//         }
//         MovementAnimation {
//             id:yma
//             target: mt_bc
//             property: "y"
//             velocity: -300*tac.yAxis
//             running: enabled
//            // maxPropertyValue: ground.height-32
//            // minPropertyValue: 0
//         }



     }



}
