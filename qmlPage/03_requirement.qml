import QtQuick 2.0
import QtQuick.Window 2.2

SlidePage {

    id: rectangle1
    anchors.fill: parent
    logo: "qrc:/rsrc/logo.png"
    focus: true
    title: "Pré-requis"

    ListModel {
        id: listSection
        ListElement {
            name: "QtCreator ~v4.3"
            index:0
        }
        ListElement {
            name: "Qt5.9"
            index:1
        }
        ListElement {
            name: "Les slides: https://github.com/obiwankennedy/Learn-Qt.git"
            index:2
        }
        ListElement {
            name: "Les exercices: https://github.com/obiwankennedy/TrainingExercices.git"
            index:3
        }
    }

    Component.onCompleted:
    {
        points = listSection
        anchors.fill = parent
    }
}
