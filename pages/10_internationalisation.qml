import QtQuick 2.0
import QtQuick.Window 2.2

SlidePage {
    id: rectangle1
    anchors.fill: parent
    logo: "qrc:/rsrc/Qt_logo_2015.svg"
    focus: true
    title: "Internationalisation"

    ListModel {
        id: listSection
        ListElement {
            name: "Prepare source code"
            index:0
        }
        ListElement {
            name: "C++"
            index:1
        }
        ListElement {
            name: "QML"
            index:2
        }
        ListElement {
            name: "Translation"
            index:3
        }
        ListElement {
            name: "Make Translation Binaries"
            index:4
        }
        ListElement {
            name: "Integration into .pro"
            index:5
        }
    }

    Component.onCompleted:
    {
        points = listSection
        anchors.fill = parent
    }
}
