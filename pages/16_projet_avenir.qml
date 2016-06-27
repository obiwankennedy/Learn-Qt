import QtQuick 2.0
import QtQuick.Window 2.2

Rectangle {
    id: futurproject
    width: ScreenW
    height: ScreenH
    //    height: 600
    //  anchors.centerIn: parent
    border.color: "#E3E3E3"
    border.width: 5
    color: "#E3E3E3"
    property int idState: 0

    focus: true
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
        text: qsTr("Dans l'avenir")
        anchors.horizontalCenterOffset: 1
        font.family: "Verdana"
        font.bold: true
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: ScreenH/20
    }
    Image {
        id: mindmap
        anchors.left:image1.right
        anchors.leftMargin: -ScreenW*0.1
        anchors.top: image1.bottom
 //       anchors.topMargin: ScreenW*0.1
        width: ScreenW*0.8
        height: ScreenH*0.8
        opacity: (futurproject.idState == 4 ) ? 1.0: 0.0
        Behavior on opacity {
            NumberAnimation {
                duration: 1000
            }
        }
        source: "qrc:/rsrc/mindmap.svg"
    }
    Keys.onUpPressed: {
        --idState

    }
    Keys.onDownPressed: {
        ++idState
    }
    onIdStateChanged: {
        trigger.start()
    }

    Timer {
         id: trigger
         interval: 1001
         repeat: false
         onTriggered: app.currentItemChanged(view.currentItem)
     }
    ListView {
        id: listView1
        x: ScreenW/4
        y: ScreenH/4
        visible: idState != 4 ? true : false
        //spacing: ScreenH*0.1
        width: ScreenW*0.4
        height: ScreenH*0.4
        delegate: Item {
            width: ScreenW/2
            height: listView1.height/listView1.count
                Text {
                    color: "black"
                    text: name
                    font.pointSize: ScreenH/28
                    anchors.verticalCenter: parent.verticalCenter
                    font.bold: index=== 0 ? true : false
                }
                opacity: (futurproject.idState >= index ) ? 1.0: 0.0
                Behavior on opacity {
                    NumberAnimation {
                        id: bouncebehavior
                        duration: 1000
                    }
                }
        }
        model: ListModel {
            ListElement {
                name: "Fonctionnalités"
                index:0
            }
            ListElement {
                name: "Serveur Dédié"
                index:1
            }
            ListElement {
                name: "Partage de notes"
                index:2
            }
            ListElement {
                name: "Mindmap"
                index:3
            }
            ListElement {
                name: "Gestion de jeu de cartes"
                index:5
            }
        }
    }
    ListView {
        id: listView2
        anchors.left: listView1.right
        anchors.top: listView1.top
        anchors.bottom: listView1.bottom

        //spacing: ScreenH*0.1
        width: ScreenW*0.3
        height: ScreenH/2
        visible: idState != 4 ? true : false

        delegate: Item {
            width: ScreenW/2
            height: listView2.height/listView2.count
                Text {
                    color: "black"
                    text: name
                    font.pointSize: ScreenH/28
                    anchors.verticalCenter: parent.verticalCenter
                    font.bold: index=== 0 ? true : false
                }
                opacity: (futurproject.idState >= index ) ? 1.0: 0.0
                Behavior on opacity {
                    NumberAnimation {
                        id: bouncebehavior2
                        duration: 1000
                    }
                }
        }
        model: ListModel {
            ListElement {
                name: "Fonctionnement"
                index:0
            }
            ListElement {
                name: "GUI pour écran tactile"
                 index:6
            }
            ListElement {
                name: "Portage Android/iOS"
                 index:7
            }
            ListElement {
                name: "Sécurité & chiffrage"
                 index:8
            }
            ListElement {
                name: "Accessibilité"
                 index:9
            }
        }
    }
}
