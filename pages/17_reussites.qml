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
        text: qsTr("Les réussites")
        anchors.horizontalCenterOffset: 1
        font.family: "Verdana"
        font.bold: true
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: ScreenH/20
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
                opacity: (listView1.currentIndex >= index ) ? 1.0: 0.0
                Behavior on opacity {
                    NumberAnimation {
                        id: bouncebehavior
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
        onCurrentIndexChanged:  {
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
                name: "Multi-plateforme"
                 index: 0
            }
            ListElement {
                name: "Un acteur du domaine"
                 index: 1
            }
            ListElement {
                name: "Simple d'usage"
                 index: 2
            }
            ListElement {
                name: "Hackable"
                 index: 3
            }
            ListElement {
                name: "Un logiciel libre"
                 index: 4
            }
        }
    }
}
