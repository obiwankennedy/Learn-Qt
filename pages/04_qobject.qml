import QtQuick 2.0
import QtQuick.Window 2.2

SlidePage {

    id: rectangle1
    anchors.fill: parent
    logo: "qrc:/rsrc/Qt_logo_2015.svg"
    focus: true
    title: "QObject"

    ListModel {
        id: listSection
        ListElement {
            name: "Particularity ?"
            index:0
        }
        ListElement {
            name: "Parent / Memory management"
            index:1
        }
        ListElement {
            name: "Introspection"
            index:2
        }
        ListElement {
            name: "Exercice"
            index:3
        }//gaethan ledouget 203848 (pas dispo) , luigi jacques - 207060, georges rapaud 209952, b12 didier victor 208985
        //Anthony Jupilliat,
    }

    Component.onCompleted:
    {
        points = listSection
        anchors.fill = parent
    }
}
