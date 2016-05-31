import QtQuick 2.0
import QtQuick.Window 2.2

Rectangle {
    id: rectangle1
    width: Screen.width
    height: Screen.height
    //    height: 600
    //  anchors.centerIn: parent
    border.color: "#E3E3E3"
    border.width: 5
    color: "#E3E3E3"
    property alias listView1: listView1
    focus: true

    Image {
        id: image1
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: Screen.width*0.04
        fillMode: Image.PreserveAspectFit
        source: "qrc:/rsrc/Rolisteam.svg"
        width: Screen.width*0.2
    }

    Text {
        id: text1
        anchors.top:image1.bottom
        anchors.horizontalCenter: parent.horizontalCenter

        width: 833
        height: 191
        color: "black"
        text: qsTr("Le début de Rolisteam")
        anchors.horizontalCenterOffset: 1
        anchors.topMargin: -203
        font.family: "Verdana"
        font.bold: true
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: Screen.height/20
    }

    ListView {
        id: listView1
        x: Screen.width/4
        y: Screen.height/4
        width: Screen.width/2
        height: Screen.height/2
        delegate: Item {
            width: Screen.width/2
            height: listView1.height/listView1.count
                Text {
                    color: "black"
                    text: name
                    font.pointSize: Screen.height/28
                    anchors.verticalCenter: parent.verticalCenter
                    font.bold: true
                }
        }
        model: ListModel {
            ListElement {
                name: "Un simple dépannage"
            }
            ListElement {
                name: "Un projet libre"
            }
            ListElement {
                name: "Pourquoi avoir démarrer Rolisteam ?"//(le fork)
            }
            ListElement {
                name: "Le jeu de rôle (et en ligne)"//j'ai commencé le jdr.
            }
        }
    }
}
