import QtQuick 2.0
import QtQuick.Window 2.2

SlidePage {

    id: rectangle1
    anchors.fill: parent
    logo: "qrc:/rsrc/logo.png"
    focus: true
    title: "Ajouter du code"

    onIdStateChanged: {
        console.log(idState)
        if(idState == 2)
        {
            slideCode.visible = true;
            slideCode.code ="import QtQuick 2.0

Rectangle {
    id: colorbutton
    width: 200; height: 80;

    color: mousearea.pressed ? \"steelblue\" : \"lightsteelblue\"

    MouseArea {
        id: mousearea
        anchors.fill: parent
    }
}"
            view.opacity = 0
        }
        else   if(idState == 4)
        {
            slideCode.visible = true;
            slideCode.code ="import QtQuick 2.0

Rectangle {
    id: button
    width: 200; height: 80; color: \"lightsteelblue\"

    MouseArea {
        id: mousearea
        anchors.fill: parent

        onPressed: {
            // arbitrary JavaScript expression
            label.text = \"I am Pressed!\"
        }
        onReleased: {
            // arbitrary JavaScript expression
            label.text = \"Click Me!\"
        }

    }

    Text {
        id: label
        anchors.centerIn: parent
        text: \"Press Me!\"
    }
}"
            view.opacity = 0
        }
        else   if(idState == 6)
        {
            slideCode.visible = true;
            slideCode.code ="import QtQuick 2.0

Item {
    function factorial(a) {
        a = parseInt(a);
        if (a <= 0)
            return 1;
        else
            return a * factorial(a - 1);
    }

    MouseArea {
        anchors.fill: parent
        onClicked: console.log(factorial(10))
    }
}"
            view.opacity = 0
        }
        else   if(idState == 8)
        {
            slideCode.visible = true;
            slideCode.code ="import \"factorial.js\" as MathFunctions

Item {
    MouseArea {
        anchors.fill: parent
        onClicked: console.log(MathFunctions.factorial(10))
    }
}"
            view.opacity = 0
        }
        else
        {
            text.textFormat = TextEdit.RichText
            view.opacity = 1
            text.visible = false;
            slideCode.visible = false
            slideCode.focus = false
            view.focus = true

        }

    }



    ListModel {
        id: listSection
        ListElement {
            name: "Le code javascript"
            index:0
        }
        ListElement {
            name: "Binding"
            index:1
        }
        ListElement {
            name: "Répondre à un signal"
            index:3
        }
        ListElement {
            name: "Fonctions"
            index:5
        }
        ListElement {
            name: "Fichier .js"
            index:6
        }
        ListElement {
            name: "plus d’info: http://doc.qt.io/qt-5/qtqml-javascript-expressions.html"
            index:8
        }
        ListElement {
            name: "Exercice: Générateur de nombres aléatoires"
            index:8
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
    CodePage {
        id: slideCode
        visible: false

        x:0
        y:parent.height*0.2
        width: parent.width
        height: parent.height*0.8

    }
    Component.onCompleted:
    {
        points = listSection
        anchors.fill = parent
    }
}
