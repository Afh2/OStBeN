import VPlay 2.0
import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

Scene {
    TextField {
      id: inputText
      anchors.centerIn: parent.Center
      anchors.verticalCenter: inputWindow.verticalCenter
      anchors.left: inputWindow.left
      anchors.leftMargin: 8
      font.pixelSize: 16
      width: parent.width - 40
      maximumLength: 200
      placeholderText: "Write something..."
      style: TextFieldStyle {background: null; textColor: "black" }
      inputMethodHints: Qt.ImhNoPredictiveText
      validator: RegExpValidator{regExp: /^[a-zA-Z0-9äöüßÄÖÜ;,:._'#+*~@€<>|?ß=()/&%!°^" -]+$/}

      // disable and reset the inputField when closed
      onVisibleChanged: {
        readOnly = visible ? false : true
        if (!visible) focus = false
        text = ""
      }

      // check, send and reset the text after hitting enter
      onAccepted: {
        if (text){
          var message = multiplayer.localPlayer.name + ": " + text
          gConsole.printLn(message)
          multiplayer.sendMessage(gameLogic.messagePrintChat, message)
          text = ""
          maximumLength = 100
        }
      }
    }
    Image {
        id: ground
        x: 0
        y: 0
        source: "../assets/MenuBackground.jpg"
        width: 480
        height: 320
      //  fillMode: Image.PreserveAspectFit
    }
}
