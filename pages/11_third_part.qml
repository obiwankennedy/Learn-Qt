import QtQuick 2.0
import QtQuick.Window 2.2

SlidePage {
    id: rectangle1
    anchors.fill: parent
    logo: "qrc:/rsrc/logo.png"
    focus: true
    title: "Third part"

    ListModel {
        id: listSection
        ListElement {
            name: "What Lib is ?"
            index:0
        }
        ListElement {
            name: "Check the lib"
            index:1
        }
        ListElement {
            name: "Include it"
            index:2
        }
        ListElement {
            name: "Exercice"
            index:3
        }
    }

    Component.onCompleted:
    {
        points = listSection
        anchors.fill = parent
    }
}
