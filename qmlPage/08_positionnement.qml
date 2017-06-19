import QtQuick 2.0
import QtQuick.Window 2.2

SlidePage {

    id: rectangle1
    anchors.fill: parent
    logo: "qrc:/rsrc/Qt_logo_2015.svg"
    focus: true
    title: "Le positionnement"

    ListModel {
        id: listSection
        ListElement {
            name: "3 types de positionnement"
            index:0
        }
        ListElement {
            name: "Relatif au parent"
            index:1
        }
        ListElement {
            name: "Ancre"
            index:2
        }
        ListElement {
            name: "Positionner: Flow, Column, Grid, Row"
            index:3
        }
        ListElement {
            name: "Layout: ColumnLayout, GridLayout, RowLayout, StackLayout"
            index:3
        }
    }

    Component.onCompleted:
    {
        points = listSection
        anchors.fill = parent
    }
}
