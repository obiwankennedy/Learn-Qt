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
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter:  parent.verticalCenter

        width: ScreenW*0.9
        height: ScreenH*0.9
        source: "qrc:/rsrc/mindmap.svg"
        visible: false
    }

    ListView {
        id: listView1
        x: ScreenW/4
        y: ScreenH/4
        width: ScreenW/2
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
        }
        model: ListModel {
            ListElement {
                name: "Serveur Dédié"
            }
            ListElement {
                name: "Partage de notes"
            }
            ListElement {
                name: "Mindmap"
            }
            ListElement {
                name: "Refonte GUI pour écran tactile"
            }
            ListElement {
                name: "Portage Android/iOS"
            }
            ListElement {
                name: "Gestion de jeu de cartes"
            }
        }
    }
    Keys.onDownPressed: {
        if(state === "")
        {
            state = "mindmap"
        }
        else
        {
            state = ""
        }
    }
    states: [
        State {
            name: ""
            PropertyChanges {
                target: listView1
                visible: true

            }
            PropertyChanges {
                target: mindmap
                visible:false

            }
       },
        State {
            name: "mindmap"
            PropertyChanges {
                target: mindmap
                visible: true

            }
            PropertyChanges {
                target: listView1
                visible: false

            }
        }

    ]
}
