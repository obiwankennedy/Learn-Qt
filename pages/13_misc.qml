import QtQuick 2.0
import QtQuick.Window 2.2

SlidePage {
    id: rectangle1
    anchors.fill: parent
    logo: "qrc:/rsrc/Qt_logo_2015.svg"
    focus: true
    title: "Miscellenous"

    ListModel {
        id: listSection
        ListElement {
            name: "DBus <a href=\"http://renaudguezennec.eu/index.php/2011/03/10/introduction-a-dbus-avec-qt4/\">Tutorial</a>"
            index:0
        }
        ListElement {
            name: "QSettings"
            index:1
        }
        ListElement {
            name: "JSon"
            index:2
        }
        ListElement {
            name: "Exercices"
            index:3
        }
    }
    Component.onCompleted:
    {
        points = listSection
        anchors.fill = parent
    }

}
