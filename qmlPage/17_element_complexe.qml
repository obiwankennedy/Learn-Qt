import QtQuick 2.0
import QtQuick.Window 2.2

SlidePage {

    id: rectangle1
    anchors.fill: parent
    logo: "qrc:/rsrc/Qt_logo_2015.svg"
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
            index:4
        }
    }

    Component.onCompleted:
    {
        points = listSection
        anchors.fill = parent
    }
}
