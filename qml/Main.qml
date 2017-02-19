import VPlay 2.0
import QtQuick 2.0
import "common"
import "scenes"
import "entities"

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
        onGamePressed: gameWindow.state = "game"
    }
    YourNameScene {
        id: yourNameScene
        onBackToMenu: gameWindow.state = "menu"
    }

    GameOnScene{
        id: gameOnScene
        onGoToMenu: gameWindow.state = "menu"
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
            PropertyChanges {target: gameOnScene; opacity: 0}
        },
        State {
            name: "menu"
            PropertyChanges {target: beginMenuScene; opacity: 1}
            PropertyChanges {target: gameWindow; activeScene: beginMenuScene}
            PropertyChanges {target: gameOnScene; opacity: 0}
        },

        State {
            name: "game"
            PropertyChanges {target: gameOnScene; opacity: 1; enabled: true; visible: true}
            PropertyChanges {target: gameWindow; activeScene: gameOnScene}
            PropertyChanges {target: beginMenuScene; opacity: 0}
        }

    ]


}
