import QtQuick 2.0
import QtQuick.Window 2.2

SlidePage {
    id: badexample
    anchors.fill: parent
    logo: "qrc:/rsrc/Qt_logo_2015.svg"
    focus: true
    title: "Bad Example"
    onIdStateChanged: {
        if(idState == 2)
        {
            panel.visible = true
            view.opacity = 0
        }
        else if(idState == 3)
        {
            panel.visible = false
            slideCode.visible = true;
            slideCode.code =" Column {
            Text{
                id: massageBox
                text:\"Button has not been clicked\"
            }
            Rectangle {
                id: button
                implicitWidth: buttonText.implicitWidth + 20
                implicitHeight: buttonText.implicitHeight + 10
                radius: 5
                color: \"lightblue\"
                Text {
                    id:buttonText
                    anchors.centerIn: parent
                    text: \"Click me!\"
                    color: \"white\"
                }
                MouseArea {
                    id: mousearea
                    anchors.fill: parent
                    onClicked:  massageBox.text=\"I have been clicked\"

                }
            }
}"
            view.opacity = 0
        }
        else if(idState == 5)
        {
            panel.visible = false
            slideCode.visible = true;
            slideCode.code =" Column {
            Text{
                id: massageBox
                text:\"Button has not been clicked\"
            }

            MyButton {
                id: button
            }
}"
            view.opacity = 0
        }
        else if(idState == 6)
        {
            panel.visible = false
            slideCode.visible = true;
            slideCode.code =" Rectangle {
    id: button
    implicitWidth: buttonText.implicitWidth + 20
    implicitHeight: buttonText.implicitHeight + 10
    radius: 5
    color: \"lightblue\"
    Text {
        id:buttonText
        anchors.fill: parent
        text: \"Click me!\"
        color: \"white\"
    }
    MouseArea {
        id: mousearea
        anchors.fill: parent
        onClicked:  massageBox.text=\"I have been clicked\"

    }
}
"
            view.opacity = 0
        }
        else if(idState == 8)
        {
            panel.visible = false
            slideCode.visible = true;
            slideCode.code =" Column {
            Text{
                id: messageBox
                text:\"Button has not been clicked\"
            }

            MyButton {
                id: button
            }
}"
            view.opacity = 0
        }
        else if(idState == 11)
        {
            text.textFormat = TextEdit.RichText
            text.visible = true;
            panel.visible = false
            slideCode.visible = false;
            text.text ="<ul>
<li>Inter-dependencies between components/files</li>
<li>Impossible to find all instances with a text editor</li>
<li>Editing any file means having all components in your head</li>
<li>Slows down development and introduces subtle bugs</li>
</ul>"
            view.opacity = 0
        }
        else if(idState == 13)
        {
            panel.visible = false
            slideCode.visible = true;
            slideCode.code =" Rectangle {
                id: root
                signal clicked()
                Text {
                    id:buttonText
                }
                MouseArea {
                    id: mousearea
                    anchors.fill: parent
                    onClicked:  root.clicked()
                }
            }"
            view.opacity = 0
        }
        else if(idState == 13)
        {
            panel.visible = false
            slideCode.visible = true;
            slideCode.code ="Column {
    Text{
        id: messageBox
        text:\"Button has not been clicked\"
    }

    MyButton {
        id: button
        onClicked: messageBox.text = \"I have been clicked\"
    }
}"
            view.opacity = 0
        }
        else
        {
            text.textFormat = TextEdit.RichText
            view.opacity = 1
            text.visible = false;
            panel.visible = false;
            slideCode.visible = false
            view.focus = false
        }
    }

    points: ListModel {
            ListElement {
                name: "Good code"
                index:0
            }
            ListElement {
                name: "Simple Application"
                index:1
            }
            ListElement {
                name: "Split button into separate Component"
                index:4
            }
            ListElement {
                name: "Fix Typo in ID"
                index:7
            }
            ListElement {
                name: "It's broken! Which commit caused it?"
                index:9
            }
            ListElement {
                name: "Why is this a problem ?"
                index:10
            }
            ListElement {
                name: "Good practices"
                index:12
            }
    }
    Rectangle {
        id: panel
        anchors.fill: parent
        color:"white"
        visible: false
        Column {
            id: panelCol
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            width: 800
            Text{
                id: massageBox
                text:"Button has not been clicked"
                font.pixelSize: badexample.height * 0.05
            }

            Rectangle {
                id: button
                implicitWidth: buttonText.implicitWidth + 20
                implicitHeight: buttonText.implicitHeight + 10
                radius: 5
                color: "lightblue"
                Text {
                    id:buttonText
                    anchors.centerIn: parent
                    horizontalAlignment: Text.alignHCenter
                    text: "Click me!"
                    color: "white"
                    font.pixelSize: badexample.height * 0.05
                }
                MouseArea {
                    id: mouseare
                    anchors.fill: parent
                    onClicked:  massageBox.text="I have been clicked"

                }
            }

        }
}
    TextEdit {
        id: text
        readOnly: true
        text:""
        visible: false
        anchors.fill: view
        color: "white"
        font.pixelSize: parent.height*0.05
        textFormat: TextEdit.RichText

    }

    Item {
        id: slideCode;
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
            focus: true;

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

}
