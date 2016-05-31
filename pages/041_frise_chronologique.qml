import QtQuick 2.0
import QtQuick.Window 2.2
import QtQuick.Controls 1.3
import QtQuick.Extras 1.4
import QtWebView 1.1

Rectangle {
    id: rectangle1
    width: Screen.width
    height: Screen.height
    //    height: 600
    //  anchors.centerIn: parent
    border.color: "#E3E3E3"
    border.width: 5
    color: "#E3E3E3"

    Image {
        id: image1
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: Screen.width*0.04
        fillMode: Image.PreserveAspectFit
        source: "qrc:/rsrc/Rolisteam.svg"
        width: Screen.width*0.2
    }

    Text {
        id: text1
        anchors.top:image1.bottom
        anchors.horizontalCenter: parent.horizontalCenter

        width: Screen.width/6
        height: 191
        color: "black"
        text: qsTr("La chronologie")
        anchors.horizontalCenterOffset: 1
        anchors.topMargin: -203
        font.family: "Verdana"
        font.bold: true
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: Screen.height/20
    }

    Canvas {
        id: frise
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: -200
        height: Screen.height/4
        onPaint : {
            var heightOfArrow = Screen.height/20
            var lineW = 4
            var ctx = getContext("2d")
            //ctx.fillStyle = Qt.rgba(0, 0, 0, 1);
            //ctx.lineWidth = lineW;
            ctx.beginPath()
            ctx.moveTo(0,heightOfArrow)
            ctx.lineTo(frise.width-200,heightOfArrow)
            ctx.lineTo(frise.width-200,0)
            ctx.lineTo(frise.width,frise.height/2)
            ctx.lineTo(frise.width-200,frise.height)
            ctx.lineTo(frise.width-200,frise.height-heightOfArrow)
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

            //var arcValue = ctx.arc(10,frise.height/2,0,2*Math.PI);


        }
    }
    Rectangle {//24 janvier 2009
        id: date1
        x: 0.08*Screen.width/8
        anchors.verticalCenter: frise.verticalCenter
        anchors.verticalCenterOffset: 0
        width: Screen.width/50
        height: Screen.width/50
        radius: Screen.width/25
        property int index: 0
        scale: listView1.currentIndex === index ? 1.2 : 1.0
        visible: listView1.currentIndex >= index ? true : false
        Text {
            text: (parent.index+1).toString()
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            color: "black"
            anchors.fill:parent
            font.bold: true
                        font.pixelSize: Screen.height/50
        }
        border.width: 5
        border.color: "black"
        color: listView1.currentIndex === index ? "lightsteelblue" : "gray"
    }
    Rectangle {
        x: 0.9*Screen.width/8
        anchors.verticalCenter: frise.verticalCenter
        anchors.verticalCenterOffset: -frise.height/4
        width: Screen.width/50
        height: Screen.width/50
        radius: Screen.width/25
        property int index: 1
        scale: listView1.currentIndex === 1 ? 1.2 : 1.0
        visible: listView1.currentIndex >= 1 ? true : false
        Text {
            text: (parent.index+1).toString()
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            color: "black"
            anchors.fill:parent
            font.bold: true
                        font.pixelSize: Screen.height/50
        }
        border.width: 5
        border.color: "black"
        color: listView1.currentIndex === index ? "lightsteelblue" : "gray"
    }
    Rectangle {//10 janvier 2010
        x: 1*Screen.width/8+0.02*Screen.width/8
        anchors.verticalCenter: frise.verticalCenter
        anchors.verticalCenterOffset: -frise.height/4 + Screen.width/50
        width: Screen.width/50
        height: Screen.width/50
        radius: Screen.width/25
        property int index: 2
        scale: listView1.currentIndex === index ? 1.2 : 1.0
        visible: listView1.currentIndex >= index ? true : false
        Text {
            text: (parent.index+1).toString()
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            color: "black"
            anchors.fill:parent
            font.bold: true
                        font.pixelSize: Screen.height/50
        }
        border.width: 5
        border.color: "black"
        color: listView1.currentIndex === index ? "lightsteelblue" : "gray"
    }
    Rectangle {
        x: 1*Screen.width/8+0.08*Screen.width/8
        anchors.verticalCenter: frise.verticalCenter
        anchors.verticalCenterOffset: -frise.height/4 + 2*Screen.width/50
        width: Screen.width/50
        height: Screen.width/50
        radius: Screen.width/25
        property int index: 3
        scale: listView1.currentIndex === index ? 1.2 : 1.0
        visible: listView1.currentIndex >= index ? true : false
        Text {
            text: (parent.index+1).toString()
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            color: "black"
            anchors.fill:parent
            font.bold: true
                        font.pixelSize: Screen.height/50
        }
        border.width: 5
        border.color: "black"
        color: listView1.currentIndex === index ? "lightsteelblue" : "gray"
    }
    Rectangle {
        x: 1*Screen.width/8+0.11*Screen.width/8
        anchors.verticalCenter: frise.verticalCenter
        anchors.verticalCenterOffset: -frise.height/4 + 3*Screen.width/50
        width: Screen.width/50
        height: Screen.width/50
        radius: Screen.width/25
        property int index: 4
        scale: listView1.currentIndex === index ? 1.2 : 1.0
        visible: listView1.currentIndex >= index ? true : false
        Text {
            text: (parent.index+1).toString()
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            color: "black"
            anchors.fill:parent
            font.bold: true
                        font.pixelSize: Screen.height/50
        }
        border.width: 5
        border.color: "black"
        color: listView1.currentIndex === index ? "lightsteelblue" : "gray"
    }
    Rectangle {
        x: 1*Screen.width/8+0.8*Screen.width/8
        anchors.verticalCenter: frise.verticalCenter
        anchors.verticalCenterOffset: 0
        width: Screen.width/50
        height: Screen.width/50
        radius: Screen.width/25
        property int index: 5
        scale: listView1.currentIndex === index ? 1.2 : 1.0
        visible: listView1.currentIndex >= index ? true : false
        Text {
            text: (parent.index+1).toString()
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            color: "black"
            anchors.fill:parent
            font.bold: true
                        font.pixelSize: Screen.height/50
        }
        border.width: 5
        border.color: "black"
       color: listView1.currentIndex === index ? "lightsteelblue" : "gray"
    }
    Rectangle {//22 octobre 2011
        x: 2*Screen.width/8+0.7*Screen.width/8
        anchors.verticalCenter: frise.verticalCenter
        anchors.verticalCenterOffset: -frise.height/4
        width: Screen.width/50
        height: Screen.width/50
        radius: Screen.width/25
        property int index: 6
        scale: listView1.currentIndex === index ? 1.2 : 1.0
        visible: listView1.currentIndex >= index ? true : false
        Text {
            text: (parent.index+1).toString()
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            color: "black"
            anchors.fill:parent
            font.bold: true
                        font.pixelSize: Screen.height/50
        }
        border.width: 5
        border.color: "black"
       color: listView1.currentIndex === index ? "lightsteelblue" : "gray"
    }
    Rectangle {//26 octobre 2011
        x: 2*Screen.width/8+0.75*Screen.width/8
        anchors.verticalCenter: frise.verticalCenter
        anchors.verticalCenterOffset: -frise.height/4+Screen.width/50
        width: Screen.width/50
        height: Screen.width/50
        radius: Screen.width/25
        property int index: 7
        scale: listView1.currentIndex === index ? 1.2 : 1.0
        visible: listView1.currentIndex >= index ? true : false
        Text {
            text: (parent.index+1).toString()
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            color: "black"
            anchors.fill:parent
            font.bold: true
                        font.pixelSize: Screen.height/50
        }
        border.width: 5
        border.color: "black"
       color: listView1.currentIndex === index ? "lightsteelblue" : "gray"
    }
    Rectangle {//30 octobre 2011
        x: 2*Screen.width/8+0.78*Screen.width/8
        anchors.verticalCenter: frise.verticalCenter
        anchors.verticalCenterOffset: -frise.height/4+2*Screen.width/50
        width: Screen.width/50
        height: Screen.width/50
        radius: Screen.width/25
        property int index: 8
        scale: listView1.currentIndex === index ? 1.2 : 1.0
        visible: listView1.currentIndex >= index ? true : false
        Text {
            text: (parent.index+1).toString()
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            color: "black"
            anchors.fill:parent
            font.bold: true
                        font.pixelSize: Screen.height/50
        }
        border.width: 5
        border.color: "black"
       color: listView1.currentIndex === index ? "lightsteelblue" : "gray"
    }
    Rectangle {//29 novembre 2011
        x: 2*Screen.width/8+0.85*Screen.width/8
        anchors.verticalCenter: frise.verticalCenter
        anchors.verticalCenterOffset: -frise.height/4+3*Screen.width/50
        width: Screen.width/50
        height: Screen.width/50
        radius: Screen.width/25
        property int index: 9
        scale: listView1.currentIndex === index ? 1.2 : 1.0
        visible: listView1.currentIndex >= index ? true : false
        Text {
            text: (parent.index+1).toString()
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            color: "black"
            anchors.fill:parent
            font.bold: true
                        font.pixelSize: Screen.height/50
        }
        border.width: 5
        border.color: "black"
       color: listView1.currentIndex === index ? "lightsteelblue" : "gray"
    }
    Rectangle {//16 novembre 2013
        x: 4*Screen.width/8+0.81*Screen.width/8
        anchors.verticalCenter: frise.verticalCenter
        anchors.verticalCenterOffset: 0
        width: Screen.width/50
        height: Screen.width/50
        radius: Screen.width/25
        property int index: 10
        scale: listView1.currentIndex === index ? 1.2 : 1.0
        visible: listView1.currentIndex >= index ? true : false
        Text {
            text: (parent.index+1).toString()
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            color: "black"
            anchors.fill:parent
            font.bold: true
                        font.pixelSize: Screen.height/50
        }
        border.width: 5
        border.color: "black"
       color: listView1.currentIndex === index ? "lightsteelblue" : "gray"
    }
    Rectangle {//29 décembre 2013
        x: 4*Screen.width/8+0.99*Screen.width/8
        anchors.verticalCenter: frise.verticalCenter
        anchors.verticalCenterOffset: Screen.width/50
        width: Screen.width/50
        height: Screen.width/50
        radius: Screen.width/25
        property int index: 11
        scale: listView1.currentIndex === index ? 1.2 : 1.0
        visible: listView1.currentIndex >= index ? true : false
        Text {
            text: (parent.index+1).toString()
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            color: "black"
            anchors.fill:parent
            font.bold: true
                        font.pixelSize: Screen.height/50
        }
        border.width: 5
        border.color: "black"
       color: listView1.currentIndex === index ? "lightsteelblue" : "gray"
    }
    Rectangle {//12 février 2015
        x: 6*Screen.width/8+0.02*Screen.width/8
        anchors.verticalCenter: frise.verticalCenter
        anchors.verticalCenterOffset: -frise.height/4
        width: Screen.width/50
        height: Screen.width/50
        radius: Screen.width/25
        property int index: 12
        scale: listView1.currentIndex === index ? 1.2 : 1.0
        visible: listView1.currentIndex >= index ? true : false
        Text {
            text: (parent.index+1).toString()
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            color: "black"
            anchors.fill:parent
            font.bold: true
                        font.pixelSize: Screen.height/50
        }
        border.width: 5
        border.color: "black"
       color: listView1.currentIndex === index ? "lightsteelblue" : "gray"
    }
    Rectangle {//18 février 2015
        x: 6*Screen.width/8+0.03*Screen.width/8
        anchors.verticalCenter: frise.verticalCenter
        anchors.verticalCenterOffset: -frise.height/4+Screen.width/50
        width: Screen.width/50
        height: Screen.width/50
        radius: Screen.width/25
        property int index: 13
        scale: listView1.currentIndex === index ? 1.2 : 1.0
        visible: listView1.currentIndex >= index ? true : false
        Text {
            text: (parent.index+1).toString()
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            color: "black"
            anchors.fill:parent
            font.bold: true
                        font.pixelSize: Screen.height/50
        }
        border.width: 5
        border.color: "black"
       color: listView1.currentIndex === index ? "lightsteelblue" : "gray"
    }
    Rectangle {//27 mai 2015
        x: 6*Screen.width/8+0.40*Screen.width/8
        anchors.verticalCenter: frise.verticalCenter
        anchors.verticalCenterOffset: -frise.height/4+2*Screen.width/50
        width: Screen.width/50
        height: Screen.width/50
        radius: Screen.width/25
        property int index: 14
        scale: listView1.currentIndex === index ? 1.2 : 1.0
        visible: listView1.currentIndex >= index ? true : false
        Text {
            text: (parent.index+1).toString()
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            color: "black"
            anchors.fill:parent
            font.bold: true
                        font.pixelSize: Screen.height/50
        }
        border.width: 5
        border.color: "black"
       color: listView1.currentIndex === index ? "lightsteelblue" : "gray"
    }
    Rectangle {//22 août 2015
        x: 6*Screen.width/8+0.55*Screen.width/8
        anchors.verticalCenter: frise.verticalCenter
        anchors.verticalCenterOffset: -frise.height/4+3*Screen.width/50
        width: Screen.width/50
        height: Screen.width/50
        radius: Screen.width/25
        property int index: 15
        scale: listView1.currentIndex === index ? 1.2 : 1.0
        visible: listView1.currentIndex >= index ? true : false
        Text {
            text: (parent.index+1).toString()
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            color: "black"
            anchors.fill:parent
            font.bold: true
                        font.pixelSize: Screen.height/50
        }
        border.width: 5
        border.color: "black"
       color: listView1.currentIndex === index ? "lightsteelblue" : "gray"
    }
    Rectangle {//22 août 2015
        x: 6*Screen.width/8+0.6*Screen.width/8
        anchors.verticalCenter: frise.verticalCenter
        anchors.verticalCenterOffset: -frise.height/4+4*Screen.width/50
        width: Screen.width/50
        height: Screen.width/50
        radius: Screen.width/25
        property int index: 16
        scale: listView1.currentIndex === index ? 1.2 : 1.0
        visible: listView1.currentIndex >= index ? true : false
        Text {
            text: (parent.index+1).toString()
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            color: "black"
            anchors.fill:parent
            font.bold: true
                        font.pixelSize: Screen.height/50
        }
        border.width: 5
        border.color: "black"
       color: listView1.currentIndex === index ? "lightsteelblue" : "gray"
    }
    Rectangle {//Pas Sage en seine
        x: 7*Screen.width/8+0.55*Screen.width/8
        anchors.verticalCenter: frise.verticalCenter
        anchors.verticalCenterOffset: -frise.height/4+4*Screen.width/50
        width: Screen.width/50
        height: Screen.width/50
        radius: Screen.width/25
        property int index: 17
        scale: listView1.currentIndex === index ? 1.2 : 1.0
        visible: listView1.currentIndex >= index ? true : false
        Text {
            text: (parent.index+1).toString()
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            color: "black"
            anchors.fill:parent
            font.bold: true
            font.pixelSize: Screen.height/50
        }
        border.width: 5
        border.color: "black"
       color: listView1.currentIndex === index ? "lightsteelblue" : "gray"
    }
/*
-------------------------------------------------------------------------------
Language                     files          blank        comment           code
-------------------------------------------------------------------------------
C++                            153           5199           4634          33169
C/C++ Header                   149           1976           8586           6664
Bourne Shell                    11            108            244            431
IDL                              4             59              0            339
QML                              9             23              2            297
CMake                            3             32             12            112
Python                           1             25             11             61
make                             1              8             24             15
-------------------------------------------------------------------------------
SUM:                           331           7430          13513          41088
-------------------------------------------------------------------------------
*/
       ListView {
           id: listView1
           width: Screen.width/4
           anchors.top: frise.bottom
           anchors.bottom: parent.bottom
           anchors.bottomMargin: 200
           anchors.horizontalCenter: parent.horizontalCenter
           anchors.horizontalCenterOffset: -Screen.width/8
           focus: true
           spacing: Screen.height*0.01
           highlight: Rectangle { color: "lightsteelblue"; radius: 5;  }//height:Screen.height/50+200

          Timer {
               id: trigger
               interval: 200
               repeat: false
               onTriggered: app.currentItemChanged(view.currentItem)
           }
           delegate: Item {
               width: Screen.width/1.5
               height: Screen.height/50
               Row {
                   id: row1
                   Text {
                       color: "black"
                       width: Screen.width/120
                       text: index
                       font.pixelSize: Screen.height/50
                       anchors.verticalCenter: parent.verticalCenter
                       verticalAlignment: Qt.AlignTop
                   }
                   Text {
                       color: "black"
                       width: Screen.width/8
                       text: date
                       font.pixelSize:Screen.height/50
                       anchors.verticalCenter: parent.verticalCenter
                       verticalAlignment: Qt.AlignTop
                   }
                   Text {
                       color: "black"
                       width: Screen.width/10
                       text: desc
                       font.pixelSize: Screen.height/50
                       anchors.verticalCenter: parent.verticalCenter
                       verticalAlignment: Qt.AlignTop
                   }
                   spacing: 50
               }
           }
           Keys.onUpPressed: {
               decrementCurrentIndex()
               trigger.start()
           }
           Keys.onDownPressed: {
               incrementCurrentIndex()
               trigger.start()
           }
           model: ListModel {
               ListElement {
                   index: 1
                   date: "24 janvier 2009"
                   desc: "Mon premier message sur le forum et création de l’espace google code."
               }

               ListElement {
                   index: 2
                   date: "21 déc 2009"
                   desc: "Sortie de la version 1.0"
               }
               ListElement {
                   index: 3
                   date: "10 janvier 2010"
                   desc: "Début de la réécriture (2.0)"
               }
               ListElement {
                   index: 4
                   date: "15 février 2010"
                   desc: "Sortie de la version 1.0.1"
               }
               ListElement {
                   index: 5
                   date: "6 mars 2010"
                   desc: "Ouverture du nom de domaine rolisteam.org (auto-hébergé)"
               }
               ListElement {
                   index: 6
                   date: "30 octobre 2010"
                   desc: "Sortie de la version 1.0.2"
               }
               ListElement {
                   index: 7
                   date: "22 octobre 2011"
                   desc: "Sortie de la version 1.5.0"
               }
               ListElement {
                   index: 8
                   date: "26 octobre 2011"
                   desc: "Sortie de la version 1.5.1"
               }
               ListElement {
                   index: 9
                   date: "30 octobre 2011"
                   desc: "Sortie de la version 1.5.2"
               }
               ListElement {
                   index: 10
                   date: "29 novembre 2011"
                   desc: "Création de l’association Rolisteam"
               }
               ListElement {
                   index: 11
                   date: "16 novembre 2013"
                   desc: "Sortie de la version 1.6.0"
               }
               ListElement {
                   index: 12
                   date: "29 décembre 2013"
                   desc: "Création du dépôt pour DiceParser (premier essai avec git)"
               }
               ListElement {
                   index: 13
                   date: "12 février 2015"
                   desc: "Sortie de la version 1.6.1"
               }
               ListElement {
                   index: 14
                   date: "18 février 2015"
                   desc: "Passage à Git pour la gestion de rolisteam"
               }
               ListElement {
                   index: 16
                   date: "27 mai 2015"
                   desc: "Ouverture comptes réseau sociaux"
               }
               ListElement {
                   index: 15
                   date: "22 août 2015"
                   desc: "Sortie de la version 1.7.0"
               }
               ListElement {
                   index: 17
                   date: "5 septembre 2015"
                   desc: "Sortie de la version 1.7.1"
               }
               ListElement {
                   index: 18
                   date: "1 Juillet 2016"
                   desc: "Pas sage en Seine"
               }
           }
       }
        Text {
            id: text2
            anchors.verticalCenter: frise.verticalCenter
            anchors.right: frise.right
            anchors.rightMargin: Screen.width/28
            text: qsTr("2016")
            font.pixelSize: Screen.height/20
        }

        Text {
            id: text3
            anchors.verticalCenter: frise.verticalCenter
            anchors.left: frise.left
            anchors.leftMargin: Screen.width/28
            text: qsTr("2009")
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: Screen.height/20
        }

}

