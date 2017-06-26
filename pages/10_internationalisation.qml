import QtQuick 2.0
import QtQuick.Window 2.2

SlidePage {
    id: rectangle1
    anchors.fill: parent
    logo: "qrc:/rsrc/logo.png"
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
    CodePage {
        id: slideCode
        visible: false

        x:0
        y:parent.height*0.2
        width: parent.width
        height: parent.height*0.8

    }
    Component.onCompleted:
    {
        points = listSection
        anchors.fill = parent
    }
}
