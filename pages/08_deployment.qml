import QtQuick 2.0
import QtQuick.Window 2.2

SlidePage {
    id: rectangle1
    anchors.fill: parent
    logo: "qrc:/rsrc/Qt_logo_2015.svg"
    focus: true
    title: "Deployment"

    ListModel {
        id: listSection
        ListElement {
            name: "Global information"
            index:0
        }
        ListElement {
            name: "For Linux"
            index:1
        }
        ListElement {
            name: "For Windows"
            index:2
        }
        ListElement {
            name: "For MacOs"
            index:3
        }
        ListElement {
            name: "For Android"
            index:4
        }
    }

    Component.onCompleted:
    {
        points = listSection
        anchors.fill = parent
    }
}
