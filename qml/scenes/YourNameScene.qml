import VPlay 2.0
import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import "../common"

SceneBase {
    opacity: 0
    // we set the visible property to false if opacity is 0 because the renderer skips invisible items, this is an performance improvement
//    visible: opacity > 0
//    // if the scene is invisible, we disable it. In Qt 5, components are also enabled if they are invisible. This means any MouseArea in the Scene would still be active even we hide the Scene, since we do not want this to happen, we disable the Scene (and therefore also its children) if it is hidden
//    enabled: visible

    signal backToMenuPressed
    signal goNextPressed

    Text{
        id: hello
        font.pixelSize: 50
        anchors.centerIn: parent
        text: ""
        color: "red"
    }

    TextField {
      id: inputText
      anchors.centerIn: parent
      font.pixelSize: 36
      width: 300
      maximumLength: 15
      placeholderText: "Write your name..."
//      style: TextFieldStyle {background: null; textColor: "black" }
      inputMethodHints: Qt.ImhNoPredictiveText
      validator: RegExpValidator{regExp: /^[a-zA-Z0-9äöüßÄÖÜ;,:._'#+*~@€<>|?ß=()/&%!°^" -]+$/}

}

        MenuButtonBase{
            text: "Back to Menu"
            onClicked: backToMenuPressed()
            anchors.top: parent.top
            anchors.topMargin: 100
            anchors.left: parent.left
            anchors.leftMargin: 20
        }

        MenuButtonBase{
            id: enterName
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 200
            anchors.right: parent.right
            anchors.rightMargin: 100
            text: "Enter name"
            onClicked: {if(inputText.text == ""){}
                else{
                settings.username = inputText.text
                inputText.destroy()
            hello.text = "Hello " + settings.username + "!"
            enterName.destroy()
            loader1.sourceComponent = goNext}}
        }

        Loader {
            id: loader1
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 200
            anchors.right: parent.right
            anchors.rightMargin: 100
          }

        Component{
                id: goNext
            MenuButtonBase{
                text: "Continue"
                onClicked: goNextPressed()
            }
        }




}
