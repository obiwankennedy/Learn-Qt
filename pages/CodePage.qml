import QtQuick 2.0
import QtQuick.Window 2.2

Item {
    id: root
    visible: false

    x:0
    y:parent.height*0.2
    width: parent.width
    height: parent.height*0.8

    property string codeFontFamily: "Helvetica";
    property string code;
    property real codeFontSize: parent.height*0.03;
    property color textColor: "white";



    Rectangle {
        id: background
        anchors.fill: parent
        radius: height / 10;
        gradient: Gradient {
            GradientStop { position: 0; color: Qt.rgba(0.8, 0.8, 0.8, 0.5); }
            GradientStop { position: 1; color: Qt.rgba(0.2, 0.2, 0.2, 0.5); }
        }
        border.color: "white";
        border.width: height / 250;
        antialiasing: true
    }

    onCodeChanged: {
        listModel.clear();
        var codeLines = slideCode.code.split("\n");
        for (var i=0; i<codeLines.length; ++i) {
            listModel.append({
                                line: i,
                                code: codeLines[i]
                             });
        }
    }



    ListModel {
        id: listModel
    }


    onVisibleChanged: {
        listView.currentIndex = -1;
    }

    ListView {
        id: listView;

        anchors.fill: parent;
        anchors.margins: background.radius / 2
        clip: true

        model: listModel;
        focus: false;

        MouseArea {
            anchors.fill: parent
            onClicked: {
                listView.focus = true;
                listView.currentIndex = listView.indexAt(mouse.x, mouse.y + listView.contentY);
            }

        }

        delegate: Item {

            id: itemDelegate

            height: lineLabel.height
            width: parent.width

            Rectangle {
                id: lineLabelBackground
                width: lineLabel.height * 3;
                height: lineLabel.height;
                color: slideCode.textColor;
                opacity: 0.1;
            }

            Text {
                id: lineLabel
                anchors.right: lineLabelBackground.right;
                text: (line+1) + ":"
                color: slideCode.textColor;
                font.family: slideCode.codeFontFamily
                font.pixelSize: slideCode.codeFontSize
                font.bold: itemDelegate.ListView.isCurrentItem;
                opacity: itemDelegate.ListView.isCurrentItem ? 1 : 0.9;

            }

            Rectangle {
                id: lineContentBackground
                anchors.fill: lineContent;
                anchors.leftMargin: -height / 2;
                color: slideCode.textColor
                opacity: 0.2
                visible: itemDelegate.ListView.isCurrentItem;
            }

            Text {
                id: lineContent
                anchors.left: lineLabelBackground.right
                anchors.leftMargin: lineContent.height;
                anchors.right: parent.right;
                color: slideCode.textColor;
                text: code;
                font.family: slideCode.codeFontFamily
                font.pixelSize: slideCode.codeFontSize
                font.bold: itemDelegate.ListView.isCurrentItem;
                opacity: itemDelegate.ListView.isCurrentItem ? 1 : 0.9;
            }
        }
    }

}
