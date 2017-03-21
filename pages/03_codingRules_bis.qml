import QtQuick 2.0
import QtQuick.Window 2.2

SlidePage {
    id: jdr
    anchors.fill: parent
    logo: "qrc:/rsrc/Qt_logo_2015.svg"
    focus: true
    title: "Coding Rules (2/2)"

    points: ListModel {
            ListElement {
                name: "Doxy Comments <a href=\"https://raw.githubusercontent.com/Rolisteam/DiceParser/master/diceparser.h\">Example</a>"
                index:0
            }
            ListElement {
                name: "Instruction block (Allman/BSD Style)"
                index:1
            }
            ListElement {
                name: "Qt containers vs STL..."
                index:2
            }
            ListElement {
                name: "Complexity; 200 lines/functions, small path number in function"
                index:3
            }
            ListElement {
                name: "Exercice: 01 codingRule"
                index:4
            }
    }
    TextEdit {
        id: text
        readOnly: true
        text:""
        visible: false
        anchors.fill: view
        color: "white"
        font.pixelSize: parent.height*0.03
        textFormat: TextEdit.RichText


    }
}
