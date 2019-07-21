import QtQuick 2.0
import QtQuick.Window 2.2
import QtQuick.Layouts 1.3

SlidePage {

    id: page
    anchors.fill: parent
    logo: "qrc:/rsrc/logo.png"
    focus: true
    title: "Le positionnement"


    ListModel {
        id: listSection
        ListElement {
            name: "Positionnement en Z"
            index:0
        }
        ListElement {
            name: "4 types de positionnements"
            index:3
        }
        ListElement {
            name: "Relatif au parent"
            index:4
        }
        ListElement {
            name: "Ancre"
            index:6
        }
        ListElement {
            name: "Positionner: Flow, Column, Grid, Row"
            index:13
        }
        ListElement {
            name: "Layout: ColumnLayout, GridLayout, RowLayout, StackLayout"
            index:15
        }
        ListElement {
            name: "Exemples: 03_positionnement/test.qml"
            index:17
        }
    }

    Component.onCompleted:
    {
        points = listSection
        anchors.fill = parent
    }

    onIdStateChanged: {
        if(idState == 1)
        {
            rect.visible = false
            zposi.visible = true
            slideCode.visible = true;
            slideCode.code ="import QtQuick 2.0
Item {
    id: root
    Rectangle {
        id: up
        color: \"red\"
        width:  200
        height: 200
    }
    Rectangle {
        id: down
        color: \"yellow\"
        width:  200
        height: 200
    }
}"
            view.opacity = 0
        }
        else if(idState == 2)
        {
            rect.visible = false
            zposi.visible = true
            slideCode.visible = true;
            slideCode.code ="import QtQuick 2.0
Item {
    id: root
    Rectangle {
        id: up
        color: \"red\"
        z: 1
        width:  200
        height: 200
    }
    Rectangle {
        id: down
        color: \"yellow\"
        width:  200
        height: 200
    }
}"
            view.opacity = 0
        }
        else if(idState == 5)
        {
           // rect.visible = true
            slideCode.visible = true;
            relatif.visible = true;
            slideCode.code ="import QtQuick 2.0
Item {
    Rectangle {
        height: 200
        width:  200
        color: \"red\"
        Rectangle {
            x: 50
            y: 50
            width: 200
            height: 200
            color: \"yellow\"
        }
    }
}"
            view.opacity = 0
        }
        else if(idState == 7)
        {
            anch.visible = true
            slideCode.visible = true;
            slideCode.code ="import QtQuick 2.0
Item {
    Rectangle {
        id: first
        color: \"red\"
        width:  200
        height: 200
    }
    Rectangle {
        anchors.fill: first
        color: \"yellow\"
    }
}"
            view.opacity = 0
        }
        else if(idState == 8)
        {
            anch.visible = true
            slideCode.visible = true;
            slideCode.code ="import QtQuick 2.0
Item {
    Rectangle {
        id: first
        color: \"red\"
        width:  200
        height: 200
    }
    Rectangle {
        anchors.top: first.top
        anchors.left: first.left
        width:  50
        height: 50
        color: \"yellow\"
    }
}"
            view.opacity = 0
        }
        else if(idState == 9)
        {
            anch.visible = true
            slideCode.visible = true;
            slideCode.code ="import QtQuick 2.0
Item {
    Rectangle {
        id: first
        color: \"red\"
        width:  200
        height: 200
    }
    Rectangle {
        anchors.centerIn: first
        width:  50
        height: 50
        color: \"yellow\"
    }
}"
            view.opacity = 0
        }
        else if(idState == 10)
        {
            anch.visible = true
            slideCode.visible = true;
            slideCode.code ="import QtQuick 2.0
Item {
    Rectangle {
        id: first
        color: \"red\"
        width:  200
        height: 200
    }
    Rectangle {
        anchors.horizontalCenter: first.horizontalCenter
        anchors.bottom: first.bottom
        width:  50
        height: 50
        color: \"yellow\"
    }
}"
            view.opacity = 0
        }
        else if(idState == 11)
        {
            anch.visible = true
            slideCode.visible = true;
            slideCode.code ="import QtQuick 2.0
Item {
    Rectangle {
        id: first
        color: \"red\"
        width:  200
        height: 200
    }
    Rectangle {
        anchors.top: first.top
        anchors.left: first.left
        anchors.right: first.horizontalCenter
        anchors.bottom: first.verticalCenter
        color: \"yellow\"
    }
}"
            view.opacity = 0
        }
        else if(idState == 12)
        {
            anch.visible = true
            slideCode.visible = true;
            slideCode.code ="import QtQuick 2.0
Item {
    Rectangle {
        id: first
        color: \"red\"
        width:  200
        height: 200
    }
    Rectangle {
        anchors.top: first.top
        anchors.topMargin: 10
        anchors.left: first.left
        anchors.leftMargin: 10
        anchors.right: first.horizontalCenter
        anchors.rightMargin: 10
        anchors.bottom: first.verticalCenter
        anchors.bottomMargin: 10
        color: \"yellow\"
    }
}"
            view.opacity = 0
        }
        else if(idState == 14)
        {
            slideCode.visible = true
            grid.visible = true
            slideCode.code ="import QtQuick 2.0
Grid {
    columns: 3
    spacing: 2
    Rectangle { color: \"red\"; width: 150; height: 150 }
    Rectangle { color: \"green\"; width: 100; height: 150 }
    Rectangle { color: \"blue\"; width: 150; height: 60 }
    Rectangle { color: \"cyan\"; width: 150; height: 150 }
    Rectangle { color: \"magenta\"; width: 80; height: 80 }
}
";
            view.opacity = 0
        }
        else if(idState == 16)
        {
            slideCode.visible = true
            gridlayout.visible = true
            slideCode.code ="import QtQuick 2.0
import QtQuick.Layouts 1.3

GridLayout {
    id: grid
    columns: 3
    Rectangle { color: \"red\"; width: 150; height: 150 }
    Rectangle { color: \"green\"; width: 100; height: 150 }
    Rectangle { color: \"blue\"; width: 150; height: 60 }
    Rectangle { color: \"cyan\"; width: 150; height: 150 }
    Rectangle { color: \"magenta\"; width: 80; height: 80 }
}
";
            view.opacity = 0
        }
        else
        {
            anch.visible = false
            grid.visible = false
            gridlayout.visible = false
            relatif.visible = false
            rect.visible = false
            zposi.visible = false
            view.opacity = 1
            slideCode.visible = false
            view.focus = false
        }
    }

    Item {
        id: zposi
        x: parent.width*0.55
        y: parent.height*0.2
        visible: false
        Rectangle {
            id: up
            color: "red"
            x:50
            y:50
            z: page.idState == 2 ? 1 : 0
            onZChanged: {
                console.log(z+" "+page.idState)
            }
            width:  200
            height: 200
        }
        Rectangle {
            id: down
            color: "yellow"
            x:50
            y:50
            width:  200
            height: 200
        }
    }

    Rectangle {
            id: relatif
            x: parent.width*0.7
            y: parent.height*0.4
             visible: false
            color: "gray"
            width:  300
            height: 300
        Rectangle {
            color: "red"
            width:  200
            height: 200
            Rectangle {
                width: 200
                height: 200
                color: "yellow"
                x: 50
                y: 50
            }
        }
    }

    Rectangle {
            id: anch
            x: parent.width*0.7
            y: parent.height*0.4
            color: "grey"
            width:  300
            height: 300
            visible:  false

        Rectangle {
            id: first
            color: "red"
            anchors.centerIn: parent
            width:  200
            height: 200
        }
        Rectangle {
            id: second
            anchors.fill: first
            color: "yellow"
            visible: page.idState == 7
        }
        Rectangle {
            id: third
            anchors.top: first.top
            anchors.left: first.left
            width:  50
            height: 50
            color: "yellow"

            visible: page.idState == 8
        }
        Rectangle {
            id: fourth
            anchors.centerIn: first
            width:  50
            height: 50
            color: "yellow"

            visible: page.idState == 9
        }
        Rectangle {
            id: fifth
            anchors.horizontalCenter: first.horizontalCenter
            anchors.bottom: first.bottom
            width:  50
            height: 50
            color: "yellow"
            visible: page.idState == 10
        }
        Rectangle {
            id: sixth
            anchors.top: first.top
            anchors.left: first.left
            anchors.right: first.horizontalCenter
            anchors.bottom: first.verticalCenter
            color: "yellow"
            visible: page.idState == 11
        }
        Rectangle {
            id: seventh
            anchors.top: first.top
            anchors.topMargin: 10
            anchors.left: first.left
            anchors.leftMargin: 10
            anchors.right: first.horizontalCenter
            anchors.rightMargin: 10
            anchors.bottom: first.verticalCenter
            anchors.bottomMargin: 10
            color: "yellow"
            visible: page.idState == 12
        }
    }

    Grid {
        id: grid
        x: parent.width*0.7
        y: parent.height*0.4
        visible: false
        columns: 3
        spacing: 2
        Rectangle { color: "red"; width: 150; height: 150 }
        Rectangle { color: "green"; width: 100; height: 150 }
        Rectangle { color: "blue"; width: 150; height: 60 }
        Rectangle { color: "cyan"; width: 150; height: 150 }
        Rectangle { color: "magenta"; width: 80; height: 80 }
    }

    GridLayout {
        id: gridlayout
        x: parent.width*0.7
        y: parent.height*0.4
        columns: 3
        visible: false
        Rectangle { color: "red"; width: 150; height: 150 }
        Rectangle { color: "green"; width: 100; height: 150 }
        Rectangle { color: "blue"; width: 150; height: 60 }
        Rectangle { color: "cyan"; width: 150; height: 150 }
        Rectangle { color: "magenta"; width: 80; height: 80 }
    }
    Rectangle {
        id: rect
        color: "white"
        x: parent.width*0.7
        y: parent.height*0.4
        visible: false
        width:  300
        height: 300
        Rectangle {
            id: rect2
            color: "red"
            width:  200
            height: 200
            x:50
            y:50
            MouseArea {
                width: 200
                height: 200
                x: 50
                y: 50
                onClicked:{
                    timer.running = true
                }

                Timer {
                    id: timer
                    interval: 10000
                    onTriggered: yle.opacity =  0.5

                }

                Rectangle {
                    id: yle
                    opacity:0.0
                    color: "yellow"
                    anchors.fill: parent
                    Behavior on opacity {
                        NumberAnimation { duration: 1000 }
                    }
                }
            }
        }
    }
}
