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
            index:3
        }
        ListElement {
            name: "Timer"
            index:3
        }
        ListElement {
            name: "MouseArea"
            index:3
        }
        ListElement {
            name: "Flickable"
            index:3
        }

    }

    Component.onCompleted:
    {
        points = listSection
        anchors.fill = parent
    }
}
