import QtQuick 2.5
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
        text: qsTr("Évolution du code")
        anchors.horizontalCenterOffset: 1
        font.family: "Verdana"
        font.bold: true
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: ScreenH/20
    }
    Image {
        id: image2
        anchors.left: parent.left
        anchors.leftMargin: ScreenW*0.02
        anchors.verticalCenter: parent.verticalCenter
        fillMode: Image.PreserveAspectFit
        source: "qrc:/rsrc/rolistik.png"
        width: ScreenW*0.3
        height: ScreenH*0.8
    }
    Image {
        id: image3
        anchors.left: image2.right
        anchors.verticalCenter: parent.verticalCenter
        fillMode: Image.PreserveAspectFit
        anchors.leftMargin: ScreenW*0.02
        source: "qrc:/rsrc/Rolisteam1.png"
        width: ScreenW*0.3
    }
    Image {
        id: image4
        anchors.left: image3.right
        fillMode: Image.PreserveAspectFit
        anchors.verticalCenter: parent.verticalCenter
        anchors.leftMargin: ScreenW*0.02
        source: "qrc:/rsrc/Rolisteam1.8.png"
        width: ScreenW*0.3
    }

}
