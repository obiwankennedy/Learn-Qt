import QtQuick 2.0
import QtQuick.Window 2.2

SlidePage {

    id: rectangle1
    anchors.fill: parent
    logo: "qrc:/rsrc/Qt_logo_2015.svg"
    focus: true
    title: "Dessiner en QML"

    ListModel {
        id: listSection
        ListElement {
            name: "Le Canvas"
            index:0
        }
        ListElement {
            name: "Le painter"
            index:1
        }
        ListElement {
            name: "L’utilisation"
            index:2
        }
        ListElement {
            name: "Exemple"
            index:3
        }
    }

    Component.onCompleted:
    {
        points = listSection
        anchors.fill = parent
    }
}
