import VPlay 2.0
import QtQuick 2.0

EntityBase {
    Rectangle {
        width: 26 //Ширина окна
        height: 32}


    id: enemy


    BoxCollider {body.bullet: true
       // collisionTestingOnlyMode: true
//collisionTestingOnlyMode: true
        //active: true
    //    anchors.centerIn: name2
//categories: Box.Category2
//collidesWith: Box.Category1
width: 26
height: 32
    bodyType: body.Static

    }

//    BoxCollider{
//    categories: Box.Category2
//    anchors.fill: parent

//    collidesWith: Box.Category1
//    bodyType: body.Dynamic

//    body.linearDamping: 10
//    body.angularDamping: 15
//    }

    AnimatedSpriteVPlay {
        running: enabled
       id: name2
        interpolate: false
        frameRate: 3
        frameCount: 3 //Количество кадров
        width: 26 //Ширина окна
        height: 32
        frameHeight: 32 //Высота выреза файла
        frameWidth: 31  //Ширина выреза файла
        frameX: 38 //С чего начинать обрезку файла
        frameY: 19
        source: "../../../assets/sprites/chibi.png"


        }
    Rectangle{
    width: 26 //Ширина окна
    height: 32
}
}


//     TwoAxisController {
//         id: tac
//        // inputActionPressed: ps(inputActionsToKeyCode)
//     }

//     MovementAnimation {
//       id: xma
//       target: parent
//       property: "x"

//       // outputXAxis is +1 if target is to the right, -1 when to the left and 0 when aiming towards it
//       velocity: 300*tac.xAxis
//       // alternatively, also the acceleration could be set, depends on how you want the entity to behave

//       // start rotating towards the target immediately, when xAxis is +1 or -1
//       running: enabled
//       maxPropertyValue: 1024-26
//     //  limitReached: maxPropertyValue
//       minPropertyValue: 0
//       onLimitReached: goOverWindow()
//     }

//     MovementAnimation {
//         id:yma
//         target: parent
//         property: "y"
//         velocity: -300*tac.yAxis
//         running: enabled
//         maxPropertyValue: 768-32
//         minPropertyValue: 0
//     }