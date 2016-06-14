import QtQuick 2.0
import QtQuick.Window 2.2
import QtQuick.Controls 1.4
import QtQuick.Extras 1.4
import QtQuick.Layouts 1.2


Rectangle {
    id: rectangle1
  //  property int  ScreenW: 1024
    //property int  ScreenH: 800
    width: ScreenW
    height: ScreenH
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
        text: qsTr("Comment ça marche ?")
        anchors.horizontalCenterOffset: 1
        //anchors.topMargin: -203
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
        height: ScreenH/2.2
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
                name: "Application Client/Serveur"
            }
            ListElement {
                name: "Un utilisateur avec des droits particuliers: le MJ"//système de build, code spécifique par OS.
            }
            ListElement {
                name: "4 cas de figure: MJ, Joueur, Client ou Serveur"
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
        width: ScreenW/2
        //height: ScreenH/2
        anchors.left: listView1.left
        anchors.top: listView1.bottom
        anchors.bottom: parent.bottom
        model:codeData
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
