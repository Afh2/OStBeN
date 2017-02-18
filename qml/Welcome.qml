import VPlay 2.0
import QtQuick 2.0

// EMPTY SCENE

Scene {
    id: welcomeScene
    Rectangle {
        anchors.fill: parent.welcomeScene
        color: "#dd94da"
    }
    Text {
        text: "Welcome to our story!"
        color: "blue"
        anchors.centerIn: parent
    }

}
