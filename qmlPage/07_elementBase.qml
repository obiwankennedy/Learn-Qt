import QtQuick 2.0
import QtQuick.Window 2.2

SlidePage {
    id: page
    anchors.fill: parent
    logo: "qrc:/rsrc/logo.png"
    focus: true
    title: "Les éléments de base"

    onIdStateChanged:{
        console.log(idState)
     if(idState == 2)
     {
        slideCode.visible = true;
         slideCode.code ="import QtQuick 2.0
Item {
    Rectangle {
        id: rect
        width: 300
        height: 200
        color: \"red\"
    }
}
"
         view.opacity = 0
     }
     else if(idState == 3)
     {
        slideCode.visible = true;
         view.opacity = 0
         slideCode.code ="import QtQuick 2.0
Item {
    Rectangle {
        id: rect
        width: 300
        height: 200
        color: \"cyan\"
        radius: 20
    }
}
"
     }
     else if(idState == 7)
     {
        slideCode.visible = true;
       // slideCode.focus = true
         view.opacity = 0
         slideCode.code ="Image {
            source: \"qrc:/rsrc/DSCN2405.JPG\"
        }
"
     }
     else if(idState == 8)
     {
        slideCode.visible = true;
       //  slideCode.focus = true
         view.opacity = 0
         slideCode.code ="Image {
            source: \"qrc:/rsrc/DSCN2405.JPG\"
            width: 300
            height: 200
            fillMode: Image.PreserveAspectFit
        }
"
     }
     else if(idState == 9)
     {
        slideCode.visible = true;
     //    slideCode.focus = true
         view.opacity = 0
         slideCode.code ="Image {
            source: \"qrc:/rsrc/DSCN2405.JPG\"
            width: 300
            height: 200
            fillMode: Image.PreserveAspectCrop
        }
"
     }
     else if(idState == 11)
     {
        slideCode.visible = true;
      //   slideCode.focus = true
         view.opacity = 0
         slideCode.code ="Timer {
            running: true
            interval: 1000
            repeat: true
            onTriggered: console.log(\"message de debug\"+rect.width)
        }
"
     }
     else if(idState == 13)
     {
        slideCode.visible = true;
       //  slideCode.focus = true
         view.opacity = 0
         slideCode.code ="Rectangle {
            width: 200
            height: 150
            color: \"cyan\"
            radius: 20
            MouseArea {
               anchors.fill: parent
               onClicked: parent.scale += 0.1
            }
        }
"
     }
     else if(idState == 15)
     {
        slideCode.visible = true;
       //  slideCode.focus = true
         view.opacity = 0
         slideCode.code ="        Flickable {
            id: flickable
            clip: true
            height: 200
            width:  300
            contentWidth: img.width;
            contentHeight: img.height
            Image {
                id: img
                source: \"qrc:/rsrc/DSCN2405.JPG\"
            }
        }
"
     }
     else
     {
         view.opacity = 1
         slideCode.visible = false
         //view.focus = true
     }
    }

    ListModel {
        id: listSection
        ListElement {
            name: "Item"
            index:0
        }
        ListElement {
            name: "Rectangle"
            index:1
        }
        ListElement {
            name: "Text"
            index:4
        }
        ListElement {
            name: "TextEdit / TextInput"
            index:5
        }
        ListElement {
            name: "Image"
            index:6
        }
        ListElement {
            name: "Timer"
            index:10
        }
        ListElement {
            name: "MouseArea"
            index:12
        }
        ListElement {
            name: "Flickable"
            index:14
        }
        ListElement {
            name: "Exercice 2: Jouer un peu avec les différents types."
            index:16
        }
    }



    Component.onCompleted:
    {
        points = listSection
        anchors.fill = parent
    }
    CodePage {
        id: slideCode
        visible: false
        x:0
        y:parent.height*0.2
        width: parent.width
        height: parent.height*0.8

        Rectangle {
            id: rect
            x: parent.width*0.7
            y: parent.height*0.2
            height: parent.height*0.2
            width: parent.width*0.2
            opacity: page.idState > 1 && page.idState < 4 ? 1.0 : 0.0
            color: page.idState == 2 ? "red" : "cyan"
            radius: page.idState == 2 ? 0 : 20

            Behavior on opacity {
                NumberAnimation {
                    target: rect
                    property: "opacity"
                    duration: 200
                    easing.type: Easing.InOutQuad
                }
            }
        }
        Image {
            source: "qrc:/rsrc/DSCN2405.JPG"
            x: parent.width*0.55
            y: parent.height*0.2
            height: page.idState == 7 ? sourceSize.height : parent.height*0.4
            width: page.idState == 7 ? sourceSize.width : parent.width*0.4
            //verticalAlignment: Image.AlignTop
            //horizontalAlignment: Image.AlignLeft
            opacity: page.idState > 6 && page.idState < 10 ? 1.0 : 0.0
            fillMode: page.idState == 7 ? Image.Pad :  page.idState == 8 ? Image.PreserveAspectFit : Image.PreserveAspectCrop
            Behavior on opacity {
                NumberAnimation {
                    target: rect
                    property: "opacity"
                    duration: 200
                    easing.type: Easing.InOutQuad
                }
            }
        }
        Rectangle {
            id: rectMouse
            x: parent.width*0.7
            y: parent.height*0.1
            height: parent.height*0.2
            width: parent.width*0.2
            opacity: page.idState ==13 ? 1.0 : 0.0
            color: "cyan"
            radius: 20
            focus: true

            MouseArea{
                anchors.fill: parent
                onClicked: parent.scale += 0.1
            }
        }
        Flickable {
            id: flickable
            x: parent.width*0.55
            y: parent.height*0.2
            clip: true
            height: parent.height*0.4
            width:  parent.width*0.4
            contentWidth: img.width;
            contentHeight: img.height
            opacity: page.idState ==15 ? 1.0 : 0.0
            Image {
                id: img
                source: "qrc:/rsrc/DSCN2405.JPG"
            }
        }
    }
}
