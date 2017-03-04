import VPlay 2.0
import QtQuick 2.0

// EMPTY SCENE

Scene {

    id: sceneBase
    // this is important, as it serves as the reference size for the mass of the physics objects, because the mass of a body depends on the width of its images
    width: 1024
    height: 768

    BoxCollider {
        id: bottomCollider
        anchors.top: parent.bottom
        height: 1
        width: parent.width
        bodyType: Body.Static
        visible: false
        // the size of the collider is the same as the one from entity by default
    }

    BoxCollider {
        id: leftCollider
        anchors.right: parent.left
        height: parent.height
        width: 1
        bodyType: Body.Static
        visible: false
        // the size of the collider is the same as the one from entity by default
    }

    BoxCollider {
        id: topCollider
        anchors.bottom: parent.top
        height: 1
        width: parent.width
        bodyType: Body.Static
        visible: false
        // the size of the collider is the same as the one from entity by default
    }

  //  opacity: 0
    // NOTE: in qt5, an opaque element is not invisible by default and would handle the mouse and keyboard input!
    // thus to disable also keyboard focus and mouse handling and make an item invisible, set visible and enabled property depending on opacity
  //  visible: opacity === 0 ? false : true
  //  enabled: visible
}
