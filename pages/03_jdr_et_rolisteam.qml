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
        text: qsTr("Rolisteam et le jdr")
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
        }
        model: ListModel {
            ListElement {
                name: "Le JDR, c'est quoi ?"
            }
            ListElement {
                name: "Comment se passe une partie ?"
            }
            ListElement {
                name: "Jouer en ligne ?"
            }
        }
    }

    Keys.onDownPressed: {
            if(state == "")
            {
                state="simple"
            }
            else if(state=="simple")
            {
                state ="";
            }
        }
        Text {
            id: panelInfo
            //anchors.horizontalCenter: parent.horizontalCenter
            /*anchors.bottom: parent.bottom
            anchors.bottomMargin: 20*/
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.bottomMargin: ScreenH*0.1
            horizontalAlignment: Text.AlignHCenter
            width: parent.width*0.8
            //height: parent.height*0.3
            font.pointSize: ScreenH/50
            text: "«<i>Le jeu de rôle est un jeu de société dans lequel les participants <br/>conçoivent ensemble une fiction par l’interprétation de rôles et par la narration,<br/> dans le cadre de contraintes de jeu qu’ils s’imposent.</i>»<br/>   -Wikipedia"
            visible: false
        }
        states: [
            State {
                name: "simple"
                PropertyChanges {
                    target: panelInfo
                    visible: true
                }
            }
        ]
}
