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
    focus: true
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
                name: "Interpreteur de commande"
            }
            ListElement {
                name: "Indépendant"
            }
            ListElement {
                name: "Client: Rolisteam, IRC Bot, CLI"
            }
            ListElement {
                name: "Exemples:"
            }
        }
    }
    Keys.onDownPressed: {
        console.log("down"+rectangle1.state)
        if(rectangle1.state=="")
        {
            rectangle1.state="rolisteam"
        }
        else if( rectangle1.state === "rolisteam")
        {
            rectangle1.state="irc"
        }
        else if( rectangle1.state ==="irc")
        {
            rectangle1.state="cli"
        }
        else if(state === "cli")
        {
            rectangle1.state=""
        }
        console.log("fin down")
    }
    Keys.onUpPressed: {
        console.log("up")
        if(rectangle1.state==="")
        {
            rectangle1.state="cli"
        }
        else if( rectangle1.state === "cli")
        {
            rectangle1.state="irc"
        }
        else if( rectangle1.state ==="irc")
        {
            rectangle1.state="rolisteam"
        }
        else if(rectangle1.state === "rolisteam")
        {
            rectangle1.state=""
        }
        console.log("fin up")
    }
    states: [
         State {
             name: ""
             PropertyChanges { target: img; visible: false }
         },
         State {
             name: "rolisteam"
            PropertyChanges { target: img; visible: true }
         },
        State {
            name: "irc"
           PropertyChanges { target: img; visible: true }
        },
        State {
            name: "cli"
           PropertyChanges { target: img; visible: true }
        }
     ]
    transitions: [
        Transition {
            from: "*"
            to: "*"
            SequentialAnimation
            {
                NumberAnimation {
                    target: img
                    property: "opacity"
                    duration: 400
                    to: 0.0
                    easing.type: Easing.InOutQuad
                }
                PropertyAction {
                    target: img
                    property: "idImage"
                    value: idState
                }
                NumberAnimation {
                    target: img
                    property: "opacity"
                    duration: 400
                    to: 1.0
                    easing.type: Easing.InOutQuad
                }

            }

        }
    ]
    Image {
        id: img
        anchors.top: listView1.bottom
        anchors.left: listView1.left
        fillMode: Image.PreserveAspectFit
        anchors.right: listView1.right
        visible: false
        property string idImage: rectangle1.state
        onIdImageChanged: {
           if(rectangle1.state === "rolisteam")
           {
                source ="qrc:/rsrc/diceColor.png"
           }
           else if(rectangle1.state  ==="irc")
           {
               source="qrc:/rsrc/ircDice.png"
           }
           else if(rectangle1.state === "cli")
           {
               source ="qrc:/rsrc/cliDice.png"
           }
           else
           {
               source = ""
           }
        }

       // PropertyAnimation on source { duration: 200 }
    }

}
