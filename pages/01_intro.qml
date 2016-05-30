import QtQuick 2.0
import QtQuick.Window 2.2

Rectangle {
    id: rectangle1
    width: Screen.width
    height: Screen.height
    //    height: 600
    //  anchors.centerIn: parent
    border.width: 0
    color: "#E3E3E3"

    Image {
        id: image1
        width: Screen.width*0.75
        height: Screen.height*0.75
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
        text: qsTr("Libérez vos parties!")
        font.family: "Verdana"
        font.bold: true
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: Screen.height/20
    }

    Text {
        id: text2
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        text: qsTr("Renaud Guezennec")
        font.pixelSize: Screen.height/25
    }

    Image {
        id: image2
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.leftMargin: 100
        width: 100
        height: 100
        fillMode: Image.PreserveAspectFit
        source: "qrc:/rsrc/cc.png"
    }
}
