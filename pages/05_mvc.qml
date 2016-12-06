import QtQuick 2.0
import QtQuick.Window 2.2

SlidePage {
    id: rectangle1
    anchors.fill: parent
    logo: "qrc:/rsrc/Qt_logo_2015.svg"
    focus: true
    title: "Model/View/Controler"

    ListModel {
        id: listSection
                ListElement {
                    name: "MVC"
                    index:0
                }
                ListElement {
                    name: "FAQ"
                    index:1
                }
                ListElement {
                    name: "C++"
                    index:2
                }
                ListElement {
                    name: "QML"
                    index:3
                }
                ListElement {
                    name: "QML et C++"
                    index:4
                }
                ListElement {
                    name: "Exercice: 03 mvc"
                    index:4
                }
    }

    Component.onCompleted:
    {
        points = listSection
        anchors.fill = parent
    }
}
