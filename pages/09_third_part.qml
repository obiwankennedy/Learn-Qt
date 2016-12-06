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
                name: "Étude de la fonction: closeMapOrImage"
            }
            ListElement {
                name: "Récupération de l'id courant"
            }
            ListElement {
                name: "C'est une image ou une carte"
            }
            ListElement {
                name: "Suppression de la fenêtre"
            }
            ListElement {
                name: "Fermeture chez les autres joueurs."
            }
        }
    }
    Keys.onDownPressed: {
        if(state == "")
        {
            state="media"
        }
        else if(state=="media")
        {
            state ="network";
        }
        else if(state=="network")
        {
            state ="";
        }
    }


    states: [
        State {
            name: ""
            PropertyChanges {
                target: listView1
                visible: true
            }
            PropertyChanges {
                target: idMedia
                visible: false
            }
        },
        State {
            name: "media"
            PropertyChanges {
                target: listView1
                visible: false
            }
            PropertyChanges {
                target: idMedia
                visible: true
            }
        },
        State {
            name: "network"
            PropertyChanges {
                target: listView1
                visible: false
            }
            PropertyChanges {
                target: idMedia
                visible: true
            }
            PropertyChanges {
                target: image2
                source: "qrc:/rsrc/rolistikNetwork.png"
            }
            PropertyChanges {
                target: image3
                source: "qrc:/rsrc/Rolisteam1Network.png"
            }
            PropertyChanges {
                target: image4
                source: ""
            }
        }
    ]
}
