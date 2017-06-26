import QtQuick 2.0
import QtQuick.Window 2.2

SlidePage {

    id: rectangle1
    anchors.fill: parent
    logo: "qrc:/rsrc/Qt_logo_2015.svg"
    focus: true
    title: "Historique"

    ListModel {
        id: listSection
        ListElement {
            name: "QML : Qt Modeling Language"
            index:0
        }
        ListElement {
            name: "1er sortie : 2009 Qt4.X"
            index:1
        }
        ListElement {
            name: "QtQuick 1 (Qt4)"
            index:2
        }
        ListElement {
            name: "QtQuick 2 (Qt5)"
            index:3
        }
    }

    Component.onCompleted:
    {
        points = listSection
        anchors.fill = parent
    }
}