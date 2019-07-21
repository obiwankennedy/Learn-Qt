import QtQuick 2.0

SlidePage {
    id: intro
    anchors.fill: parent
    logo: "qrc:/rsrc/logo.png"
    focus: true
    title: "Qt and PIV : the love story"

    ListModel {
        id: listSection
                ListElement {
                    name: "Coding Rules"
                    index:0
                }
                ListElement {
                    name: "Bad Examples"
                    index:1
                }
                ListElement {
                    name: "MVC"
                    index:2
                }
                ListElement {
                    name: "Events and Signals/Slots"
                    index:3
                }
                ListElement {
                    name: "QThread"
                    index:4
                }
                ListElement {
                    name: "Deployment"
                    index:5
                }
                ListElement {
                    name: "Internationalisation"
                    index:6
                }
                ListElement {
                    name: "Third Part"
                    index:7
                }
                ListElement {
                    name: "Tcp Socket"
                    index:8
                }
    }

    Component.onCompleted:
    {
        points = listSection
        anchors.fill = parent
    }
}
