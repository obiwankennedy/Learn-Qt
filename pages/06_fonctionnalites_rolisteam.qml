import QtQuick 2.0
import QtQuick.Window 2.2

Rectangle {
    id: rectangle1
    width: ScreenW
    height: ScreenH
    //    height: 600
    //  anchors.centerIn: parent
    border.color: "#E3E3E3"
    border.width: 5
    color: "#E3E3E3"
    Image {
        id: image1
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: ScreenW*0.04
        fillMode: Image.PreserveAspectFit
        source: "qrc:/rsrc/Rolisteam.svg"
        width: ScreenW*0.2
    }

    Text {
        id: text1
        anchors.top:image1.top
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: image1.bottom
        width: ScreenW*0.5
        height: ScreenH*0.01
        color: "black"
        text: qsTr("Fonctionnalités")
        anchors.horizontalCenterOffset: 1
        font.family: "Verdana"
        font.bold: true
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: ScreenH/20
    }

    Image {
        id: screenShotCase
        property string newSource: "qrc:/rsrc/chat.png"
        anchors.left: text1.right
        anchors.leftMargin: -ScreenW*0.1
        anchors.top: text1.bottom
        anchors.bottom: listView1.bottom
        anchors.right: parent.right
        fillMode: Image.PreserveAspectFit
        source:  "qrc:/rsrc/chat.png"
        state : "msg"
        states: [
            State {
              name: "msg"
              when: listView1.currentIndex == 0
              PropertyChanges {
                  target: screenShotCase
                  source: "qrc:/rsrc/chat.png"
              }
            },
            State {
              name: "dice"
              when: listView1.currentIndex == 1
              PropertyChanges {
                  target: screenShotCase
                  source: "qrc:/rsrc/dice.png"
              }
            },
            State {
              name: "note"
              when: listView1.currentIndex == 2
              PropertyChanges {
                  target: screenShotCase
                  source: "qrc:/rsrc/notes.png"
              }
            },
            State {
              name: "plans"
              when: listView1.currentIndex == 3
              PropertyChanges {
                  target: screenShotCase
                  source: "qrc:/rsrc/map.jpg"
              }
            },
            State {
              name: "img"
              when: listView1.currentIndex == 4
              PropertyChanges {
                  target: screenShotCase
                  source: "qrc:/rsrc/picture.png"
              }
            },
            State {
              name: "music"
              when: listView1.currentIndex == 5
              PropertyChanges {
                  target: screenShotCase
                  source: "qrc:/rsrc/sound.png"
              }
            }

        ]
        transitions: [
            Transition {
                from: "*"
                to: "*"
                SequentialAnimation{
                    PropertyAnimation {
                        target: screenShotCase
                        property: "opacity"
                        from: 1.0
                        to: 0.0
                    }
                  /*  PropertyAction {
                        target: screenShotCase
                        property: "source"
                        value:screenShotCase.newSource
                    }*/
                    PropertyAnimation {
                        target: screenShotCase
                        property: "opacity"
                        from: 0.0
                        to: 1.0
                    }
                }

            }
        ]
    }


    ListView {
        id: listView1
        x: ScreenW*0.2
        y: ScreenH/4
        width: ScreenW*0.32
        height: ScreenH/2
        delegate: Item {
            width: ScreenW/2
            height: listView1.height/listView1.count
                Text {
                    color: "black"
                    text: name
                    font.pointSize: ScreenH/28
                    anchors.verticalCenter: parent.verticalCenter
                    font.bold: true
                }
                opacity: (listView1.currentIndex >= index ) ? 1.0: 0.0
                Behavior on opacity {
                    NumberAnimation {
                        duration: 1000
                    }
                }

        }
        focus: true
        Keys.onUpPressed: {
            decrementCurrentIndex()
        }
        Keys.onDownPressed: {
             incrementCurrentIndex()
        }
        onCurrentIndexChanged: {
            trigger.start()
        }

        Timer {
             id: trigger
             interval: 1001
             repeat: false
             onTriggered: app.currentItemChanged(view.currentItem)
         }
        model: ListModel {
            ListElement {
                name: "Messagerie Instantanée"
                index: 0
            }
            ListElement {
                name: "Lancer des dés"
                index: 1
            }
            ListElement {
                name: "Notes"
                index: 2
            }
            ListElement {
                name: "Dessiner et partage de plans"
                index: 3
            }
            ListElement {
                name: "Partage d'images"
                index: 4
            }
            ListElement {
                name: "Musique d'ambiance"
                index: 5
            }
        }
    }

}
