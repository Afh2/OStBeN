import VPlay 2.0
import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import "../common"

SceneBase {

    signal backToMenu
    opacity: 0
    // we set the visible property to false if opacity is 0 because the renderer skips invisible items, this is an performance improvement
    visible: opacity > 0
    // if the scene is invisible, we disable it. In Qt 5, components are also enabled if they are invisible. This means any MouseArea in the Scene would still be active even we hide the Scene, since we do not want this to happen, we disable the Scene (and therefore also its children) if it is hidden
    enabled: visible
    TextField {
      id: inputText
      anchors.centerIn: parent
//      anchors.verticalCenter: inputWindow.verticalCenter
//      anchors.left: inputWindow.left
//      anchors.leftMargin: 8
//        font.pixelSize: 30
//      width: parent.width - 40
//      maximumLength: 200
    placeholderText: "Write something..."
//      style: TextFieldStyle {background: null; textColor: "black" }
//      inputMethodHints: Qt.ImhNoPredictiveText
//      validator: RegExpValidator{regExp: /^[a-zA-Z0-9äöüßÄÖÜ;,:._'#+*~@€<>|?ß=()/&%!°^" -]+$/}

//      // disable and reset the inputField when closed
//      onVisibleChanged: {
//        readOnly = visible ? false : true
//        if (!visible) focus = false
//        text = ""
//      }

//      // check, send and reset the text after hitting enter
//      onAccepted: {
//        if (text){
//          var message = multiplayer.localPlayer.name + ": " + text
//          gConsole.printLn(message)
//          multiplayer.sendMessage(gameLogic.messagePrintChat, message)
//          text = ""
//          maximumLength = 100
//        }
//      }
//    }
//    Image {
//        id: ground
//        x: 0
//        y: 0
//        source: "../assets/MenuBackground.jpg"
//        width: 480
//        height: 320
//      //  fillMode: Image.PreserveAspectFit
//    }

}
    Column {
        anchors.verticalCenter:  parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: 20

        MenuButtonBase{
            text: "Back to Menu"
            onClicked: backToMenu()
        }
    }
}
