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
            index:1
        }
        ListElement {
            name: "Avantages ?"
            index:2
        }
        ListElement {
            name: "Transition"
            index:3
        }
    }

    Component.onCompleted:
    {
        points = listSection
        anchors.fill = parent
    }
}
