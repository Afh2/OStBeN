import VPlay 2.0
import QtQuick 2.0

EntityBase {
    id: mt
    property alias to_tac: tac
     property alias bc: mt_bc


    AnimatedSpriteVPlay {
        id: mt_asv
        running: enabled
        anchors.centerIn: parent
        interpolate: false
        frameRate: 4
        frameCount: 4 //Количество кадров
        width: mt_bc.width    //Ширина окна
        height: mt_bc.height
        frameHeight: 156 //Высота выреза файла
        frameWidth: 75  //Ширина выреза файла
       // frameX: 38     //С чего начинать обрезку файла
      //  frameY: 19
        source: "../../assets/sprites/main.png"
        onXChanged: {

        // mt_asv.running = false
        }
    }

     TwoAxisController {
         id: tac
       //  inputActionPressed: ps(inputActionsToKeyCode)
        inputActionsToKeyCode: {
         "up": Qt.Key_Up,
             "down": Qt.Key_Down,
                "left": Qt.Key_Left,
                "right": Qt.Key_Right,
         }
        onInputActionPressed: {

            if (actionName === "up")  {
                tac.inputActionsToKeyCode= {"up": Qt.Key_Up}}
            if (actionName === "down")  {{
                    tac.inputActionsToKeyCode= {"down": Qt.Key_Down}}}
            if (actionName === "left")  {{
                    tac.inputActionsToKeyCode= {"left": Qt.Key_Left}}}
            if (actionName === "right")  {{
                    tac.inputActionsToKeyCode= {"right": Qt.Key_Right}}}
        }
         onInputActionReleased: {
             tac.inputActionsToKeyCode= {
              "up": Qt.Key_Up,
                  "down": Qt.Key_Down,
                     "left": Qt.Key_Left,
                     "right": Qt.Key_Right,
              }

         }
//         onInputActionPressed: {
//         if (actionName === "up") mt_bc.force = Qt.point(tac.xAxis*60000, -tac.yAxis*60000)
//         }
     }

     BoxCollider {
         id: mt_bc
         body.bullet: true
         body.fixedRotation: true
         body.linearDamping: 0.1
       //  body.angularDamping: 0
      //   body.angularVelocity: 0

         anchors.centerIn: parent
         bodyType: body.Dynamic
         width:  75   //Ширина окна
         height: 156
         density: 0.02
         friction: 0.4
         restitution: 0.5
         body.linearVelocity: Qt.point(tac.xAxis*200, -tac.yAxis*200)
        // force: Qt.point(tac.xAxis*60000, -tac.yAxis*60000)
     //    force: Qt.vector2d(tac.xAxis*5000,0)

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
