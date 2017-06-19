import QtQuick 2.0
import QtQuick.Window 2.2

SlidePage {

    id: rectangle1
    anchors.fill: parent
    logo: "qrc:/rsrc/Qt_logo_2015.svg"
    focus: true
    title: "Multimedia"

    ListModel {
        id: listSection
        ListElement {
            name: "Jouer un son"
            index:0
        }
        ListElement {
            name: "Lecteur audio"
            index:1
        }
        ListElement {
            name: "Lecteur vidéo"
            index:2
        }
    }

    Component.onCompleted:
    {
        points = listSection
        anchors.fill = parent
    }
}
