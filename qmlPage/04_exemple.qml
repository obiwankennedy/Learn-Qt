import QtQuick 2.0
import QtQuick.Window 2.2

SlidePage {

    id: page
    anchors.fill: parent
    logo: "qrc:/rsrc/logo.png"
    focus: true
    title: "Exemple d’utilisation du QML"

    ListModel {
        id: listSection
        ListElement {
            name: "Cette présentation"
            index:0
        }
        ListElement {
            name: "Démos Qt"
            index:1
        }
        ListElement {
            name: "Blizzard Launcher"
            index:2
        }
        ListElement {
            name: "Animation Editor & RobotSettings"
            index: 3
        }
    }

    Component.onCompleted:
    {
        points = listSection
        anchors.fill = parent
    }

    Image {
        id: img
        x: parent.width*0.5
        y: parent.height*0.2
        height: parent.height*0.6
        width: parent.width*0.5
        fillMode: Image.PreserveAspectFit
        source: page.idState == 1 ? "https://doc.qt.io/qt-5.10/images/planets-qml-example.jpg" : "http://overwatch.blizzplanet.com/wp-content/uploads/2015/08/overwatch-beta-icon-in-battle-launcher.png"
        visible: page.idState == 1 ? true : page.idState == 2 ? true : false
    }

    Image {
        id: img2
        x: parent.width*0.5
        y: parent.height*0.2
        height: parent.height*0.6
        width: parent.width*0.5
        fillMode: Image.PreserveAspectFit
        // TODO add image for robotsettings & animeditor
        source: ""
        visible: (page.idState == 3)
    }
}
