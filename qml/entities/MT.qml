import VPlay 2.0
import QtQuick 2.0

EntityBase {

    AnimatedSpriteVPlay {
        running: scene.enabled
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
       maxPropertyValue: ground.width-26
       minPropertyValue: 0

     }
     MovementAnimation {
         id:yma
         target: parent
         property: "y"
         velocity: -300*tac.yAxis
         running: true
         maxPropertyValue: ground.height-32
         minPropertyValue: 0
     }
//             MovementAnimation {
//                     target: parent
//                     property: "pos"
//                    // velocity: Qt.point(30, 10)
//                     running: true

//                     // limit the entity within the scene size
//                     minPropertyValue: Qt.poitn(0, 0)
//                     maxPropertyValue: Qt.point(ground.width, ground.height)
//                   }

  /*  function sp(but) {
    switch(but){
    case "up":
        name1.

    }}*/

}
