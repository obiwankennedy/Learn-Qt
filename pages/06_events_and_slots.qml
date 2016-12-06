import QtQuick 2.0
import QtQuick.Window 2.2

SlidePage {
    id: rectangle1
    anchors.fill: parent
    logo: "qrc:/rsrc/Qt_logo_2015.svg"
    focus: true
    title: "Events and Signals and Slots"

    ListModel {
        id: listSection
                ListElement {
                    name: "Events"
                    index:0
                }
    }

    Component.onCompleted:
    {
        points = listSection
        anchors.fill = parent
    }
}