import QtQuick 2.0
import QtQuick.Window 2.2

SlidePage {

    id: rectangle1
    anchors.fill: parent
    logo: "qrc:/rsrc/logo.png"
    focus: true
    title: "Faq"
    ListModel {
        id: listSection
        ListElement {
            name: "Avantages du QML par rapport à Qt Widgets ? (complexité ? rapidité ?)"
            index:1
        }
        ListElement {
            name: "Interface dynamique en QML ?"
            index:2
        }
        ListElement {
            name: "HS: communiquer avec Pepper en C++?"
            index:3
        }
		ListElement {
			name: "Charte graphique, Bibliothèque QML pour SBR?"
			index: 4
		}
        ListElement {
			name: "QML pour pepper ?"
            index: 5
		}
        ListElement {
            name: "Outil pour debugger du QML ?"
            index: 6
        }
    }

    ListView {
        id: listOfPerson
        model: listperson
        anchors.top: view.top
        anchors.left: view.right
        anchors.right: parent.right
        height: 200
        delegate: Rectangle {
            color: colorItem
            width: 100
            height: 40
            Text {
                text: name
            }
        }
        visible: idState === 0 ? true : false
    }
    GridView {
        id: gridOfPerson
        model: listperson
        anchors.top: listOfPerson.bottom
        anchors.left: view.right
        width: 300;
        height: 200
        cellWidth: 100;
        cellHeight: 100
        delegate: Rectangle {
            color: colorItem
            width: gridOfPerson.cellWidth;
            height: gridOfPerson.cellHeight
            Text {
                text: name
            }
        }
        visible: idState == 2 ? true : false
    }
    PathView {
        id: pathOfPerson
        model: listperson
        anchors.top: gridOfPerson.bottom
        anchors.left: view.right
        anchors.right: parent.right
        interactive: true
        path: Path {
                      startX: 200; startY: 150
                      PathQuad { x: 200; y: 25; controlX: 440; controlY: 125 }
                      PathQuad { x: 200; y: 150; controlX: -40; controlY: 125 }
                  }
        focus: true
        Keys.onLeftPressed: {
            decrementCurrentIndex()
        }
        Keys.onRightPressed: {
            incrementCurrentIndex()
        }

        delegate: Rectangle {
            color: colorItem
            width: 100
            height: 100
            Text {
                text: name
            }
            MouseArea {
                anchors.fill: parent
                onClicked:  pathOfPerson.currentIndex = index;
            }
        }
        visible: idState === 4 ? true : false
    }

    Component.onCompleted:
    {
        points = listSection
        anchors.fill = parent
    }
}
