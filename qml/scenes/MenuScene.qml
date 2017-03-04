import VPlay 2.0
import QtQuick 2.0
import "../common"

SceneBase {
    id: beginMenuScene
    signal beginStoryPressed
    signal gamePressed
    signal levelPressed

    // by default, set the opacity to 0 - this will be changed from the main.qml with PropertyChanges
    opacity: 0
    // we set the visible property to false if opacity is 0 because the renderer skips invisible items, this is an performance improvement
    visible: opacity > 0
    // if the scene is invisible, we disable it. In Qt 5, components are also enabled if they are invisible. This means any MouseArea in the Scene would still be active even we hide the Scene, since we do not want this to happen, we disable the Scene (and therefore also its children) if it is hidden
    enabled: visible
    Keys.forwardTo: tac
    // the "logical size" - the scene content is auto-scaled to match the GameWindow size
    width: 1024
    height: 768
    Image {
        id: ground
        anchors.verticalCenter: parent.verticalCenter
        fillMode: Image.PreserveAspectCrop
        source: "../../assets/MenuBackground.jpg"
    }
    // background rectangle matching the logical scene size (= safe zone available on all devices)
    // see here for more details on content scaling and safe zone: https://v-play.net/doc/vplay-different-screen-sizes/
    Column {
        anchors.verticalCenter:  parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: 20
        MenuButtonBase {
            text: "Start Story"
            onClicked: beginStoryPressed()
        }
        MenuButtonBase {
            text: "Exit"
            onClicked: Qt.quit()
        }

        MenuButtonBase{
            text: "Game"
            onClicked: gamePressed()
        }

        MenuButtonBase{
            text: "Level"
            onClicked: levelPressed()
        }

    }

}
