import QtQuick 2.0
import QtQuick.Window 2.2

SlidePage {

    id: rectangle1
    anchors.fill: parent
    logo: "qrc:/rsrc/Qt_logo_2015.svg"
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
            name: "Intégration de l’aide"
            index:2
        }
        ListElement {
            name: "Designer"
            index:3
        }
        ListElement {
            name: "Créer un projet"
            index:4
        }
        ListElement {
            name: "Visite du projet"
            index:4
        }
    }

    Component.onCompleted:
    {
        points = listSection
        anchors.fill = parent
    }
}
