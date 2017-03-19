import VPlay 2.0
import QtQuick 2.0

Component{
    id: krug2
        Column {
        anchors.verticalCenter:  parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: 20
        spacing: 10

        MenuButtonBase{
        id: var211
        text: "круг 21 1варинат"
        onClicked: {dialogText.text += "ГГ: 2.1.1 \n \nNPC: 211 \n \n"
        //comp21.destroy()
        loader.sourceComponent = krug22}
        }

        MenuButtonBase{
        id: var212
        text: "круг 21 2варинат"
        onClicked: {dialogText.text += "ГГ: 2.1.2 \n \nNPC: 212 \n \n"
        loader.destroy()}
        }
        }
}
