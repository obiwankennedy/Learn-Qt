import QtQuick 2.0
import QtQuick.Window 2.2

SlidePage {
    id: rectangle1
    anchors.fill: parent
    logo: "qrc:/rsrc/Qt_logo_2015.svg"
    focus: true
    title: "Qthread"

    ListModel {
        id: listSection
        ListElement {
            name: "Endless loop"
            index:0
        }
        ListElement {
            name: "Worker"
            index:1
        }
        ListElement {
            name: "Work and notify"
            index:2
        }
        ListElement {
            name: "Exercice "
            index:3
        }
    }

    Component.onCompleted:
    {
        points = listSection
        anchors.fill = parent
    }
}
