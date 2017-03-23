import VPlay 2.0
import QtQuick 2.0
import "common"
import "scenes"
import "scenes/levels"

GameWindow {
    id: gameWindow
    width: 1024
    height: 768
    EntityManager {
      id: entityManager
    }
    // You get free licenseKeys from https://v-play.net/licenseKey
    // With a licenseKey you can:
    //  * Publish your games & apps for the app stores
    //  * Remove the V-Play Splash Screen or set a custom one (available with the Pro Licenses)
    //  * Add plugins to monetize, analyze & improve your apps (available with the Pro Licenses)
    //licenseKey: "<generate one from https://v-play.net/licenseKey>"
    activeScene: splashscene
    SplashScene {
        id: splashscene
    }
    MenuScene {
        id: beginMenuScene
        onBeginStoryPressed: gameWindow.state = "yourname"
        onStartPressed: gameWindow.state = "game1"
        onDialogPressed: gameWindow.state = "dialog"
    }
    YourNameScene {
        id: yourNameScene
        onBackToMenuPressed: gameWindow.state = "menu"
        onGoNextPressed: gameWindow.state = "game0"
    }
    Level00 {
        id: level00
        onGoToNextLevel: gameWindow.state = "game1"
    }
    Level01 {
        id: level01
        onGoToDialog: gameWindow.state = "dialog"
    }
    DialogScene{
    id: dialogScene
    onBackToMenuPressed: gameWindow.state = "menu"
    }
    // the size of the Window can be changed at runtime by pressing Ctrl (or Cmd on Mac) + the number keys 1-8
    // the content of the logical scene size (480x320 for landscape mode by default) gets scaled to the window size based on the scaleMode
    // you can set this size to any resolution you would like your project to start with, most of the times the one of your main target device
    // this resolution is for iPhone 4 & iPhone 4S
    onSplashScreenFinished: splashScreenStop.start()
    Timer {
        id: splashScreenStop
        interval: 1000
        onTriggered: {
            splashscene.opacity = 0
            splashscene.enabled = 0
            splashscene.visible = 0
            gameWindow.activeScene= beginMenuScene
            gameWindow.state = "menu"

        }
    }
    states: [
        State {
            name: "yourname"
            PropertyChanges {target: yourNameScene; opacity: 1}
            PropertyChanges {target: gameWindow; activeScene: yourNameScene}
            PropertyChanges {target: beginMenuScene; opacity: 0}
        },
        State {
            name: "menu"
            PropertyChanges {target: beginMenuScene; opacity: 1}
            PropertyChanges {target: gameWindow; activeScene: beginMenuScene}
            PropertyChanges {target: level01; opacity: 0}
        },

        State {
            name: "game0"
            PropertyChanges {target: level00; opacity: 1}
            PropertyChanges {target: gameWindow; activeScene: level00}
            PropertyChanges {target: entityManager; entityContainer:  level00}
            PropertyChanges {target: yourNameScene; opacity: 0}
        },
        State {
            name: "game1"
            PropertyChanges {target: level01; opacity: 1}
            PropertyChanges {target: gameWindow; activeScene: level01}
            PropertyChanges {target: entityManager; entityContainer:  level01}
            PropertyChanges {target: level00; opacity: 0}
        },
        State {
            name: "dialog"
            PropertyChanges {target: dialogScene; opacity: 1}
            PropertyChanges {target: gameWindow; activeScene: dialogScene}
            PropertyChanges {target: beginMenuScene; opacity: 0}
            PropertyChanges {target: level00; opacity: 0}
        }


    ]


}
