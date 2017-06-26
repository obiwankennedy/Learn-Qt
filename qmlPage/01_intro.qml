import QtQuick 2.0
import QtQuick.Window 2.2

SlidePage {

    id: rectangle1
    anchors.fill: parent
    logo: "qrc:/rsrc/Qt_logo_2015.svg"
    focus: true
    title: "Introduction"

    ListModel {
        id: listSection
        ListElement {
            name: "Présentation"
            index:0
        }
        ListElement {
            name: "QML, c’est quoi ?"
            index:1
        }
    }

    Component.onCompleted:
    {
        points = listSection
        anchors.fill = parent
    }
}
