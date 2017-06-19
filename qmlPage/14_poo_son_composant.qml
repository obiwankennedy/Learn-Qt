import QtQuick 2.0
import QtQuick.Window 2.2

SlidePage {

    id: rectangle1
    anchors.fill: parent
    logo: "qrc:/rsrc/Qt_logo_2015.svg"
    focus: true
    title: "Créer son composant?"

    ListModel {
        id: listSection
        ListElement {
            name: "Réfléchir en boite noire"
            index:0
        }
        ListElement {
            name: "Définir les propriétés de son item"
            index:1
        }
        ListElement {
            name: "Séparer les fichiers"
            index:2
        }
        ListElement {
            name: "Utiliser"
            index:3
        }
        ListElement {
            name: "Gérer plusieurs composants perso"
            index:3
        }
    }

    Component.onCompleted:
    {
        points = listSection
        anchors.fill = parent
    }
}
