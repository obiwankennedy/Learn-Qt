import QtQuick 2.0
import QtQuick.Window 2.2

SlidePage {

    id: rectangle1
    anchors.fill: parent
    logo: "qrc:/rsrc/Qt_logo_2015.svg"
    focus: true
    title: "Les éléments de base"

    ListModel {
        id: listSection
        ListElement {
            name: "Item"
            index:0
        }
        ListElement {
            name: "Text"
            index:1
        }
        ListElement {
            name: "Image"
            index:2
        }
        ListElement {
            name: "Rectangle"
            index:3
        }
        ListElement {
            name: "TextEdit / TextInput"
            index:4
        }
        ListElement {
            name: "Timer"
            index:5
        }
        ListElement {
            name: "MouseArea"
            index:6
        }
        ListElement {
            name: "Flickable"
            index:7
        }
        ListElement {
            name: "Exercice: reprendre helloworld.qml pour afficher une <br/> trace toutes les secondes (Timer)"
            index:8
        }
        ListElement {
            name: "Aide: console.log(\"hello world!\")"
            index:9
        }

    }

    Component.onCompleted:
    {
        points = listSection
        anchors.fill = parent
    }
}
