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
        width: 400
        height: 215
        anchors.horizontalCenterOffset: -760
        anchors.topMargin: 0
        fillMode: Image.PreserveAspectFit
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
        source: "qrc:/rsrc/Rolisteam.svg"
    }

    Text {
        id: text1
        anchors.top:image1.bottom
        anchors.horizontalCenter: parent.horizontalCenter

        width: 833
        height: 191
        color: "black"
        text: qsTr("Les raisons l'engagement")
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
        x: 454
        y: 342
        width: 958
        height: 690
        spacing: 40
        delegate: Item {
            x: 5
            width: 80
            height: 40
            Row {
                id: row1
                Text {
                    color: "black"
                    text: name
                    font.pointSize: Screen.height/28
                    anchors.verticalCenter: parent.verticalCenter
                    font.bold: true
                }
                spacing: 40
            }
        }
        model: ListModel {
            ListElement {
                name: "Me Former"
            }
            ListElement {
                name: "Être créatif"
            }
            ListElement {
                name: "Prouver que j'en suis capable."
            }
        }
    }
}
