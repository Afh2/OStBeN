import VPlay 2.0
import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1
import "../common"

// EMPTY SCENE

SceneBase {
   opacity: 0

   Rectangle{
       id: vertLine
   anchors.bottom: parent.bottom
   anchors.top: parent.top
   width: 5
   x: 120
   color: "black"
   }

   Rectangle{
       id: gorLine
   anchors.left: vertLine.right
   anchors.right: parent.right
   height: 5
   y: 500
   color: "black"
   }

Rectangle{
    id: dialRect
    anchors.left: vertLine.right
    anchors.right: parent.right
    anchors.top: parent.top
    anchors.bottom: gorLine.top
    color: "#b2d7b2"

    Text {
        id: dialogText
        text: "Эй, ты там! Да, ты! Не хочешь посмотреть маленькое представление кукольного театра? За символическую сцену ты, путник, увидишь
представление оживших кукол дона Бородача.\n \n"
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 20
        anchors.right: parent.right
        anchors.rightMargin: 20
        anchors.topMargin: 10
    }

}

Rectangle{
    id: varAnswerRect
    anchors.left: vertLine.right
    anchors.right: parent.right
    anchors.top: gorLine.bottom
    anchors.bottom: parent.bottom
    color: "#daaab1"


//    Text {
//        text: "Выберите ваш вариант ответа"
//        color: "blue"
//        anchors.centerIn: parent
//    }



Column {
    id: krug0

    anchors.verticalCenter:  parent.verticalCenter
    anchors.left: parent.left
    anchors.leftMargin: 20
    spacing: 10

    MenuButtonBase{
    id: var11
    text: "Почему бы и нет."
    onClicked: {dialogText.text += "ГГ: Почему бы и нет.\n \nNPC: Отлично! Присаживайся поудобней, мы начинаем! (действие 0)\n \n"
    krug0.destroy()}
    }

    MenuButtonBase{
    id: var12
    text: "Какова цена?"
    onClicked: {dialogText.text += "ГГ: Какова цена?\n \nNPC: Не беспокойся об этом, я уверен ты сможешь расплатиться.\n \n"
    krug0.destroy()
    loader.sourceComponent = krug21}
    }

    MenuButtonBase{
    id: var13
    text: "Оживших?"
    onClicked: {dialogText.text += "ГГ: Оживших?\n \nNPC: Это лишь гипербола. Так как насчет представления?\n \n"
    krug0.destroy()
    loader.sourceComponent = krug22}
    }

    MenuButtonBase{
    id: var14
    text: "Извиняюсь, но я спешу."
    onClicked: {dialogText.text += "ГГ: Извиняюсь, но я спешу.\n \nNPC: Невежливо отказываться от столь щедрого предложения - в городе нет ничего подобного. Тем более я тут стоял и ждал тебя!\n \n"
    krug0.destroy()
    loader.sourceComponent = krug23}
    }

    MenuButtonBase{
    id: var15
    text: "Представьтесь вначале!"
    onClicked: {dialogText.text += "ГГ: Представьтесь вначале!\n \nNPC: Я - дон Бородач. Мои кукольные представления известны в городе и за его пределами. Вы будете очарованы моими ожившими куклами и их
маленькими пьесками.\n \n"
    krug0.destroy()
    loader.sourceComponent = krug24}
    }

}

Loader {
    anchors.verticalCenter:  parent.verticalCenter
    id: loader
  }

Component{
    id: krug21
        Column {
        anchors.verticalCenter:  parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: 20
        spacing: 10

        MenuButtonBase{
        id: var211
        text: "Назовите конкретно цену, пожалуйста!"
        onClicked: {dialogText.text += "ГГ: Назовите конкретно цену, пожалуйста! \n \nNPC: Послушай, дорогой странник: либо ты хочешь увидеть представление, либо нет. \n \n"
        loader.sourceComponent = krug321}
        }

        MenuButtonBase{
        id: var212
        text: "Хорошо, вы уговорили. Готова увидеть представление."
        onClicked: {dialogText.text += "ГГ: Хорошо, вы уговорили. Готова увидеть представление. \n \nNPC: Отлично! Присаживайся поудобней, мы начинаем! (действие 0) \n \n"
        loader.destroy()}
        }
        }
}

Component{
    id: krug22
Column {
    anchors.verticalCenter:  parent.verticalCenter
    anchors.left: parent.left
    anchors.leftMargin: 20
    spacing: 10

    MenuButtonBase{
    id: var221
    text: "Почему бы и нет."
    onClicked: {dialogText.text += "ГГ: Почему бы и нет.\n \nNPC: Отлично! Присаживайся поудобней, мы начинаем! (действие 0)\n \n"
    loader.destroy()}
    }

    MenuButtonBase{
    id: var222
    text: "Какова цена?"
    onClicked: {dialogText.text += "ГГ: Какова цена?\n \nNPC: Не беспокойся об этом, я уверен ты сможешь расплатиться.\n \n"
    loader.sourceComponent = krug21}
    }

    MenuButtonBase{
    id: var223
    text: "Извиняюсь, но я спешу."
    onClicked: {dialogText.text += "ГГ: Извиняюсь, но я спешу.\n \nNPC: Невежливо отказываться от столь щедрого предложения - в городе нет ничего подобного. Тем более я тут стоял и ждал тебя!\n \n"
    krug0.destroy()
    loader.sourceComponent = krug22}
    }

    MenuButtonBase{
    id: var224
    text: "Представьтесь вначале!"
    onClicked: {dialogText.text += "ГГ: Представьтесь вначале!\n \nNPC: Я - дон Бородач. Мои кукольные представления известны в городе и за его пределами. Вы будете очарованы моими ожившими куклами и их
маленькими пьесками.\n \n"
    krug0.destroy()
    loader.sourceComponent = krug22}
    }

}}

Component{
    id: krug23
        Column {
        anchors.verticalCenter:  parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: 20
        spacing: 10

        MenuButtonBase{
        id: var231
        text: "Неправда: мы с вами встретились случайно."
        onClicked: {dialogText.text += "ГГ: Неправда: мы с вами встретились случайно. \n \nNPC: (действие 1) \n \n"
        loader.destroy()}
        }

        MenuButtonBase{
        id: var232
        text: "Хорошо, вы уговорили. Готова увидеть представление."
        onClicked: {dialogText.text += "ГГ: Хорошо, вы уговорили. Готова увидеть представление. \n \nNPC: Отлично! Присаживайся поудобней, мы начинаем! (действие 0) \n \n"
        loader.destroy()}
        }

        MenuButtonBase{
        id: var233
        text: "Всё же я настаиваю: мне пора."
        onClicked: {dialogText.text += "ГГ: Всё же я настаиваю: мне пора. \n \nNPC: (действие 1) \n \n"
        loader.destroy()}
        }
        }
}

Component{
    id: krug24
        Column {
        anchors.verticalCenter:  parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: 20
        spacing: 10

        MenuButtonBase{
        id: var241
        text: "Здравствуйте, дон Бородач. Я - Марика Тено, свободный путешественник."
        onClicked: {dialogText.text += "ГГ: Здравствуйте, дон Бородач. Я - Марика Тено, свободный путешественник. \n \nNPC: Вы, похоже, из квартала сакуры. Однако, я жду ответа на мой вопрос. \n \n"
        loader.sourceComponent = krug351}
        }

        MenuButtonBase{
        id: var242
        text: "Привет. Я просто проходила мимо."
        onClicked: {dialogText.text += "ГГ: Привет. Я просто проходила мимо. \n \nNPC: Хорошо, прохожий. Так что, могу я тебе показать представление? \n \n"
        loader.sourceComponent = krug341}
        }

        MenuButtonBase{
        id: var243
        text: "Ха-ха! Бородач! Такой большой, а играешься в куклы."
        onClicked: {dialogText.text += "ГГ: Ха-ха! Бородач! Такой большой, а играешься в куклы. \n \nNPC: Как грубо! (действие 1) \n \n"
        loader.destroy()}
        }
        }
}

Component{
    id: krug321
        Column {
        anchors.verticalCenter:  parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: 20
        spacing: 10

        MenuButtonBase{
        id: var3211
        text: "Я не собираюсь смотреть ваше представление!"
        onClicked: {dialogText.text += "ГГ: Я не собираюсь смотреть ваше представление! \n \nNPC: (действие 1) \n \n"
        loader.destroy()}
        }

        MenuButtonBase{
        id: var3212
        text: "Хорошо, вы уговорили. Готова увидеть представление."
        onClicked: {dialogText.text += "ГГ: Хорошо, вы уговорили. Готова увидеть представление. \n \nNPC: Отлично! Присаживайся поудобней, мы начинаем! (действие 0) \n \n"
        loader.destroy()}
        }
        }
}

Component{
    id: krug341
        Column {
        anchors.verticalCenter:  parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: 20
        spacing: 10

        MenuButtonBase{
        id: var3411
        text: "Почему бы и нет."
        onClicked: {dialogText.text += "ГГ: Почему бы и нет.\n \nNPC: Отлично! Присаживайся поудобней, мы начинаем! (действие 0)\n \n"
        loader.destroy()}
        }

        MenuButtonBase{
        id: var3412
        text: "Извиняюсь, но я спешу."
        onClicked: {dialogText.text += "ГГ: Извиняюсь, но я спешу.\n \nNPC: Невежливо отказываться от столь щедрого предложения - в городе нет ничего подобного. Тем более я тут стоял и ждал тебя!\n \n"
        loader.sourceComponent = krug23}
        }
        }
}

Component{
    id: krug351
        Column {
        anchors.verticalCenter:  parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: 20
        spacing: 10

        MenuButtonBase{
        id: var3511
        text: "Хорошо, вы уговорили. Готова увидеть представление."
        onClicked: {dialogText.text += "ГГ: Хорошо, вы уговорили. Готова увидеть представление. \n \nNPC: Отлично! Присаживайся поудобней, мы начинаем! (действие 0) \n \n"
        loader.destroy()}
        }

        MenuButtonBase{
        id: var3512
        text: "Извиняюсь, но я спешу."
        onClicked: {dialogText.text += "ГГ: Извиняюсь, но я спешу.\n \nNPC: Невежливо отказываться от столь щедрого предложения - в городе нет ничего подобного. Тем более я тут стоял и ждал тебя!\n \n"
        loader.sourceComponent = krug23}
        }
        }
}




}





Rectangle{
    id: leftSideRect
    anchors.left: parent.left
    anchors.right: vertLine.left
    anchors.top: parent.top
    anchors.bottom: parent.bottom
    color: "#9a9ace"
}



}
