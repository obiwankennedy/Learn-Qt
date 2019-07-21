import QtQuick 2.0
import QtQuick.Window 2.2

SlidePage {

    id: rectangle1
    anchors.fill: parent
    logo: "qrc:/rsrc/logo.png"
    focus: true
    title: "Pré-requis"

    ListModel {
        id: listSection
        ListElement {
            name: "QtCreator"
            index:0
        }
        ListElement {
            name: "Qt5.9"
            index:1
        }
        ListElement {
            name: "RCSE"
            index:2
        }

    }

    Component.onCompleted:
    {
        points = listSection
        anchors.fill = parent
    }
}
