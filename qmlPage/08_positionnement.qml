import QtQuick 2.0
import QtQuick.Window 2.2

SlidePage {

    id: rectangle1
    anchors.fill: parent
    logo: "qrc:/rsrc/Qt_logo_2015.svg"
    focus: true
    title: "Le positionnement"

    ListModel {
        id: listSection
        ListElement {
            name: "4 types de positionnements"
            index:0
        }
        ListElement {
            name: "Relatif au parent"
            index:1
        }
        ListElement {
            name: "Ancre"
            index:3
        }
        ListElement {
            name: "Positionner: Flow, Column, Grid, Row"
            index:5
        }
        ListElement {
            name: "Layout: ColumnLayout, GridLayout, RowLayout, StackLayout"
            index:7
        }
    }

    Component.onCompleted:
    {
        points = listSection
        anchors.fill = parent
    }

    onIdStateChanged: {
        if(idState == 2)
        {
            slideCode.visible = true;
            slideCode.code ="Item {
    width: 1000
    height: 800
    // relatif au parent
    Text {
        text: \"Hello World!\"
    }
    Rectangle {
        color: \"red\"
        width:  200
        height: 200
        x:0
        y:0
        MouseArea {
            width: 200
            height: 200
            x: 100
            y: 100
            onClicked:console.log(\"click on rectangle\")
        }
    }
}"
            view.opacity = 0
        }
        else if(idState == 4)
        {
            slideCode.visible = true;
            slideCode.code =" Image {
        source: \"logo.png\"
        x: 200
        y: 0
   }

    TextInput {
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        width: 250
        height: 20
        text: \"change me\"
    }"
            view.opacity = 0
        }
        else if(idState == 6)
        {
            slideCode.visible = true;
            slideCode.code ="Grid {
        x: 535
        y: 3
        columns: 3
        spacing: 2
        Rectangle { color: \"red\"; width: 50; height: 50 }
        Rectangle { color: \"green\"; width: 20; height: 50 }
        Rectangle { color: \"blue\"; width: 50; height: 20 }
        Rectangle { color: \"cyan\"; width: 50; height: 50 }
        Rectangle { color: \"magenta\"; width: 10; height: 10 }
    }

";
            view.opacity = 0
        }
        else if(idState == 8)
        {
            slideCode.visible = true;
            slideCode.code ="GridLayout {
        id: grid
        x: 373
        y: 0
        columns: 3
        Rectangle { color: \"red\"; width: 50; height: 50 }
        Rectangle { color: \"green\"; width: 20; height: 50 }
        Rectangle { color: \"blue\"; width: 50; height: 20 }
        Rectangle { color: \"cyan\"; width: 50; height: 50 }
        Rectangle { color: \"magenta\"; width: 10; height: 10 }

    }

";
            view.opacity = 0
        }
        else
        {

            view.opacity = 1
            slideCode.visible = false
            view.focus = false
        }
    }
}
