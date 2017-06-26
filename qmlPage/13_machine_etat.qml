import QtQuick 2.0
import QtQuick.Window 2.2

SlidePage {

    id: rectangle1
    anchors.fill: parent
    logo: "qrc:/rsrc/Qt_logo_2015.svg"
    focus: true
    title: "Etats et transitions"

    ListModel {
        id: listSection
        ListElement {
            name: "Explication"
            index:0
        }
        ListElement {
            name: "Analyse de la syntaxe"
            index:1
        }
        ListElement {
            name: "Dans le designer"
            index:3
        }
        ListElement {
            name: "Avantages ?"
            index:4
        }
        ListElement {
            name: "Transition"
            index:5
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
            slideCode.code ="states: [
        State {
            name: \"clicked\"
            PropertyChanges { target: myRect; color: \"red\" }
        },
        State {
            name: \"disabled\"
            PropertyChanges { target: myRect; color: \"grey\" }
        }
    ]"
            view.opacity = 0
        }
        else if(idState == 9)
        {
            slideCode.visible = true;
            slideCode.code ="transitions: [
        Transition {
            from: \"*\"; to: \"clicked\"


            NumberAnimation { target: my_rectangle1 ;properties: \"x\";easing.type: Easing.OutBounce; duration: 1000; }
        }
    ]
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
