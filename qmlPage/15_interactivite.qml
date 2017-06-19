import QtQuick 2.0
import QtQuick.Window 2.2

SlidePage {

    id: rectangle1
    anchors.fill: parent
    logo: "qrc:/rsrc/Qt_logo_2015.svg"
    focus: true
    title: "Interaction"

    ListModel {
        id: listSection
        ListElement {
            name: "Souris"
            index:0
        }
        ListElement {
            name: "Gesture"
            index:1
        }
        ListElement {
            name: "Clavier"
            index:2
        }
        ListElement {
            name: "autres: C++"
            index:3
        }
    }

    Component.onCompleted:
    {
        points = listSection
        anchors.fill = parent
    }
}
