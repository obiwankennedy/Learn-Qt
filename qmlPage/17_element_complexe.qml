import QtQuick 2.0
import QtQuick.Window 2.2

SlidePage {

    id: rectangle1
    anchors.fill: parent
    logo: "qrc:/rsrc/logo.png"
    focus: true
    title: "De nouveaux éléments"

    ListModel {
        id: listSection
        ListElement {
            name: "Des nouveaux modules"
            index:0
        }
        ListElement {
            name: "Controls"
            index:1
        }
        ListElement {
            name: "Layout"
            index:2
        }
        ListElement {
            name: "Window"
            index:3
        }
        ListElement {
            name: "Dialog"
            index:4
        }
        ListElement {
            name: "Multimedia"
            index:5
        }
        ListElement {
            name: "Exercice: Analyse du code, Gérer le stackview"
            index:5
        }
    }

    Component.onCompleted:
    {
        points = listSection
        anchors.fill = parent
    }
}
