import QtQuick 2.0
import QtQuick.Window 2.2

SlidePage {

    id: rectangle1
    anchors.fill: parent
    logo: "qrc:/rsrc/logo.png"
    focus: true
    title: "Debug QML"
    point: ListModel {
        id: listSection
        ListElement {
            name: "Qml parser"
            index:1
        }
        ListElement {
            name: "qmljsdebugger"
            index:2
        }
		ListElement {
			name: "kdab - GammaRay"
			index: 3
		}
        ListElement {
            name: "Test unitaire avec QtTest 1.12"
			index: 4
        }
        ListElement {
            name: "Astuces"
            index: 5
        }
        ListElement {
            name: "Exercice: Faire un dossier avec 2 composants QML. Une regle et un tracker de property"
			index: 6
        }
    }

    Component.onCompleted:
    {
        //points = listSection
        anchors.fill = parent
    }
}
