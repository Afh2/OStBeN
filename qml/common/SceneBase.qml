import VPlay 2.0
import QtQuick 2.0

// EMPTY SCENE

Scene {

    id: sceneBase
    // this is important, as it serves as the reference size for the mass of the physics objects, because the mass of a body depends on the width of its images
    width: 1024
    height: 768

  //  opacity: 0
    // NOTE: in qt5, an opaque element is not invisible by default and would handle the mouse and keyboard input!
    // thus to disable also keyboard focus and mouse handling and make an item invisible, set visible and enabled property depending on opacity
  //  visible: opacity === 0 ? false : true
  //  enabled: visible
}
