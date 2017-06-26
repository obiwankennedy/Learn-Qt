import QtQuick 2.0
import QtQuick.Window 2.2

SlidePage {

    id: rectangle1
    anchors.fill: parent
    logo: "qrc:/rsrc/logo.png"
    focus: true
    title: "QtCreator"

    ListModel {
        id: listSection
        ListElement {
            name: "Visite de QtCreator"
            index:0
        }
        ListElement {
            name: "Edition d’un fichier QML"
            index:1
        }
        ListElement {
            name: "Intégration de l’aide (F1)"
            index:2
        }
        ListElement {
            name: "Designer (ctrl+3)"
            index:3
        }
        ListElement {
            name: "Créer un projet"
            index:4
        }
        ListElement {
            name: "Visite du projet"
            index:5
        }
    }

    Component.onCompleted:
    {
        points = listSection
        anchors.fill = parent
    }
}
