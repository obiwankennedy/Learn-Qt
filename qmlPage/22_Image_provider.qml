import QtQuick 2.0
import QtQuick.Window 2.2

SlidePage {

    id: rectangle1
    anchors.fill: parent
    logo: "qrc:/rsrc/Qt_logo_2015.svg"
    focus: true
    title: "Image provider"

    ListModel {
        id: listSection
        ListElement {
            name: "Définition"
            index:0
        }
        ListElement {
            name: "Comment cela marche ?"
            index:1
        }
        ListElement {
            name: "L’utilisation"
            index:2
        }
        ListElement {
            name: "Le gain ?"
            index:3
        }
    }

    Component.onCompleted:
    {
        points = listSection
        anchors.fill = parent
    }
}
