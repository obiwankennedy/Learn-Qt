import QtQuick 2.0
import QtQuick.Window 2.2

SlidePage {

    id: page
    anchors.fill: parent
    logo: "qrc:/rsrc/logo.png"
    focus: true
    title: "Atelier QML"

    ListModel {
        id: listSection
        ListElement {
            name: "Présentation"
            index:1
        }
        ListElement {
            name: "QML, c’est quoi ?"
            index:2
        }
    }

    Component.onCompleted:
    {
        points = listSection
        anchors.fill = parent
    }
}
