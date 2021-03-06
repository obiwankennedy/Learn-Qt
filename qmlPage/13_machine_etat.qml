import QtQuick 2.0
import QtQuick.Window 2.2

SlidePage {

    id: rectangle1
    anchors.fill: parent
    logo: "qrc:/rsrc/logo.png"
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
        ListElement {
            name: "Exercice: Réaliser un feu de traffic: Rouge puis Rouge et Orange puis vers, <br/>puis Orange puis Rouge"
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
        else if(idState == 6)
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
