import QtQuick 2.0
import QtQuick.Window 2.2

SlidePage {

    id: rectangle1
    anchors.fill: parent
    logo: "qrc:/rsrc/Qt_logo_2015.svg"
    focus: true
    title: "RPC - TCP Socket"

    ListModel {
        id: listSection
        ListElement {
            name: "What's a TCP Socket ?"
            index:0
        }
        ListElement {
            name: "How to use it"
            index:1
        }
        ListElement {
            name: "Example"
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
