import QtQuick 2.0
import QtQuick.Window 2.2

Rectangle {
    id: rectangle1
    width: ScreenW
    height: ScreenH
    property int idState: 0
    border.color: "#E3E3E3"
    border.width: 5
    color: "#E3E3E3"
    state: ""
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
        //anchors.horizontalCenter: parent.horizontalCenter
        anchors.left: image1.right
        anchors.bottom: image1.bottom
        //width: ScreenW*0.5
        anchors.right: parent.right
        height: ScreenH*0.01
        color: "black"
        text: qsTr("DiceParser: Le système de dés")
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
        if(idState==6)
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
                opacity: (rectangle1.idState >= index ) ? 1.0: 0.0
                Behavior on opacity {
                    NumberAnimation {
                        duration: 1000
                    }
                }
        }
        model: ListModel {
            ListElement {
                name: "Interpreteur de commandes"
                index: 0
            }
            ListElement {
                name: "Client: Rolisteam, IRC Bot, CLI"
                index: 1
            }
            ListElement {
                name: "Simple et puissant"
                index: 2
            }

        }
        opacity: (rectangle1.idState < 3 ) ? 1.0: 0.0
    }

    Text {
        id: panelInfo
        x: ScreenW/4
        anchors.top: image1.bottom
        //height: parent.height*0.3
        font.pointSize: ScreenH/50
        text: "Lancer N dés à 10 faces allant de 0 à 9<br/> Garder les M plus bas <br/>compter parmis les M ceux qui sont inférieurs ou égaux à P"
        opacity: (rectangle1.idState >= 3 ) ? 1.0: 0.0
        Behavior on opacity {
            NumberAnimation {
                duration: 1000
            }
        }
    }
    /*
    ListElement{
        name: "!6d[0-9]kl3c[<=4]"
    }y*/
Text {
        id: panelInfo2
        anchors.left: panelInfo.left
        anchors.top: panelInfo.bottom
        anchors.right: panelInfo.right
        //height: parent.height*0.3
        font.pointSize: ScreenH/50
        text: "(.*)day(.*),(.*) => \\1d[0-9]kl\\2c[<=\\3]"
        opacity: (rectangle1.idState >= 4 ) ? 1.0: 0.0
        Behavior on opacity {
            NumberAnimation {
                duration: 1000
            }
        }
    }
    Image {
        id: img
        anchors.top: panelInfo2.bottom
        anchors.left: listView1.left
        fillMode: Image.PreserveAspectFit
        anchors.right: listView1.right
        source: "qrc:/rsrc/ddaydice.png"
        opacity: (rectangle1.idState >= 5 ) ? 1.0: 0.0
        Behavior on opacity {
            NumberAnimation {
                duration: 1000
            }
        }
    }

}
