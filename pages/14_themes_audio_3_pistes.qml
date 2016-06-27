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
    property alias listView1: listView1
    property int idState: 0

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
        height: ScreenH*0.05
        color: "black"
        text: qsTr("Thèmes et Audio")
        anchors.horizontalCenterOffset: 1
        //anchors.topMargin: -203
        font.family: "Verdana"
        font.bold: true
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: ScreenH/20
    }
    focus: true
    Keys.onUpPressed: {
        --idState
    }
    Keys.onDownPressed: {
        ++idState
    }
    onIdStateChanged:  {
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
            //visible: (listView1.currentIndex >= index ) ? true: false
            opacity: (rectangle1.idState >= index ) ? 1.0: 0.0
            Behavior on opacity {
                NumberAnimation {
                    id: bouncebehavior
                    duration: 1000
                }
            }
        }

        model: ListModel {
            ListElement {
                name: "Personnalisation"
                index:0
            }
            ListElement {
                name: "Audio 3 pistes"
                index:2
            }
            ListElement {
                name: "Fichier/flux distants"
                index:3
            }
        }
        opacity: (rectangle1.idState != 1 ) ? 1.0: 0.0
        Behavior on opacity {
            NumberAnimation {
                duration: 1000
            }
        }
    }
    Row {
        anchors.left:image1.right
        anchors.leftMargin: -ScreenW*0.1
        spacing: 20
        anchors.top: image1.bottom
        anchors.topMargin: ScreenW*0.1
        width: ScreenW*0.8
        height: ScreenH*0.8
        opacity: (rectangle1.idState == 1 ) ? 1.0: 0.0
        Behavior on opacity {
            NumberAnimation {
                duration: 1000
            }
        }
        Image {
            fillMode: Image.PreserveAspectFit
            source:"qrc:/rsrc/music_screen.jpg"
            width: parent.width*0.5
        }
        Image {
            fillMode: Image.PreserveAspectFit
            source:"qrc:/rsrc/darkfusiontheme.jpg"
            width: parent.width*0.5
        }
    }
}
