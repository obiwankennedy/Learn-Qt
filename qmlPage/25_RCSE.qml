import QtQuick 2.0
import QtQuick.Window 2.2

SlidePage {

    id: rectangle1
    anchors.fill: parent
    logo: "qrc:/rsrc/logo.png"
    focus: true
    title: "RCSE"

    ListModel {
        id: listSection
        ListElement {
            name: "Un IDE pour du QML dédié"
            index:0
        }
        ListElement {
            name: "Petit tour du SDK"
            index:1
        }
        ListElement {
            name: "Petit tour du code généré"
            index:2
        }
        ListElement {
            name: "Échange"
            index:3
        }
    }

    Component.onCompleted:
    {
        points = listSection
        anchors.fill = parent
    }
}
