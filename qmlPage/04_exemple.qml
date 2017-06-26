import QtQuick 2.0
import QtQuick.Window 2.2

SlidePage {

    id: rectangle1
    anchors.fill: parent
    logo: "qrc:/rsrc/Qt_logo_2015.svg"
    focus: true
    title: "Exemple d’utilisation du QML"

    ListModel {
        id: listSection
        ListElement {
            name: "Cette présentation"
            index:0
        }
        ListElement {
            name: "Les fiches de perso de Rolisteam"
            index:1
        }
        ListElement {
            name: "Démos Qt"
            index:2
        }
        ListElement {
            name: "Viper 3d"
            index:3
        }
    }

    Component.onCompleted:
    {
        points = listSection
        anchors.fill = parent
    }
}
