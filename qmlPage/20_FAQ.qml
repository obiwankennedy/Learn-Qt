import QtQuick 2.0
import QtQuick.Window 2.2

Rectangle {
    id: rectangle1
    width: app.width
    height: app.height
    //    height: 600
    //  anchors.centerIn: parent
    border.color: app.bgColor
    border.width: 5
    color: app.bgColor
    property alias listView1: listView1
    property int idState: 0

    focus: true

    Image {
        id: image1
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: app.width*0.04
        fillMode: Image.PreserveAspectFit
        source: "qrc:/rsrc/Rolisteam.svg"
        width: app.width*0.2
    }

    Text {
        id: text1
        anchors.top:image1.top
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: image1.bottom

        width: app.width*0.5
        height: app.height*0.05
        color: app.txtColor
        text: qsTr("Merci, à vos questions !")
        anchors.horizontalCenterOffset: 1
        //anchors.topMargin: -203
        font.family: "Verdana"
        font.bold: true
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: app.height/20
    }

    ListView {
        id: listView1
        x: app.width*0.2
        y: app.height/4
        width: app.width/2
        height: app.height/2
        delegate: Item {
            width: app.width/2
            height: listView1.height/listView1.count
            Text {
                color: app.txtColor
                text: name
                font.pointSize: (app.height >100 ? app.height : 800)/28
                anchors.verticalCenter: parent.verticalCenter
     //           font.bold: true
            }
        }
        model: ListModel {
                ListElement {//color=\"blue\"
                    name: "<i>Site web</i>: <b>www.rolisteam.org</b>"
                    index:1
                }
                ListElement {
                    name: "<i>Courriel</i>: <b>renaud@rolisteam.org</b>"
                    index:1
                }
                ListElement {
                    name: "<i>Github</i>: <b>github.com/Rolisteam</b>"
                    index:1
                }
                ListElement {
                    name: "<i>Twitter</i>: <b>@Rolisteam</b></font>"
                    index:1
                }
                ListElement {
                    name: "<i>Facebook</i>: <b>www.facebook.com/rolisteam</b>"
                    index:1
                }
                ListElement {
                    name: "<i>Youtube</i>: https://www.youtube.com/channel/UC4uoGZl1nQRXbVs8WjxjKvw"
                    index:1
                }
                ListElement {
                    name: "<i>Irc</i>: <b>#RolisteamOfficial</b> on freenode.net"
                    index:1
                }
            }

    }

    Text {
        id: text2
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        anchors.rightMargin: app.width*0.4
        anchors.bottomMargin: 50
        color: app.txtColor
        text: qsTr("Merci à : Chewba, Hythlodée, Henriette")
    }
}
