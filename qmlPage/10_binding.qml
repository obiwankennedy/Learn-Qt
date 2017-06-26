import QtQuick 2.0
import QtQuick.Window 2.2

SlidePage {

    id: rectangle1
    anchors.fill: parent
    logo: "qrc:/rsrc/Qt_logo_2015.svg"
    focus: true
    title: "Binding"

    ListModel {
        id: listSection
        ListElement {
            name: "Associé une propriété à une autre"
            index:0
        }
        ListElement {
            name: "javascript"
            index:1
        }
        ListElement {
            name: "Exercise: afficher un carré"
            index:2
        }
    }

    Component.onCompleted:
    {
        points = listSection
        anchors.fill = parent
    }
}
