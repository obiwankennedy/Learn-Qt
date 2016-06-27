import QtQuick 2.0
import QtQuick.Window 2.2
import QtQuick.Controls 1.4
import QtQuick.Extras 1.4
import QtQuick.Layouts 1.2


Rectangle {
    id: usage
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
        height: ScreenH*0.01
        color: "black"
        text: qsTr("Son usage ?")
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
        --idState;
        if(idState==-1)
        {
            idState=0;
        }
    }
    Keys.onDownPressed: {
        ++idState;
        if(idState==3)
        {
            idState=1;
        }
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
            opacity: (usage.idState >= index ) ? 1.0: 0.0
            Behavior on opacity {
                NumberAnimation {
                    id: bouncebehavior
                    duration: 1000
                }
            }
        }

        model: ListModel {
            ListElement {
                name: "4 cas de figure: MJ, Joueur, Client ou Serveur"
                index: 1
            }
            ListElement {
                name: "Le MJ: permission"//système de build, code spécifique par OS.
                index: 2
            }
        }
        opacity: (usage.idState > 0 ) ? 1.0: 0.0
        Behavior on opacity {
            NumberAnimation {
                duration: 1000
            }
        }
    }
    Image {
        x: ScreenW/4
        y: ScreenH/4
        width: ScreenW/2
        height: ScreenH*0.7
        fillMode: Image.PreserveAspectFit

        source: "qrc:/rsrc/entree.png"
        opacity: (usage.idState == 0 ) ? 1.0: 0.0
        Behavior on opacity {
            NumberAnimation {
                duration: 1000
            }
        }
    }
   /* Image {
        anchors.top: listView1.top
        anchors.bottom: listView1.bottom
        anchors.left: listView1.right
        source: "qrc:/rsrc/entree.png"
        opacity: (usage.idState >= 0 ) ? 1.0: 0.0
        Behavior on opacity {
            NumberAnimation {
                duration: 1000
            }
        }
    }*/
}
