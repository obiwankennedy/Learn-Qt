import QtQuick 2.0
import QtQuick.Window 2.2

Rectangle {
    id: tiktoteam
    width: ScreenW
    height: ScreenH
    //    height: 600
    //  anchors.centerIn: parent
    border.color: "#E3E3E3"
    border.width: 5
    color: "#E3E3E3"
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
        height: ScreenH*0.01
        color: "black"
        text: qsTr("De Rolistik à Rolisteam")
        anchors.horizontalCenterOffset: 1
        //anchors.topMargin: -203
        font.family: "Verdana"
        font.bold: true
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: ScreenH/20
    }    
    Keys.onUpPressed: {
        --idState
        console.log(idState)

    }
    Keys.onDownPressed: {
        ++idState
        console.log(idState)

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
        x: ScreenW*0.2
        y: ScreenH*0.20
        width: ScreenW*0.28
        height: ScreenH*0.38
        spacing: ScreenH*0.05
        visible: (tiktoteam.idState === 0 || tiktoteam.idState > 2) ? true : false
        delegate: Item {
            width:  ScreenW*0.35
            height: listView1.height/(listView1.count*2)
                Text {
                    color: "black"
                    text: name
                    font.pointSize: ScreenH*0.025
                    anchors.top: parent.top
                    //anchors.verticalCenter: parent.verticalCenter
                    font.bold: true
                }
                opacity: (tiktoteam.idState >= index ) ? 1.0: 0.0
                Behavior on opacity {
                    NumberAnimation {
                        id: bouncebehavior
                        //to: 1.0
                        duration: 1000
                    }
                }

        }
        model: ListModel {
            ListElement {
                name: "Code mal architecturé"
                index: 0
            }
            ListElement {
                name: "Incompatibilité GNU/Linux"//système de build, code spécifique par OS.
                index: 4
            }
            ListElement {
                name: "Fmod: Licence et 64bits"
                index: 6
            }
            ListElement {
                name: "Code Source en français"
                index: 8
            }
            ListElement {
                name: "Aucun Standard"
                index: 10
            }
        }
    }

    ListView {
        id: listView2
        anchors.left: listView1.right
        anchors.top: listView1.top
        anchors.bottom: listView1.bottom
        width: ScreenW*0.35
        height: ScreenH*0.4
        spacing: ScreenH*0.05
        visible: (tiktoteam.idState === 0 || tiktoteam.idState > 2) ? true : false
        delegate: Item {
            width:  ScreenW*0.40
            height: listView2.height/(listView2.count*2)
            Canvas {
                id: frise
                anchors.left: parent.left

                height: parent.height
                width: parent.width*0.2
                onPaint : {
                    var heightOfArrow = height/4
                    var lineW = 2
                    var ctx = getContext("2d")
                    //ctx.fillStyle = Qt.rgba(0, 0, 0, 1);
                    //ctx.lineWidth = lineW;
                    ctx.beginPath()
                    ctx.moveTo(0,heightOfArrow)
                    ctx.lineTo(frise.width-20,heightOfArrow)
                    ctx.lineTo(frise.width-20,0)
                    ctx.lineTo(frise.width,frise.height/2)
                    ctx.lineTo(frise.width-20,frise.height)
                    ctx.lineTo(frise.width-20,frise.height-heightOfArrow)
                    ctx.lineTo(0,frise.height-heightOfArrow)
                    ctx.closePath()
                    //ctx.stroke();


                    var gradient = ctx.createLinearGradient(0, 0, frise.width, frise.height);
                    var hslValue = 0;
                    var hslStep = 1.0/8
                    for(var i = 0; i<8;++i)
                    {
                        gradient.addColorStop(i*hslStep, Qt.hsla(0.6, hslValue, 0.3, 1.0));
                        hslValue+=hslStep
                    }
                    ctx.fillStyle = gradient
                    ctx.fill();

                    ctx.fillStyle = "white"
                }
            }
            Text {
                color: "black"
                text: name
                font.pointSize: ScreenH*0.025
                anchors.left: frise.right
                anchors.leftMargin: frise.width
                anchors.top: parent.top
                //anchors.verticalCenter: parent.verticalCenter
               // verticalAlignment: Text.AlignVCenter

                font.bold: true

            }
            opacity: (tiktoteam.idState >= index ) ? 1.0: 0.0
            Behavior on opacity {
                NumberAnimation {
                    id: bouncebehavior2
                    //to: 1.0
                    duration: 1000
                }
            }
        }

        model: ListModel {
            ListElement {
                name: "POO et Structuration"
                index: 3
            }
            ListElement {
                name: "Support de GNU/Linux"
                index: 5
            }
            ListElement {
                name: "Remise à plat: Audio"
                index: 7
            }
            ListElement {
                name: "i18n"
                index: 9
            }
            ListElement {
                name: "Racourcis, Préférences, drag&drop…"
                index: 11
            }
        }
    }


    Row {
        id: idMedia
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.horizontalCenterOffset: 55
        height: ScreenH*0.6
        opacity: tiktoteam.idState == 1 ? 1.0 : 0.0
        spacing: ScreenH*0.05
        Column {
            Text {
                id: text2
                text: "Rolistik"
            }
            Image {
                id: image2
                fillMode: Image.PreserveAspectFit
                source: "qrc:/rsrc/getIdmediaRolistik.png"
            }
        }
      /*  Column {
            Text {
                id: text3
                text: "Rolisteam 1.6"
            }
            Image {
                id: image3
                fillMode: Image.PreserveAspectFit
                source: "qrc:/rsrc/getIdRolisteam1.png"
                horizontalAlignment: Image.AlignLeft
                width: ScreenW*0.3
            }
        }*/
        Column {
            Text {
                id: text4
                text: "Rolisteam 1.8"
                width: ScreenW*0.3
            }
            Image {
                id: image4
                fillMode: Image.PreserveAspectFit
                source: "qrc:/rsrc/getIdRolisteam1.8.png"
                horizontalAlignment: Image.AlignLeft
                width: ScreenW*0.3
            }
        }

    }
    Row {
        id: idNetwork
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.horizontalCenterOffset: 55
        height: ScreenH*0.6
        opacity: tiktoteam.idState == 2 ? 1.0 : 0.0
        spacing: ScreenH*0.05
        Column {
            Text {
                id: text5
                text: "Rolistik"
            }
            Image {
                id: image5
                fillMode: Image.PreserveAspectFit
                source: "qrc:/rsrc/rolistikNetwork.png"
            }
        }
        Column {
            Text {
                id: text6
                text: "Rolisteam 1.7"
            }
            Image {
                id: image6
                fillMode: Image.PreserveAspectFit
                source: "qrc:/rsrc/Rolisteam1Network.png"
                horizontalAlignment: Image.AlignLeft
                width: ScreenW*0.3
            }
        }
    }
}
