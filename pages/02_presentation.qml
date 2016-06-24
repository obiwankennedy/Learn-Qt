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
        height: ScreenH*0.05
        color: "black"
        text: qsTr("Présentation Rolisteam")
        anchors.horizontalCenterOffset: 1
        //anchors.topMargin: -203
        font.family: "Verdana"
        font.bold: true
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: ScreenH/20
    }

    Image {
        id: screenShot
        source : "qrc:/rsrc/rolisteamScreen1.8.png"
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: ScreenW*0.1

        fillMode: Image.PreserveAspectFit
        width: ScreenW*0.7
        height: ScreenH*0.7
        visible: true
        opacity: 0.4
    }
   /* Keys.onDownPressed: {
        if(idState === 3)
        {
            idState =0;
        }
        else
        {
            idState+=1;
        }

    }
    Keys.onUpPressed: {
        if(idState===0)
        {
            idState=3
        }
        else
        {
            idState-=1
        }
    }
    states: [
        State {
            name: ""
            when: idState== 0
            PropertyChanges {
                target: listView1
                visible: true
            }
            PropertyChanges {
                target: screenShot
                visible: false
            }
        },
        State {
            name: "ScreenShot"
            when: idState== 1
            PropertyChanges {
                target: listView1
                visible: false
            }
            PropertyChanges {
                target: screenShot
                visible: true
            }
        }
    ]*/
}
