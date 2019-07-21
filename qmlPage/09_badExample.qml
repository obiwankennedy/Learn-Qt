import QtQuick 2.0
import QtQuick.Window 2.2

SlidePage {
    id: badexample
    anchors.fill: parent
    logo: "qrc:/rsrc/logo.png"
    focus: true
    title: "Mauvais exemple"
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
                MouseArea {
                    id: mousearea
                    anchors.fill: parent
                    onClicked:  massageBox.text=\"I have been clicked\"

                }
                Text {
                    id:buttonText
                    anchors.centerIn: parent
                    text: \"Click me!\"
                    color: \"white\"
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
            text.wrapMode = TextEdit.WordWrap
            text.visible = true;
            panel.visible = false
            slideCode.visible = false;
            text.text ="<ul>
<li>Inter-dépendences entre les composants/fichiers</li>
<li>Impossible de trouver toutes les instances avec un IDE</li>
<li>Modifier tous les composants signifie avoir tous les composants en tête.</li>
<li>Cela ralentit le dev et introduit des bugs vicieux</li>
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
                name: "Un bon code ?"
                index:0
            }
            ListElement {
                name: "Une application simple"
                index:1
            }
            ListElement {
                name: "Séparer le bouton dans un composant"
                index:4
            }
            ListElement {
                name: "Corriger la faute d’orthographe"
                index:7
            }
            ListElement {
                name: "Cassé! Quel modification à causer le problème ?"
                index:9
            }
            ListElement {
                name: "Pourquoi c’est un problème ?"
                index:10
            }
            ListElement {
                name: "Bonnes partiques"
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
        width: view.width*0.8

    }

    CodePage {
        id: slideCode
        visible: false

        x:0
        y:parent.height*0.2
        width: parent.width
        height: parent.height*0.8

    }
}
