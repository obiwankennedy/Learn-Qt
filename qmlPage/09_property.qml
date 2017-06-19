import QtQuick 2.0
import QtQuick.Window 2.2

SlidePage {

    id: rectangle1
    anchors.fill: parent
    logo: "qrc:/rsrc/Qt_logo_2015.svg"
    focus: true
    title: "Properties et signaux"

    ListModel {
        id: listSection
        ListElement {
            name: "Les propriétés"
            index:0
        }
        ListElement {
            name: "Les importantes"
            index:1
        }
        ListElement {
            name: "Propagation (Opacité/visibilité)"
            index:2
        }
        ListElement {
            name: "notification"
            index:3
        }
        ListElement {
            name: "acces"
            index:4
        }
        ListElement {
            name: "Ajouter une propriété"
            index:4
        }
        ListElement {
            name: "Ajouter un alias"
            index:4
        }
    }

    Component.onCompleted:
    {
        points = listSection
        anchors.fill = parent
    }
}
