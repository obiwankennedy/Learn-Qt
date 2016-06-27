import QtQuick 2.0
import QtQuick.Window 2.2
import QtQuick.Controls 1.4
import QtQuick.Extras 1.4
import QtQuick.Layouts 1.2


Rectangle {
    id: howitwork
    width: ScreenW
    height: ScreenH
    property int idState : 0
    border.color: "#E3E3E3"
    border.width: 5
    color: "#E3E3E3"
    property alias listView1: listView1
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
        text: qsTr("Son fonctionnement ?")
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
        y: ScreenH/8
        width: ScreenW/2
        height: ScreenH/3
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
            opacity: (howitwork.idState >= index ) ? 1.0: 0.0
            Behavior on opacity {
                NumberAnimation {
                    id: bouncebehavior
                    duration: 1000
                }
            }
        }

        model: ListModel {
            ListElement {
                name: "Application Client/Serveur TCP/IP"
                index: 0
            }
            ListElement {
                name: "Application MDI"
                index: 1
            }
            ListElement {
                name: "C++/Qt"
                index:2
            }
        }
    }
    ListModel {
        id: codeData
        ListElement {
            Language: "C++"
            files: 153
            comment: 4634
            code: 33169
        }
        ListElement {
            Language: "C/C++ Header"
            files: 149
            comment: 8586
            code: 6664
        }
        ListElement {
            Language: "Bourne Shell"
            files: 11
            comment: 244
            code: 431
        }
        ListElement {
            Language: "IDL"
            files: 4
            comment: 0
            code: 339
        }
        ListElement {
            Language: "QML"
            files: 9
            comment: 2
            code: 297
        }
        ListElement {
            Language: "CMake"
            files: 3
            comment: 12
            code: 112
        }
        ListElement {
            Language: "Python"
            files: 1
            comment: 12
            code: 61
        }
        ListElement {
            Language: "make"
            files: 1
            comment: 24
            code: 15
        }
        ListElement {
            Language: "Somme"
            files: 331
            comment: 13513
            code: 41088
        }
    }
    TableView {
        //width: ScreenW/2
        //height: ScreenH/2
        anchors.left: listView1.left
        anchors.right:listView1.right
        anchors.top: listView1.bottom
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 100
        model:codeData
        opacity: (idState >= 3 ) ? 1.0: 0.0
        Behavior on opacity {
            NumberAnimation {
                duration: 1000
            }
        }
        TableViewColumn {
            role: "Language"
            title: "Language"
            width: ScreenW/8.01
        }
        TableViewColumn {
            role: "files"
            title: "Fichiers"
            horizontalAlignment: Text.AlignRight
            width: ScreenW/8.01
        }
        TableViewColumn {
            role: "comment"
            title: "Commentaire"
            horizontalAlignment: Text.AlignRight
            width: ScreenW/8.01
        }
        TableViewColumn {
            role: "code"
            title: "Code"
            horizontalAlignment: Text.AlignRight
            width: ScreenW/8.01
        }
    }
}
