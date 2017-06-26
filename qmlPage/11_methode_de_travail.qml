import QtQuick 2.0
import QtQuick.Window 2.2

SlidePage {

    id: rectangle1
    anchors.fill: parent
    logo: "qrc:/rsrc/logo.png"
    focus: true
    title: "Méthode de travail"

    ListModel {
        id: listSection
        ListElement {
            name: "Du design au QML"
            index:0
        }
        ListElement {
            name: "Du QML au QML propre"
            index:1
        }
        ListElement {
            name: "Autres méthodes"
            index:2
        }
    }

    Component.onCompleted:
    {
        points = listSection
        anchors.fill = parent
    }
}
