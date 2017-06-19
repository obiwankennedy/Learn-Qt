import QtQuick 2.0
import QtQuick.Window 2.2

SlidePage {

    id: rectangle1
    anchors.fill: parent
    logo: "qrc:/rsrc/Qt_logo_2015.svg"
    focus: true
    title: "Les animations"

    ListModel {
        id: listSection
        ListElement {
            name: "Animer une propriété"
            index:0
        }
        ListElement {
            name: "Animatino Directe"
            index:1
        }
        ListElement {
            name: "Corportementale"
            index:2
        }
        ListElement {
            name: "Transition"
            index:3
        }
        ListElement {
            name: "Animations Séquentielles ou en Parallèles"
            index:4
        }
    }

    Component.onCompleted:
    {
        points = listSection
        anchors.fill = parent
    }
}
